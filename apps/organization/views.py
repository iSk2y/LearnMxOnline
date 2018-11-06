from django.shortcuts import render
from django.views.generic.base import View
from organization import models
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
# Create your views here.


class OrgListView(View):
    def get(self, request):
        org_list = models.CourseOrg.objects.all()
        citys_list = models.CityDict.objects.all()
        org_sum = models.CourseOrg.objects.count()

        # 尝试获取前台get请求传递过来的page参数
        # 如果是不合法的配置参数默认返回第一页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger as e:
            page = 1
        p = Paginator(org_list, 5, request=request)
        orgs = p.page(page)
        return render(request, 'org_list.html', {
            'org_list': orgs,
            'citys_list': citys_list,
            'org_sum': org_sum
        }
        )