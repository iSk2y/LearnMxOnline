from datetime import datetime


from django.db import models

# Create your models here.


class CityDict(models.Model):
    """
    城市表，和机构一对多。但是我感觉不是非常有必要啊
    """
    name = models.CharField(max_length=20, verbose_name='城市')
    desc = models.CharField(max_length=200, verbose_name='描述')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '城市'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CourseOrg(models.Model):
    """
    课程机构表，和城市多对一
    """
    ORG_CHOICES = (
        ('pxjg', '培训机构'),
        ('gx', '高校'),
        ('gr', '个人')
    )
    name = models.CharField(max_length=50, verbose_name='机构名称')
    desc = models.TextField(verbose_name='机构描述')
    click_nums = models.IntegerField(default=0, verbose_name='点击数')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')
    fav_nums = models.IntegerField(default=0, verbose_name='收藏人数')
    image = models.ImageField(upload_to='org/%Y/%m', verbose_name='LOGO', max_length=100)
    address = models.CharField(max_length=150, verbose_name='机构地址')
    # 一个城市可以有很多课程机构，通过将city设置为外键，变成机构的一个字段
    city = models.ForeignKey(to=CityDict, on_delete=models.CASCADE, verbose_name='所在城市')
    category = models.CharField(verbose_name='机构类别', max_length=20, choices=ORG_CHOICES, default='pxjg')
    students = models.IntegerField(default=0, verbose_name=u"学习人数")
    course_nums = models.IntegerField(default=0, verbose_name=u"课程数")

    class Meta:
        verbose_name = '课程机构'
        verbose_name_plural = verbose_name

    def get_teacher_nums(self):
        # 获取机构教师数
        return self.teacher_set.all().count()

    def __str__(self):
        return self.name


class Teacher(models.Model): # 机构和老师是一对多关系
    """
    教师表，和机构一对多
    """
    org = models.ForeignKey(to=CourseOrg, verbose_name='所属机构', on_delete=models.CASCADE)
    name = models.CharField(max_length=50, verbose_name='教师名称')
    age = models.IntegerField(verbose_name='年龄', default=25)
    work_years = models.IntegerField(default=0, verbose_name='工作年限')
    work_company = models.CharField(max_length=50, verbose_name='就职公司')
    work_position = models.CharField(max_length=50, verbose_name='公司职位')
    points = models.CharField(max_length=50, verbose_name='教学特点')
    click_nums = models.IntegerField(default=0, verbose_name='点击数')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')
    fav_nums = models.IntegerField(default=0, verbose_name='收藏人数')
    image = models.ImageField(upload_to='teacher/%Y/%m', verbose_name='头像', max_length=100, default='')

    class Meta:
        verbose_name = '教师'
        verbose_name_plural = verbose_name

    def __str__(self):
        return "[{0}]{1}".format(self.org, self.name)