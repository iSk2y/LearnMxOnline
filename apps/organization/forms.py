#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y
import re
from django import forms

from operation.models import UserAsk


class UserAskForm(forms.ModelForm):
    # 继承model外也能新增其他字段
    class Meta:
        model = UserAsk
        # 指定验证的字段
        fields = ['name', 'mobile', 'course_name']

    def clean_mobile(self):
        mobile = self.cleaned_data['mobile']
        REGEX_MOBILE = "^1[358]\d{9}$|^147\d{8}$|^176\d{8}$"
        p = re.compile(REGEX_MOBILE)
        if p.match(mobile):
            return mobile
        else:
            raise forms.ValidationError(u"手机号码非法", code="mobile_invalid")