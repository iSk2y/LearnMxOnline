#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

from django.urls import path, include, re_path
from organization import views


app_name = 'org'


extra_patterns = [
    path('home/', views.OrgHomeView.as_view(), name='org_home'),
    path('course/', views.OrgCourseView.as_view(), name='org_course'),
    path('desc/', views.OrgDescView.as_view(), name='org_desc'),
    path('teacher/', views.OrgTeacherView.as_view(), name='org_teacher'),

]

urlpatterns = [

    path('list/', views.OrgListView.as_view(), name='org_list'),
    path('add_ask/', views.AddUserAskView.as_view(), name='add_ask'),
    path('show/<int:org_id>/', include(extra_patterns)), # org_id一致 url分发一下 减少冗余


]