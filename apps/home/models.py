# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from django.db import models
from django.contrib.auth.models import User

regions = [
    ("UA_Kievskaya oblast", "UA_Kievskaya oblast"),
    ("UA_Kiev", "UA_Kiev"),
    ("UA_Odessa", "UA_Odessa"),
    ("UA_Kharkov", "UA_Kharkov"),
    ("UA_Dnepr", "UA_Dnepr"),
    ("UA_SaaS", "UA_SaaS"),
    ("UA_Odesskaya oblast", "UA_Odesskaya oblast"),
    ("UA_Vynnytsya", "UA_Vynnytsya"),
    ("UA_Dnepropetrovskaya oblast", "UA_Dnepropetrovskaya oblast"),
    ("UA_Chernivtsi", "UA_Chernivtsi"),
    ("UA_Lviv", "UA_Lviv"),
    ("UA_ChernivtsiOblast", "UA_ChernivtsiOblast"),
    ("UA_LvivOblast", "UA_LvivOblast"),
    ("UA_VynnytsyaOblast", "UA_VynnytsyaOblast"),
    ("UA_Dnepr_region", "UA_Dnepr_region"),
    ("UA_Poltava", "UA_Poltava"),
    ("UA_Chernigov_obl", "UA_Chernigov_obl"),
    ("UA_Donetskobl", "UA_Donetskobl"),
    ("UA_Center", "UA_Center"),
    ("UA_Nikolaevskaya_obl", "UA_Nikolaevskaya_obl"),
    ("UA_Dnepropetrovskaya oblast2", "UA_Dnepropetrovskaya oblast2")
]


class Location(models.Model):
    standart_name = models.CharField(max_length=256, blank=True, null=True, editable=False)
    lms_location_name = models.CharField(max_length=256)
    client_manager = models.CharField(max_length=256, null=True, blank=True)
    territorial_manager = models.CharField(max_length=256, null=True, blank=True)
    regional_manager = models.CharField(max_length=256, null=True, blank=True)
    tutor = models.CharField(max_length=256, null=True, blank=True)
    region = models.CharField(max_length=200, choices=regions, default=None, null=True)

    def save(self, *args, **kwargs):
        self.standart_name = str(self.lms_location_name).lower().replace(" ", "_").replace("-", "_").replace('"', "'").replace(",", "").replace(".", "")
        super(Location, self).save(*args, **kwargs)

    def __str__(self):
        return f"{self.lms_location_name} - {self.territorial_manager} - {self.regional_manager}"


class Group(models.Model):
    group_id = models.CharField(max_length=20)
    group_name = models.CharField(max_length=256)
    group_location = models.CharField(max_length=256)
    group_teacher = models.CharField(max_length=256)
    group_manager = models.CharField(max_length=256)
    group_course = models.CharField(max_length=256)
    report_date_start = models.CharField(max_length=256)
    report_date_end = models.CharField(max_length=256)
    total = models.IntegerField(blank=True, null=True)
    attended = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.group_name


class Payment(models.Model):
    group_manager = models.CharField(max_length=256)
    client_name = models.CharField(max_length=256)
    client_lms_id = models.CharField(max_length=256)
    group_course = models.CharField(max_length=256)
    bussiness = models.CharField(max_length=256)
    report_date_start = models.CharField(max_length=256)
    report_date_end = models.CharField(max_length=256)


class Report(models.Model):
    location_name = models.CharField(max_length=256)
    region = models.CharField(max_length=256)
    total = models.IntegerField()
    attended = models.IntegerField()
    payments = models.IntegerField()
    students_without_amo = models.CharField(max_length=1024, null=True, blank=True)
    conversion = models.FloatField()
    territorial_manager = models.CharField(max_length=256, default="")
    start_date = models.DateField(null=True, blank=True)
    end_date = models.DateField(null=True, blank=True)
    business = models.CharField(max_length=128, null=True, blank=True)
    regional_manager = models.CharField(max_length=256, null=True, blank=True)
    client_manager = models.CharField(max_length=256, null=True, blank=True)


    def __str__(self):
        return f'{self.region}:{self.location_name} {self.start_date}_{self.end_date} => {self.conversion}'


class Student(models.Model):
    lms_id = models.CharField(max_length=256)
    student_name = models.CharField(max_length=256)
    group_id = models.CharField(max_length=256)
    group_location = models.CharField(max_length=256, blank=True, null=True)
    amo_id = models.CharField(max_length=100, blank=True, null=True)
    region = models.CharField(max_length=256, blank=True, null=True)

    def __str__(self):
        return f'{self.student_name}-{self.lms_id}'


class GlobalGroup(models.Model):
    group_id = models.CharField(max_length=20)
    group_name = models.CharField(max_length=256)
    group_location = models.CharField(max_length=256)
    group_teacher = models.CharField(max_length=256)
    group_manager = models.CharField(max_length=256)
    group_region = models.CharField(max_length=256, null=True, default=None)

    def __str__(self):
        return self.group_name


class StudentAMORef(models.Model):
    lms_id = models.CharField(max_length=20)
    amo_id = models.CharField(max_length=20)
    group_id = models.CharField(max_length=20)
    attended = models.CharField(max_length=10)
    report_start = models.CharField(max_length=64, default="2022-02-01")
    report_end = models.CharField(max_length=64, default="2022-02-06")
