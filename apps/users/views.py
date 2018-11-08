from django.shortcuts import render, redirect, get_object_or_404, get_list_or_404, HttpResponse
from django.contrib.auth import authenticate, login
# Create your views here.
from django.contrib.auth.backends import ModelBackend
from .models import UserProfile
from django.db.models import Q
from django.views.generic.base import View
from . import forms, models
from django.contrib.auth.hashers import make_password
from django.urls import reverse
from utils.email_send import send_mx_email
from utils.mixin_utils import LoginRequiredMixin
from users.forms import UploadImageForm, ModifyPwdForm, UserInfoForm
import json
from operation import models as opmodel
from courses.models import CourseOrg, Teacher, Course
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger


class CustomBackend(ModelBackend):
    """
    自定义认证
    """
    # 继承ModelBackend 重载authenticate方法，使得邮件账户也能登陆
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            # 返回0个和2个  get都会失败
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):  # 检查密码是否正确
                return user
        except Exception as e:
            return None


class LoginView(View):
    """
    登陆视图
    """
    def get(self, request):
        return render(request, 'login.html')

    def post(self, request):
        login_form = forms.LoginForm(request.POST)
        if login_form.is_valid():
            user_name = login_form.cleaned_data.get("username", "")
            pass_word = login_form.cleaned_data.get("password", "")
            user = authenticate(username=user_name, password=pass_word) # 如果forms验证成功就尝试登陆验证
        else:
            return render(request, 'login.html', {'login_form': login_form})

        if user is not None:  # 认证成功
            if user.is_active:
                # 用户已经激活就尝试登陆
                login(request, user)

                # if 'next' in request.path:
                #     redirect_url = request.path[request.path.index("next")+1:]
                # else:
                #     redirect_url = '/'

                return redirect('/')
            else:
                return render(request, 'login.html', {'msg': '账号未激活成功'})
        else:  # 认证失败
            return render(request, 'login.html', {'msg': '账号或密码错误'})


class LoginOutView(View):
    def get(self, request):
        pass


class RegisterView(View):
    """
    注册视图
    """
    def get(self, request):
        register_form = forms.RegisterForm()
        return render(request, 'register.html',{'register_form': register_form})

    def post(self, request):
        register_form = forms.RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = register_form.cleaned_data.get("email", "")
            # 检查是否已经被注册过
            if models.UserProfile.objects.filter(email=user_name):
                return render(request, 'register.html', {'register_form': register_form, 'msg': '该账号已经被注册过'})
            pass_word = register_form.cleaned_data.get("password", "")
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_name
            user_profile.is_active = False
            # 密码要用加密
            user_profile.password = make_password(pass_word)
            send_mx_email(email=user_name, send_type='register')
            user_profile.save()
            # 注册完成 发送到平台个人中心消息
            user_message = opmodel.UserMessage()
            user_message.user = user_profile.id
            user_message.message = "欢迎注册在线慕学网，开启你的学习之旅吧!!"
            user_message.save()

            return redirect(reverse("index"))
        else:
            return render(request, 'register.html', {'register_form': register_form})


class ActiveUserView(View):
    """
    激活用户视图函数
    """
    def get(self, request, active_code):
        # 取出所有符合验证码的记录 如果查询不到 激活链接肯定是假的 直接返回404
        record_list = get_list_or_404(models.EmailVerifyRecord,code= active_code)
        msg = ''

        for record in record_list:
            email = record.email
            # 根据邮箱 去查用户表中 未激活的用户
            try:
                user = models.UserProfile.objects.get(email=email, is_active=False)
                user.is_active = True
                user.save()
                msg = '用户激活成功，请登录!'
            except models.UserProfile.DoesNotExist:
                msg = '你的账户已是激活状态！'

        return render(request, 'login.html', {'msg': msg})


class ForgetPwdView(View):
    """
    忘记密码显示页面
    """
    def get(self, request):
        forget_from = forms.ForgetForm()
        return render(request, "forgetpwd.html", {"forget_from": forget_from})

    def post(self, request):
        forget_form = forms.ForgetForm(request.POST)
        # form验证合法情况下取出email,从clean data中取
        if forget_form.is_valid():
            email = forget_form.cleaned_data.get("email", "")
            # 发送找回密码邮件
            send_mx_email(email, "forget")
            # 发送完毕返回登录页面并显示发送邮件成功。
            return render(request, "login.html", {"msg": "重置密码邮件已发送,请注意查收"})
        # 如果表单验证失败也就是他验证码输错等。
        else:
            return render(request, "forgetpwd.html", {"forget_from": forget_form})


class ResetView(View):
    """
    重置密码显示页面函数
    """
    def get(self, request, reset_code):
        # 查询生成的随机字符串 和对应的email
        record_list = get_object_or_404(models.EmailVerifyRecord, code=reset_code)

        return render(request, 'password_reset.html', {'reset_code': reset_code})


class ModifyPwdView(View):
    """
    修改密码操作视图
    """
    def post(self, request):
        modifypwd_form = forms.ModifyPwdForm(request.POST)
        if modifypwd_form.is_valid():
            # 两次密码是否一致验证已经在form检测中 验证
            password = modifypwd_form.cleaned_data.get("password")
            # 从前端取到resetcode这样定位到是谁在重置密码
            reset_code = request.POST.get("reset_code")
            # 如果重置reset code是伪造的 取不到object 直接给他返回404 干嘛还给他友好显示！！！
            email_obj = get_object_or_404(models.EmailVerifyRecord, code=reset_code)
            # 从记录验证码表中取出对应的email 去寻找user
            user = models.UserProfile.objects.get(email=email_obj.email)
            user.password = make_password(password)
            user.save()
            return render(request, 'login.html',{'msg':'密码重置成功！请登录'})
        else:
            reset_code = request.POST.get("reset_code")
            return render(request, 'password_reset.html', {'reset_code': reset_code, 'modifypwd_form':modifypwd_form})


class UserInfoView(LoginRequiredMixin, View):
    """
    用户信息视图
    """
    def get(self, request):
        return render(request, 'usercenter-info.html')

    def post(self, request):
        user_info_form = UserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(user_info_form.errors), content_type='application/json')


class UploadImageView(LoginRequiredMixin, View):
    """
    上传头像处理视图
    """
    def post(self, request):
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            image_form.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail"}', content_type='application/json')


class UpdatePwdView(LoginRequiredMixin, View):
    """
    个人中心修改用户密码
    """
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        # 我把两次密码是否相同验证放在clean方法内了
        if modify_form.is_valid():
            password = modify_form.cleaned_data.get("password")
            user = request.user
            user.password = make_password(password)
            user.save()

            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            # 两次密码不一致会在这里返回的
            return HttpResponse(json.dumps(modify_form.errors), content_type='application/json')


class SendEmailCodeView(LoginRequiredMixin, View):
    """
    发送邮箱验证码视图
    """
    def get(self, request):
        email = request.GET.get('email', '')

        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已存在"}', content_type='application/json')

        send_mx_email(email, 'update_email')
        return HttpResponse('{"status":"success"}', content_type='application/json')


class UpdateEmailView(LoginRequiredMixin, View):
    """
    修改邮箱视图
    """
    def get(self, request):
        email = request.POST.get("email", "")
        code = request.POST.get("code", "")

        existed_records = models.EmailVerifyRecord.objects.filter(email=email, code=code, send_type='update_email')
        if existed_records:
            user = request.user
            user.email = email
            user.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"email":"验证码无效"}', content_type='application/json')


class MyCourseView(LoginRequiredMixin, View):
    def get(self, request):
        user_courses = opmodel.UserCourse.objects.filter(user=request.user)
        return render(request, "usercenter-mycourse.html", {
            "user_courses": user_courses,
        })


class MyFavOrgView(LoginRequiredMixin, View):
    """
    我收藏的课程机构
    """

    def get(self, request):
        org_list = []
        fav_orgs = opmodel.UserFavorite.objects.filter(user=request.user, fav_type=2)
        # 上面的fav_orgs只是存放了id。我们还需要通过id找到机构对象
        for fav_org in fav_orgs:
            # 取出fav_id也就是机构的id。
            org_id = fav_org.fav_id
            # 获取这个机构对象
            org = CourseOrg.objects.get(id=org_id)
            org_list.append(org)
        return render(request, "usercenter-fav-org.html", {
            "org_list": org_list,
        })


class MyFavTeacherView(LoginRequiredMixin, View):
    """
    我收藏的授课讲师
    """
    def get(self, request):
        teacher_list = []
        fav_teachers = opmodel.UserFavorite.objects.filter(user=request.user, fav_type=3)
        for fav_teacher in fav_teachers:
            teacher_id = fav_teacher.fav_id
            teacher = Teacher.objects.get(id=teacher_id)
            teacher_list.append(teacher)
        return render(request, "usercenter-fav-teacher.html", {
            "teacher_list": teacher_list,
        })


class MyFavCourseView(LoginRequiredMixin, View):
    """
    我收藏的公开课程
    """
    def get(self, request):
        course_list = []
        fav_courses = opmodel.UserFavorite.objects.filter(user=request.user, fav_type=1)
        for fav_course in fav_courses:
            course_id = fav_course.fav_id
            course = Course.objects.get(id=course_id)
            course_list.append(course)

        return render(request, 'usercenter-fav-course.html', {
            "course_list": course_list,
        })


class MyMessageView(LoginRequiredMixin, View):
    def get(self, request):
        all_message = opmodel.UserMessage.objects.filter(user=request.user.id)

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_message, 4, request=request)
        messages = p.page(page)
        return render(request, "usercenter-message.html", {
            "messages": messages,
        })