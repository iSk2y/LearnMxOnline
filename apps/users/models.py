from datetime import datetime
# 让自己养成好习惯 PEP8规范，自带写在前，第三方写在后


from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.


class UserProfile(AbstractUser):
    """
    用户信息表
    """
    # 性别choices
    GENDER_CHOICES = (
        ('male','男'),
        ('female','女')
    )
    nick_name = models.CharField(max_length=50,verbose_name="昵称",default='')
    birthday = models.DateTimeField(verbose_name='生日',null=True,blank=True) # blank是表单验证，null是数据库范畴
    gender = models.CharField(max_length=5,verbose_name="性别",choices=GENDER_CHOICES,default='female')
    address = models.CharField(max_length=100,verbose_name="地址",default='')
    mobile = models.CharField(max_length=11,null=True,blank=True)
    image = models.ImageField(
        upload_to="image/%Y/%m",
        default="image/default.png",
        max_length=100
    )

    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username


class EmailVerifyRecord(models.Model):
    """
    邮箱验证码model
    """
    SEND_CHOICES = (
        ("register", "注册"),
        ("forget", "找回密码")
    )
    code = models.CharField(max_length=20, verbose_name='验证码')
    email = models.EmailField(max_length=50, verbose_name='邮箱')
    send_type = models.CharField(choices=SEND_CHOICES, max_length=10) # 发送类型
    send_time = models.DateTimeField(default=datetime.now) # 这里now()不能加括号,不去掉会根据编译时间。而不是根据实例化时间。

    class Meta:
        verbose_name = '邮箱验证码'
        verbose_name_plural = verbose_name


class Banner(models.Model):
    """
    轮播图model
    """
    title = models.CharField(max_length=100, verbose_name='标题')
    image = models.ImageField(upload_to="banner/%Y/%m", verbose_name='轮播图', max_length=100)
    url = models.URLField(max_length=200, verbose_name='访问地址')
    index = models.IntegerField(default=100, verbose_name='顺序')  # 类似优先级
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '轮播图'
        verbose_name_plural = verbose_name
