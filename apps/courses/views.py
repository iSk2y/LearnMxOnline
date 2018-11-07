from django.shortcuts import render, get_object_or_404
from courses import models
from django.views.generic.base import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from operation.models import UserFavorite
# Create your views here.


class CourseListView(View):
    """
    课程列表页面
    """
    def get(self, request):
        all_course = models.Course.objects.all()
        hot_courses = models.Course.objects.all().order_by("-students")[:3]
        # 对课程进行分页
        # 尝试获取前台get请求传递过来的page参数
        # 如果是不合法的配置参数默认返回第一页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        # sort排序
        sort = request.GET.get('sort', "")
        if sort:
            if sort == "students":
                all_course = all_course.order_by("-students")
            elif sort == "hot":
                all_course = all_course.order_by("-click_nums")

        p = Paginator(all_course, 6, request=request)
        courses = p.page(page)
        return render(request, 'course-list.html', {
            'all_course': courses,
            'sort': sort,
            "hot_courses": hot_courses
        })


class CourseDetailView(View):
    """
    详情页
    """
    def get(self, request, course_id):
        course_obj = get_object_or_404(models.Course, pk=course_id)
        course_obj.click_nums += 1
        course_obj.save()
        tag = course_obj.tag
        if tag:
            # 相关课程推荐
            relate_courses = models.Course.objects.filter(tag=tag).exclude(pk__in=[course_obj.pk])[:2]
        else:
            relate_courses = []
        # 判断是否已经收藏
        has_fav_course = False
        has_fav_org = False

        # 必须是用户已登录我们才需要判断。
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_obj.id, fav_type=1):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course_obj.course_org.id, fav_type=2):
                has_fav_org = True

        return render(request, 'course-detail.html', {
            'course': course_obj,
            'relate_courses': relate_courses,
            'has_fav_course': has_fav_course,
            'has_fav_org': has_fav_org
        })
