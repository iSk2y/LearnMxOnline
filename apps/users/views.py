from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
# Create your views here.
from django.contrib.auth.backends import ModelBackend
from .models import UserProfile
from django.db.models import Q
from django.views.generic.base import View
from . import forms

class CustomBackend(ModelBackend):
    # 继承ModelBackend 重载authenticate方法，使得邮件账户也能登陆
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            # 返回0个和2个  get都会失败
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):  # 检查密码是否正确
                return user
        except Exception as e:
            return None


class LoginView(View):

    def get(self, request):
        return render(request, 'login.html')

    def post(self, request):
        login_form = forms.LoginForm(request.POST)
        if login_form.is_valid():
            user_name = login_form.cleaned_data.get("username", "")
            pass_word = login_form.cleaned_data.get("password", "")
            user = authenticate(username=user_name, password=pass_word) # 如果forms验证成功就尝试登陆验证
        else:
            return render(request, 'login.html', {'login_form': login_form})

        if user is not None:  # 认证成功
            login(request, user)
            return redirect('')
        else:  # 认证失败
            return render(request, 'login.html', {'msg': '账号或密码错误'})





