#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

from .models import Course,Lesson,CourseResource,Video
import xadmin


class CourseAdmin(object):
    """
    课程配置类
    """
    list_display = ['name', 'desc', 'detail', 'learn_times', 'students', 'degree']
    search_fields = ['name', 'desc', 'detail', 'degree', 'students']
    list_filter = ['name', 'desc', 'detail', 'learn_times', 'students', 'degree']


class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']

    # __name代表使用外键中name字段
    list_filter = ['course__name', 'name', 'add_time']


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson', 'name', 'add_time']


class CourseResourceAdmin(object):
    list_display = ['course', 'name', 'download', 'add_time']
    search_fields = ['course', 'name', 'download']
    # __name代表使用外键中name字段
    list_filter = ['course__name', 'name', 'download', 'add_time']


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)