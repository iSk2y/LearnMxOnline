#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

from django.urls import path, re_path
from courses import views

app_name = 'course'

urlpatterns = [
    path('list/', views.CourseListView.as_view(), name='list'),
    path('detail/<int:course_id>/', views.CourseDetailView.as_view(), name="detail"),
]