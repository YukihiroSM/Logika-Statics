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

    # Matches any html file
    re_path(r'^.*\.*', views.pages, name='pages'),

]
