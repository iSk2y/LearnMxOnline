#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

from django import forms

from captcha.fields import CaptchaField

# 登陆表单简单验证,还可以自定义error 和modelForm搭配更好
# 定义的字段和前端传入的要相同


class LoginForm(forms.Form):
    username = forms.CharField(
        required=True,
        error_messages={
            "required": '账号不能为空'
        }
    )
    password = forms.CharField(
        required=True,
        error_messages={
            'required': '密码不能为空'
        }
    )


class RegisterForm(forms.Form):
    """
    注册form
    """
    email = forms.CharField(
        required=True,
        error_messages={
            'required': '用户名不能为空',
        },

    )
    password = forms.CharField(
        required=True,
        error_messages={
            'required': '密码不能为空',

        },
        min_length=5,

    )
    captcha = CaptchaField(error_messages={"invalid": u"验证码错误"})
