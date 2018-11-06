from django.shortcuts import render
from django.views.generic.base import View
from organization import models
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
# Create your views here.


class OrgListView(View):
    def get(self, request):
        org_list = models.CourseOrg.objects.all()
        citys_list = models.CityDict.objects.all()

        # city和category筛选
        try:  # 如果不是数字，肯定是非法字符了 直接给空吧
            city_id = int(request.GET.get("city", ""))
        except ValueError:
            city_id = ""
        category_id = request.GET.get("ct", "")

        if city_id:
            org_list = org_list.filter(city_id=city_id)
        if category_id:
            org_list = org_list.filter(category=category_id)

        # 学习人生和课程人数筛选
        sort = request.GET.get("sort", "")
        if sort:
            if sort == 'students':
                org_list = org_list.order_by("-students")
            elif sort == 'courses':
                org_list = org_list.order_by("-course_nums")

        org_sum = org_list.count()
        # 热门机构排名
        hot_orgs = org_list.order_by("-click_nums")[:3]
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
            'org_sum': org_sum,
            'city_id': city_id,
            'category': category_id,
            'hot_orgs': hot_orgs,
            'sort': sort
            }
        )
