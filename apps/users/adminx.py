#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y


import xadmin


from .models import EmailVerifyRecord, Banner


class EmailVerifyRecordAdmin(object):
    """
    验证码的配置类
    """
    list_display = ['code', 'email', 'send_type', 'send_time']
    search_fields = ['code', 'email', 'send_type']
    list_filter = ['code', 'email', 'send_type', 'send_time']


class BannerAdmin(object):
    """
    轮播图的配置类
    """
    list_display = ['title', 'image', 'url', 'index', 'add_time']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index', 'add_time']


xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)