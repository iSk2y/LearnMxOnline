from datetime import datetime

from django.db import models

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
    students = models.IntegerField(default=0, verbose_name='学习人数')
    fav_nums = models.IntegerField(default=0, verbose_name='收藏人数')
    image = models.ImageField(upload_to='courses/%Y/%m', verbose_name='封面图', max_length=100)
    click_nums = models.IntegerField(default=0, verbose_name='点击数')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')
    degree = models.CharField(verbose_name='课程难度', choices=DEGREE_CHOICES, max_length=2, default='cj')

    class Meta:
        verbose_name = '课程'
        verbose_name_plural = verbose_name

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

    def __str__(self):
        return "《{0}》章节>{1}".format(self.course, self.name)


class Video(models.Model):  # 章节与视频是一对多关系
    """
    视频表，和章节多对一
    """
    lesson = models.ForeignKey(to=Lesson, verbose_name='章节', on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name='视频名')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '视频'
        verbose_name_plural = verbose_name


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

