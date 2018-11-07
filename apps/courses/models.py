from datetime import datetime

from django.db import models
from organization.models import CourseOrg,Teacher
# Create your models here.


class Course(models.Model):
    """
    课程model
    """
    DEGREE_CHOICES = (
        ('cj', '初级'),
        ('zj', '中级'),
        ('gj', '高级')

    )
    name = models.CharField(max_length=50, verbose_name="课程名")
    desc = models.CharField(max_length=300, verbose_name="课程描述")
    detail = models.TextField(verbose_name="课程详情")
    learn_times = models.IntegerField(default=0, verbose_name='学习时长（分钟）')  # 分钟为单位
    course_org = models.ForeignKey(to=CourseOrg, verbose_name='所属机构', on_delete=models.CASCADE, null=True, blank=True)
    students = models.IntegerField(default=0, verbose_name='学习人数')
    category = models.CharField(verbose_name='课程类别', max_length=20, default='编程开发')
    tag = models.CharField(verbose_name='课程标签',default='', max_length=10)
    fav_nums = models.IntegerField(default=0, verbose_name='收藏人数')
    image = models.ImageField(upload_to='courses/%Y/%m', verbose_name='封面图', max_length=100)
    click_nums = models.IntegerField(default=0, verbose_name='点击数')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')
    degree = models.CharField(verbose_name='课程难度', choices=DEGREE_CHOICES, max_length=2, default='cj')
    teacher = models.ForeignKey(to=Teacher, verbose_name='讲师', null=True, blank=True, on_delete=models.CASCADE)
    need_know = models.CharField(max_length=200, default='加油你能成功的！努力学习！摆脱困境', verbose_name='课程须知')
    teacher_tell = models.CharField(max_length=200, default='你给我好好学，不要偷懒，滚去学习', verbose_name='老师告诉你')

    class Meta:
        verbose_name = '课程'
        verbose_name_plural = verbose_name

    def get_lesson_nums(self):
        """
        获取章节数
        :return: int
        """
        return self.lesson_set.all().count()

    def get_course_lesson(self):
        """
        获取课程的章节
        :return: QuerySet
        """
        return self.lesson_set.all()

    def get_learn_user(self):
        """
        获取学习该课程的5个用户
        :return: QurySet
        """
        return self.usercourse_set.all()[:5]

    def __str__(self):
        return self.name


class Lesson(models.Model):  # 课程与章节是一对多关系
    """
    章节表，和课程多对一
    """
    course = models.ForeignKey(to=Course, verbose_name='课程', on_delete=models.CASCADE)  # on_delete 必须指定
    name = models.CharField(max_length=100, verbose_name='章节名称')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '章节'
        verbose_name_plural = verbose_name

    def get_lesson_vedio(self):
        """
        获取章节的视频
        :return: QuerySet
        """
        return self.video_set.all()

    def __str__(self):
        return "《{0}》章节>{1}".format(self.course, self.name)


class Video(models.Model):  # 章节与视频是一对多关系
    """
    视频表，和章节多对一
    """
    lesson = models.ForeignKey(to=Lesson, verbose_name='章节', on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name='视频名')
    url = models.CharField(max_length=200, default='', verbose_name='访问地址')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')
    learn_times = models.IntegerField(default=0, verbose_name=u"学习时长(分钟数)")

    class Meta:
        verbose_name = '视频'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CourseResource(models.Model):
    """
    课程资源，和课程多对一
    """
    course = models.ForeignKey(to=Course, verbose_name='课程', on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name='名称')
    download = models.FileField(upload_to='course/resource/%Y/%m', verbose_name='资源文件', max_length=100)
    # FileField字段类型在 后台form表单时 可以直接上传文件
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '课程资源'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
