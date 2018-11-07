#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y


from django import template
from courses import models
from operation.models import UserCourse
from mxonline.settings import MEDIA_URL
register = template.Library()


@register.inclusion_tag('course_aside.html', takes_context=True)
def get_right_side(context):
    # 从上下文变量中取出course
    course = context['course']
    all_resources = models.CourseResource.objects.filter(course=course)
    # 选出学了这门课的学生
    user_courses = UserCourse.objects.filter(course=course)
    # 从关系中取出user_id遍历成列表
    user_ids = [user_course.user_id for user_course in user_courses]
    # 查询出用户课程表中 用户id在上面列表中的 其他课程
    all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
    # 取出所有课程id
    course_ids = [all_user_course.course_id for all_user_course in all_user_courses]
    # 获取学过该课程用户学过的其他课程
    relate_courses = models.Course.objects.filter(id__in=course_ids).order_by("-click_nums")[:5]
    # 是否收藏课程

    return {
        'all_resources': all_resources,
        'course': course,
        # 我也不知道为啥 这个MEDIA 不传前端就获取不到了 那就显式传递一下吧
        'MEDIA_URL': MEDIA_URL,
        "relate_courses": relate_courses,
    }
