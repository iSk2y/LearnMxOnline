from django.shortcuts import render, get_object_or_404
from django.http import JsonResponse, HttpResponse
from django.views.generic.base import View
from organization import models
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from organization import forms
from operation.models import UserFavorite
from courses.models import Course, CourseOrg
from django.db.models import Q
# Create your views here.


class OrgListView(View):
    def get(self, request):
        org_list = models.CourseOrg.objects.all()
        citys_list = models.CityDict.objects.all()
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            # 在name字段进行操作,做like语句的操作。i代表不区分大小写
            # or操作使用Q
            org_list = org_list.filter(Q(name__icontains=search_keywords) | Q(desc__icontains=search_keywords))
        # city和category筛选
        try:  # 如果不是数字，肯定是非法字符了 直接给空吧
            city_id = int(request.GET.get("city", ""))
        except ValueError:
            city_id = ""
        category_id = request.GET.get("ct", "")

        if city_id:
            org_list = org_list.filter(city_id=city_id)
        if category_id:
            org_list = org_list.filter(category=category_id)

        # 学习人生和课程人数筛选
        sort = request.GET.get("sort", "")
        if sort:
            if sort == 'students':
                org_list = org_list.order_by("-students")
            elif sort == 'courses':
                org_list = org_list.order_by("-course_nums")

        org_sum = org_list.count()
        # 热门机构排名
        hot_orgs = org_list.order_by("-click_nums")[:3]
        # 尝试获取前台get请求传递过来的page参数
        # 如果是不合法的配置参数默认返回第一页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger as e:
            page = 1
        p = Paginator(org_list, 5, request=request)
        orgs = p.page(page)
        return render(request, 'org_list.html', {
            'org_list': orgs,
            'citys_list': citys_list,
            'org_sum': org_sum,
            'city_id': city_id,
            'category': category_id,
            'hot_orgs': hot_orgs,
            'sort': sort,

            }
        )


class AddUserAskView(View):
    """
    我要学习模块
    """
    def post(self, request):
        userask_form = forms.UserAskForm(request.POST)
        if userask_form.is_valid():
            # 如果验证通过 就存入数据库中
            userask_form.save(commit=True)
            return JsonResponse({"status": "success", "msg": "咨询成功，请等待回复"})
        else:
            return JsonResponse({"status": "fail", "msg": '咨询失败，稍后再试'})


class OrgHomeView(View):
    """
    机构首页
    """
    def get(self, request, org_id):
        page_name = 'home'
        course_org = get_object_or_404(models.CourseOrg, pk=int(org_id))
        course_org.click_nums += 1
        course_org.save()

        all_course = course_org.course_set.all()[:4]
        all_teacher = course_org.teacher_set.all()[:2]
        # 判断收藏状态
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'org-detail-homepage.html',{
            'all_courses': all_course,
            'all_teachers': all_teacher,
            'current_org': course_org,
            'page_name': page_name,
            'has_fav': has_fav
        })


class OrgCourseView(View):
    """
    机构课程页面
    """
    def get(self, request, org_id):
        page_name = 'course'
        course_org = get_object_or_404(models.CourseOrg, pk=int(org_id))
        all_course = course_org.course_set.all()
        # 判断收藏状态
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'org-detail-course.html', {
            'all_courses': all_course,
            'current_org': course_org,
            'page_name': page_name,
            'has_fav': has_fav
        })


class OrgDescView(View):
    def get(self, request, org_id):
        page_name = 'desc'
        course_org = get_object_or_404(models.CourseOrg, pk=int(org_id))
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'org-detail-desc.html', {
            'current_org': course_org,
            'page_name': page_name,
            'has_fav': has_fav
        })


class OrgTeacherView(View):
    def get(self, request, org_id):
        page_name = 'teacher'
        course_org = get_object_or_404(models.CourseOrg, pk=int(org_id))
        all_teacher = course_org.teacher_set.all()
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'org-detail-teachers.html', {
            'all_teachers': all_teacher,
            'current_org': course_org,
            'page_name': page_name,
            'has_fav': has_fav
        })


class AddFavView(View):
    """
    用户收藏与取消收藏功能
    """
    def post(self, request):
        # 表明你收藏的不管是课程，讲师，还是机构。他们的id
        # 默认值取0是因为空串转int报错
        fav_id = request.POST.get('fav_id', 0)
        # 取到你收藏的类别，从前台提交的ajax请求中取
        fav_type = request.POST.get('fav_type', 0)

        # 收藏与已收藏取消收藏
        # 判断用户是否登录:即使没登录会有一个匿名的user
        if not request.user.is_authenticated:
            # 未登录时返回json提示未登录，跳转到登录页面是在ajax中做的
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')
        exist_records = UserFavorite.objects.filter(user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
        if exist_records:
            # 如果记录已经存在， 则表示用户取消收藏
            exist_records.delete()
            if int(fav_type) == 1:
                course = Course.objects.get(id=int(fav_id))
                course.fav_nums -=1
                if course.fav_nums < 0:
                    course.fav_nums = 0
                course.save()
            elif int(fav_type) == 2:
                org = CourseOrg.objects.get(id=int(fav_id))
                org.fav_nums -= 1
                if org.fav_nums < 0:
                    org.fav_nums = 0
                org.save()
            elif int(fav_type) == 3:
                teacher = models.Teacher.objects.get(id=int(fav_id))
                teacher.fav_nums -=1
                if teacher.fav_nums < 0:
                    teacher.fav_nums = 0
                teacher.save()

            return HttpResponse('{"status":"success", "msg":"收藏"}', content_type='application/json')
        else:
            user_fav = UserFavorite()
            # 过滤掉未取到fav_id type的默认情况
            if int(fav_type) > 0 and int(fav_id) > 0:
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.user = request.user
                user_fav.save()

                if int(fav_type) == 1:
                    course = Course.objects.get(id=int(fav_id))
                    course.fav_nums += 1
                    course.save()
                elif int(fav_type) == 2:
                    org = CourseOrg.objects.get(id=int(fav_id))
                    org.fav_nums += 1
                    org.save()
                elif int(fav_type) == 3:
                    teacher = models.Teacher.objects.get(id=int(fav_id))
                    teacher.fav_nums += 1
                    teacher.save()
                return HttpResponse('{"status":"success", "msg":"已收藏"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail", "msg":"收藏出错"}', content_type='application/json')


class TeacherListView(View):
    """
    教师列表页面
    """
    def get(self, request):
        all_teacher = models.Teacher.objects.all()
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            # 在name字段进行操作,做like语句的操作。i代表不区分大小写
            # or操作使用Q
            all_teacher = all_teacher.filter(name__icontains=search_keywords)
        # 总共有多少老师使用count进行统计
        teacher_nums = all_teacher.count()
        # 排序
        sort = request.GET.get("sort", "")
        if sort:
            if sort == "hot":
                all_teacher = all_teacher.order_by("-click_nums")
        # 讲师排行榜
        rank_teacher = models.Teacher.objects.all().order_by("-fav_nums")[:5]

        # 对讲师进行分页
        # 尝试获取前台get请求传递过来的page参数
        # 如果是不合法的配置参数默认返回第一页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        # 每页4个
        p = Paginator(all_teacher, 4, request=request)
        teachers = p.page(page)

        return render(request, "teachers-list.html", {
            "all_teacher": teachers,
            "teacher_nums": teacher_nums,
            'sort': sort,
            'rank_teachers': rank_teacher,

        })


class TeacherDetailView(View):
    def get(self, request, teacher_id):
        teacher = get_object_or_404(models.Teacher, id=teacher_id)
        teacher.click_nums += 1
        teacher.save()
        all_course = teacher.course_set.all()
        # 排行榜讲师
        rank_teacher = models.Teacher.objects.all().order_by("-fav_nums")[:5]

        has_fav_teacher = False
        if UserFavorite.objects.filter(user=request.user, fav_type=3, fav_id=teacher.id):
            has_fav_teacher = True
        has_fav_org = False
        if UserFavorite.objects.filter(user=request.user, fav_type=2, fav_id=teacher.org.id):
            has_fav_org = True
        return render(request, "teacher-detail.html", {
            "teacher": teacher,
            "all_course": all_course,
            "rank_teacher": rank_teacher,
            "has_fav_teacher": has_fav_teacher,
            "has_fav_org": has_fav_org,
        })