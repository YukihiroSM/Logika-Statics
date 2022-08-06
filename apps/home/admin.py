# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from django.contrib import admin

from .models import Location, Group, Payment, Report, Student, GlobalGroup

admin.site.register(Location)
admin.site.register(Group)
admin.site.register(Payment)
admin.site.register(Report)
admin.site.register(Student)
admin.site.register(GlobalGroup)
