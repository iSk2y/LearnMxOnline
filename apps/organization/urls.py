#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

from django.urls import path, include, re_path
from organization import views


app_name = 'org'

urlpatterns = [

    path('list/', views.OrgListView.as_view(), name='org_list'),
    path('add_ask/', views.AddUserAskView.as_view(), name='add_ask')
]