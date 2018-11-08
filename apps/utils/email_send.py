#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

from random import Random


from users.models import EmailVerifyRecord
from django.core.mail import send_mail
from mxonline.settings import EMAIL_FROM


def random_str(random_len=8):
    """
    生成随机字符串
    :param random_len: 字符串长度，默认为8
    :return: 返回字符串
    """
    rd_str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(random_len):
        rd_str += chars[random.randint(0, length)]
    return rd_str


# 注册发信
def send_mx_email(email, send_type='register'):
    """
    发送邮件函数 : 发送前将生成的str拼接成url放入数据库，到时候查询数据库是否存在url
    :param email: 邮箱
    :param send_type: 发送类型，默认是注册，还有是找回密码
    :return:
    """
    email_record = EmailVerifyRecord()
    # 生成随机字符串，数据库中code最长为20
    if send_type == 'update_email':
        code = random_str(4)  # 更改邮箱给的验证码短一些
    else:
        code = random_str(20)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    # 定义邮件的内容
    email_title = ''
    email_body = ''

    if send_type == 'register':
        email_title = '我的慕学网站 注册激活链接'
        email_body = '请点击下面的链接激活你的账号：http://127.0.0.1:8000/active/{0}'.format(code)
        # 使用Django内置函数完成邮件发送。四个参数：主题，邮件内容，从哪里发，接受者list

    elif send_type == 'forget':
        email_title = '我的慕学网站 密码找回链接'
        email_body = '请点击下面的链接重置密码：http://127.0.0.1:8000/reset/{0}'.format(code)
    elif send_type == 'update_email':

        email_title = "我的慕学网站 更改邮箱验证码"
        email_body = "你的邮箱验证码为{0}".format(code)

    send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
    if send_status:
        return True
    else:
        return False
