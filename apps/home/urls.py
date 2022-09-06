# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from django.urls import path, re_path
from apps.home import views

urlpatterns = [
    path('english', views.english, name='home'),
    path('', views.home, name='home'),
    path('programming', views.programming, name='home'),
    path('issues', views.issues, name='home'),
    path('add_student_amo_ref/<str:issue_id>', views.create_student_amo_ref, name='home'),
    path('create_location', views.create_location, name='home'),
    path('tutors_programming', views.tutors_programming, name='home'),
    path('tutors_english', views.tutors_english, name='home'),
    path('close_issue/<str:issue_id>', views.close_issue, name='home'),
    path('resolve_amo_issue/<str:issue_id>', views.resolve_no_amo_issue_without_actions, name='home'),
    # Matches any html file
    re_path(r'^.*\.*', views.pages, name='pages'),

]
