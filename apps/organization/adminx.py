#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

from .models import CityDict, CourseOrg, Teacher
import xadmin


class CityDictAdmin(object):
    """
    城市配置类
    """
    list_display = ['name', 'desc', 'add_time']
    list_filter = ['name', 'desc', 'add_time']
    search_fields = ['name', 'desc']


class CourseOrgAdmin(object):
    """
    课程机构配置类
    """
    list_display = ['name', 'desc', 'category', 'click_nums', 'fav_nums', 'add_time' ]
    search_fields = ['name', 'desc', 'category', 'click_nums', 'fav_nums']
    list_filter = ['name', 'desc', 'category', 'click_nums', 'fav_nums', 'city__name', 'address', 'add_time']


class TeacherAdmin(object):
    """
    教室配置类
    """
    list_display = [ 'name','org', 'work_years', 'work_company','add_time']
    search_fields = ['org', 'name', 'work_years', 'work_company']
    list_filter = ['org__name', 'name', 'work_years', 'work_company','click_nums', 'fav_nums', 'add_time']


xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(CourseOrg, CourseOrgAdmin)
xadmin.site.register(Teacher, TeacherAdmin)
