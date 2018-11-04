#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

from .models import UserAsk,CourseComments,UserFavorite,UserMessage,UserCourse
import xadmin


class UserAskAdmin(object):
    """
    用户咨询配置类
    """
    list_display = ['name', 'mobile', 'course_name', 'add_time']
    search_fields = ['name', 'mobile', 'course_name']
    list_filter = ['name', 'mobile', 'course_name', 'add_time']


class UserCourseAdmin(object):
    """
    用户课程配置类
    """
    list_display = ['user', 'course', 'add_time']
    search_fields = ['user', 'course']
    list_filter = ['user', 'course', 'add_time']


class UserMessageAdmin(object):
    """
    用户消息配置类
    """
    list_display = ['user', 'message', 'has_read', 'send_time']
    search_fields = ['user', 'message', 'has_read']
    list_filter = ['user', 'message', 'has_read', 'send_time']


class CourseCommentsAdmin(object):
    """
    课程评论配置类
    """
    list_display = ['user', 'course', 'comments', 'add_time']
    search_fields = ['user', 'course', 'comments']
    list_filter = ['user', 'course', 'comments', 'add_time']


class UserFavoriteAdmin(object):
    """
    用户收藏配置类
    """
    list_display = ['user', 'fav_id', 'fav_type', 'add_time']
    search_fields = ['user', 'fav_id', 'fav_type']
    list_filter = ['user', 'fav_id', 'fav_type', 'add_time']


xadmin.site.register(UserAsk, UserAskAdmin)
xadmin.site.register(UserCourse, UserCourseAdmin)
xadmin.site.register(UserMessage, UserMessageAdmin)
xadmin.site.register(CourseComments, CourseCommentsAdmin)
xadmin.site.register(UserFavorite, UserFavoriteAdmin)
