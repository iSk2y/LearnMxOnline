from datetime import datetime

from django.db import models
from users.models import UserProfile
from courses.models import Course
# Create your models here.


class UserAsk(models.Model):
    """
    用户咨询表
    """
    name = models.CharField(max_length=20, verbose_name='姓名')
    mobile = models.CharField(max_length=11, verbose_name='手机')
    course_name = models.CharField(max_length=50, verbose_name='课程名')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '用户咨询'
        verbose_name_plural = verbose_name

    def __str__(self):
        return "{0}->{1}".format(self.name, self.course_name)


class CourseComments(models.Model):
    """
    课程评论表
    """
    course = models.ForeignKey(to=Course, verbose_name='课程', on_delete=models.CASCADE)
    user = models.ForeignKey(to=UserProfile, verbose_name='用户', on_delete=models.CASCADE)
    comments = models.CharField(max_length=500, verbose_name='评论')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='评论时间')

    class Meta:
        verbose_name = '课程评论'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.user


class UserFavorite(models.Model):
    """
    用户收藏动作表
    """
    FAV_CHOICES = (  # 收藏类型
        (1, '课程'),
        (2, '课程机构'),
        (3, '讲师')
    )
    user = models.ForeignKey(to=UserProfile, verbose_name='用户', on_delete=models.CASCADE)
    fav_id = models.IntegerField('数据id', default=0)
    fav_type = models.IntegerField(verbose_name='收藏类型', choices=FAV_CHOICES, default=1)
    # 这里用fav_id来存放对应收藏类型的对象id，而不采取直接用外键，这样减少存储空间而且更灵活
    add_time = models.DateTimeField(verbose_name='添加时间', default=datetime.now)

    class Meta:
        verbose_name = '用户收藏'
        verbose_name_plural = verbose_name

    def __str__(self):
        return "{0}收藏{1}".format(self.user, self.fav_type)


class UserMessage(models.Model):
    """
    用户消息表
    """
    # 这边user不使用外键，使得我们可以更好实现全员消息和特定用户消息的推送 ，默认0就是全员消息
    user = models.IntegerField(default=0, verbose_name='用户')
    message = models.CharField(verbose_name='消息内容', max_length=500)
    has_read = models.BooleanField(verbose_name='是否已读', default=False)
    send_time = models.DateTimeField(verbose_name='发送时间', default=datetime.now)

    class Meta:
        verbose_name = "用户消息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.user


class UserCourse(models.Model):
    """
    用户课程表
    """
    course = models.ForeignKey(to=Course, verbose_name='课程', on_delete=models.CASCADE)
    user = models.ForeignKey(to=UserProfile, verbose_name='用户', on_delete=models.CASCADE)
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '用户课程'
        verbose_name_plural = verbose_name

    def __str__(self):
        return "{0} - 《{1}》".format(self.user.username, self.course.name)



