#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

from django.urls import path, re_path
from courses import views

app_name = 'course'

urlpatterns = [
    path('list/', views.CourseListView.as_view(), name='list'),
    path('detail/<int:course_id>/', views.CourseDetailView.as_view(), name="detail"),
    path('info/<int:course_id>/', views.CourseInfoView.as_view(), name='info'),
    path('comment/<int:course_id>/', views.CommentsView.as_view(), name='comments'),
    path('add_comment/', views.AddCommentsView.as_view(), name='add_comment'),
    path('video/<int:video_id>/', views.VideoPlayView.as_view(), name="video_play"),
]