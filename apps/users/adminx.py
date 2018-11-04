#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y


import xadmin
from xadmin import views

from .models import EmailVerifyRecord, Banner


#  Xadmin管理配置类
class BaseSetting(object):
    # 开启主题
    enable_themes = True
    use_bootswatch = True


class GlobalSettings(object):
    site_title = 'MxOnline'
    site_footer = "MxOnline Platform"
    # 收起菜单
    menu_style = "accordion"


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


xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSettings)
xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)