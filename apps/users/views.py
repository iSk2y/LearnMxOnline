from django.shortcuts import render, redirect, get_object_or_404, get_list_or_404
from django.contrib.auth import authenticate, login
# Create your views here.
from django.contrib.auth.backends import ModelBackend
from .models import UserProfile
from django.db.models import Q
from django.views.generic.base import View
from . import forms,models
from django.contrib.auth.hashers import make_password
from django.urls import reverse
from utils.email_send import send_mx_email


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
                return redirect('/')
            else:
                return render(request, 'login.html', {'msg': '账号未激活成功'})
        else:  # 认证失败
            return render(request, 'login.html', {'msg': '账号或密码错误'})


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
            pass_word = register_form.cleaned_data.get("password", "")
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_name
            user_profile.is_active = False
            # 密码要用加密
            user_profile.password = make_password(pass_word)
            send_mx_email(email=user_name, send_type='register')
            user_profile.save()
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





