#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

from django.urls import path, include, re_path
from django.views.static import serve
from users import views


app_name = 'user'

urlpatterns = [
    path('info/', views.UserInfoView.as_view(), name='user_info'),
    path("image/upload/", views.UploadImageView.as_view(), name='image_upload'),
    path("update/pwd/", views.UpdatePwdView.as_view(), name='update_pwd'),
    path("sendemail_code/", views.SendEmailCodeView.as_view(),name='sendemail_code'),
    path("update_email/", views.UpdateEmailView.as_view(),name='update_email'),

    path("mycourse/", views.MyCourseView.as_view(),name='mycourse'),
    # 我收藏的机构
    path('myfav/org/', views.MyFavOrgView.as_view(), name="myfav_org"),
    # 我收藏的教师
    path('myfav/teacher/', views.MyFavTeacherView.as_view(), name="myfav_teacher"),
    # 我收藏的课程
    path('myfav/course/', views.MyFavCourseView.as_view(), name="myfav_course"),
    # 我的消息
    path('my_message/', views.MyMessageView.as_view(), name="my_message"),
]