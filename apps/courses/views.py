from django.shortcuts import render, get_object_or_404, HttpResponse
from courses import models
from django.views.generic.base import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from operation.models import UserFavorite, CourseComments, UserCourse
from django.db.models import Q
from utils.mixin_utils import LoginRequiredMixin

# Create your views here.


class CourseListView(View):
    """
    课程列表页面
    """
    def get(self, request):
        all_course = models.Course.objects.all()
        hot_courses = models.Course.objects.all().order_by("-students")[:3]
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            # Q可以实现多个字段，之间是or的关系
            all_course = all_course.filter(
                Q(name__icontains=search_keywords) |
                Q(desc__icontains=search_keywords) |
                Q(detail__icontains=search_keywords)
            )
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
            "hot_courses": hot_courses,

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


class CourseInfoView(LoginRequiredMixin, View):
    """
    课程信息视图
    """
    def get(self, request, course_id):
        course = get_object_or_404(models.Course,id=course_id)
        course.students += 1
        course.save()
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not user_courses:
            # 如果没有学习该门课程就关联起来
            user_course = UserCourse(user=request.user, course=course)
            user_course.save()
        # 把这些都写在include tag里面了
        # all_resources = models.CourseResource.objects.filter(course=course)
        return render(request, 'course-video.html', {
            'course': course,
            # 'all_resources': all_resources # 把这些都写在include tag里面了
        })


class CommentsView(LoginRequiredMixin, View):
    """
    评论展示视图
    """

    def get(self, request, course_id):
        course = models.Course.objects.get(id=int(course_id))
        # all_resources = models.CourseResource.objects.filter(course=course) # 把这些都写在include tag里面了
        all_comments = CourseComments.objects.all()
        return render(request, "course-comment.html", {
            "course": course,
            # "all_resources": all_resources, # 把这些都写在include tag里面了
            'all_comments': all_comments,
        })


class AddCommentsView(LoginRequiredMixin, View):
    """
    添加评论接口视图
    """
    def post(self, request):
        if not request.user.is_authenticated:
            # 未登录时返回json提示未登录，跳转到登录页面是在ajax中做的
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')
        course_id = request.POST.get("course_id", 0)
        comments = request.POST.get("comments", "")
        if int(course_id) > 0 and comments:
            # 实例化一个course_comments对象
            course_comments = CourseComments()
            # 获取评论的是哪门课程
            course = models.Course.objects.get(id = int(course_id))
            # 分别把评论的课程、评论的内容和评论的用户保存到数据库
            course_comments.course = course
            course_comments.comments = comments
            course_comments.user = request.user
            course_comments.save()
            return HttpResponse('{"status":"success", "msg":"评论成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"评论失败"}', content_type='application/json')


class VideoPlayView(LoginRequiredMixin, View):
    """
    视频播放页面
    """
    def get(self, request, video_id):
        video = get_object_or_404(models.Video, pk=video_id)
        # 通过外键找到章节再找到视频对应的课程
        course = video.lesson.course
        course.students += 1
        course.save()
        return render(request, 'course-play.html', {
            'course': course
        })
