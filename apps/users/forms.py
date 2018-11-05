#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

from django import forms

from captcha.fields import CaptchaField
from django.core.validators import ValidationError

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


class ForgetForm(forms.Form):
    # 此处email与前端name需保持一致。
    email = forms.EmailField(required=True)
    # 应用验证码 自定义错误输出key必须与异常一样
    captcha = CaptchaField(error_messages={"invalid": u"验证码错误"})


class ModifyPwdForm(forms.Form):
    # 提交新密码的form
    password = forms.CharField(required=True, min_length=6, error_messages={
        'min_length': '最少为6个字符',
        'required': '必须输入密码啊！'
    })
    # 再次输入密码的字段
    re_pwd = forms.CharField(required=True)

    def clean_re_pwd(self):
        pwd = self.cleaned_data.get('password')
        re_pwd = self.cleaned_data.get('re_pwd')
        if pwd is None:
            raise ValidationError("请先正确输入密码！!")
        if pwd != re_pwd:
            raise ValidationError("两次密码不一样！！")
        return re_pwd
