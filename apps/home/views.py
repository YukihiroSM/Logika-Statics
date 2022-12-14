# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""
import os

import pandas as pd
import requests
from django import template
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import redirect
from django.template import loader
from django.urls import reverse
from .forms import ReportDateForm, CreateAmoRef, ReasonForCloseForm, LocationCreateForm, AssignIssueForm
import datetime
import math

import library
from .models import Report, Issue, Location, TeacherReport, Payment, GlobalGroup, StudentReport


def is_member(user, group_name):
    return user.groups.filter(name=group_name).exists()


def results(request):
    report_scale = request.POST.get('report_scale', None)
    print(report_scale)


def health(request):
    return {
        "status": "OK"}


base_path = os.path.dirname(os.path.dirname(__file__))


@login_required(login_url="/login/")
def programming_new(request):
    month_report = None
    with open(f"{base_path}/../report_scales.txt", "r", encoding="UTF-8") as report_scales_fileobj:
        scales = report_scales_fileobj.readlines()
    scales_dict = {}
    for i in range(len(scales)):
        scales[i] = scales[i].replace("\n", "").replace("_", " - ")
        month = scales[i].split(":")[0]
        dates = scales[i].split(":")[1]
        if month not in scales_dict:
            scales_dict[month] = [dates]
        else:
            scales_dict[month].append(dates)
    possible_report_scales = []
    for key, value in scales_dict.items():
        possible_report_scales.append(key)
        for val in value:
            possible_report_scales.append(val)
    if request.method == 'POST':
        form = ReportDateForm(request.POST)
        if form.is_valid():
            try:
                report_start, report_end = form.cleaned_data["report_scale"].split(" - ")
            except ValueError:
                month_report = form.cleaned_data["report_scale"]
        else:
            report_start, report_end = possible_report_scales[-1].split(" - ")
    else:
        report_start, report_end = possible_report_scales[-1].split(" - ")
    if not month_report:
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_end = datetime.datetime.strptime(report_end, "%Y-%m-%d").date()
        report_date_default = f"{report_start} - {report_end}"
    else:
        report_end = max(set(StudentReport.objects.all().values_list('end_date', flat=True)))
        report_scales = scales_dict[month_report]
        report_start = report_scales[0].split(" - ")[0]
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_date_default = f'{report_start} - {report_end}'
    if get_user_role(request.user) == 'admin':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="programming").order_by("regional_manager").exclude(
            amo_id=None).all()
    elif get_user_role(request.user) == 'regional':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="programming",
                                               regional_manager=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).all()
    elif get_user_role(request.user) == 'territorial_manager':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="programming",
                                               territorial_manager=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).all()
    all_locations = []
    territorial_managers = []
    all_client_managers = []
    for report in reports:
        if report.location not in all_locations:
            all_locations.append(report.location)
        if report.client_manager not in all_client_managers:
            all_client_managers.append(report.client_manager)
        if report.territorial_manager and report.territorial_manager not in territorial_managers:
            territorial_managers.append(report.territorial_manager)
    totals = {
        "Ukraine": {
            "enrolled": 0,
            "attended": 0,
            "payments": 0}}
    reports_by_locations = {}
    for location in all_locations:
        if location is None:
            continue
        location_payments = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                         is_duplicate=0,
                                                         business="programming", payment=1, location=location).exclude(
            amo_id=None).all()
        location_attendeds = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                          is_duplicate=0,
                                                          business="programming", attended_mc=1,
                                                          location=location).exclude(amo_id=None).all()
        location_enrolled = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                         is_duplicate=0,
                                                         business="programming", enrolled_mc=1,
                                                         location=location).exclude(amo_id=None).all()
        location_obj = Location.objects.filter(lms_location_name=location).first()
        if location_obj:
            territorial_manager = location_obj.territorial_manager
            regional_manager = location_obj.regional_manager
            client_manager = location_obj.client_manager
        else:
            print("LOCATION NOT IN LIST!!!", location)
            territorial_manager = location_enrolled[0].territorial_manager
            regional_manager = location_enrolled[0].territorial_manager
            client_manager = location_enrolled[0].territorial_manager

        reports_by_locations[location] = {
            "enrolled": len(location_enrolled),
            "attended": len(location_attendeds),
            "payments": len(location_payments),
            "territorial_manager": territorial_manager,
            "regional_manager": regional_manager,
            "client_manager": client_manager
        }
        totals["Ukraine"]['enrolled'] += len(location_enrolled)
        totals["Ukraine"]['attended'] += len(location_attendeds)
        totals["Ukraine"]['payments'] += len(location_payments)

    reports_by_cm = {}
    for cm in all_client_managers:
        if cm is None:
            continue
        location_payments = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                         is_duplicate=0,
                                                         business="programming", payment=1, client_manager=cm).exclude(
            amo_id=None).all()
        location_attendeds = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                          is_duplicate=0,
                                                          business="programming", attended_mc=1,
                                                          client_manager=cm).exclude(amo_id=None).all()
        location_enrolled = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                         is_duplicate=0,
                                                         business="programming", enrolled_mc=1,
                                                         client_manager=cm).exclude(amo_id=None).all()
        location_obj = Location.objects.filter(client_manager=cm).first()
        if location_obj:
            territorial_manager = location_obj.territorial_manager
            regional_manager = location_obj.regional_manager
        else:
            print("LOCATION NOT IN LIST!!!", cm)
            try:
                territorial_manager = location_enrolled[0].territorial_manager
                regional_manager = location_enrolled[0].territorial_manager
            except:
                continue


        reports_by_cm[cm] = {
            "enrolled": len(location_enrolled),
            "attended": len(location_attendeds),
            "payments": len(location_payments),
            "territorial_manager": territorial_manager,
            "regional_manager": regional_manager
        }

    totals_rm = {}
    totals_tm = {}
    for location in reports_by_locations:
        if reports_by_locations[location]["regional_manager"] in totals_rm:
            totals_rm[reports_by_locations[location]["regional_manager"]]["attended"] += reports_by_locations[location][
                "attended"]
            totals_rm[reports_by_locations[location]["regional_manager"]]["enrolled"] += reports_by_locations[location][
                "enrolled"]
            totals_rm[reports_by_locations[location]["regional_manager"]]["payments"] += reports_by_locations[location][
                "payments"]
        else:
            totals_rm[reports_by_locations[location]["regional_manager"]] = {}
            totals_rm[reports_by_locations[location]["regional_manager"]]["attended"] = reports_by_locations[location][
                "attended"]
            totals_rm[reports_by_locations[location]["regional_manager"]]["enrolled"] = reports_by_locations[location][
                "enrolled"]
            totals_rm[reports_by_locations[location]["regional_manager"]]["payments"] = reports_by_locations[location][
                "payments"]
        if reports_by_locations[location]["territorial_manager"] in totals_tm:
            totals_tm[reports_by_locations[location]["territorial_manager"]]["attended"] += \
                reports_by_locations[location][
                    "attended"]
            totals_tm[reports_by_locations[location]["territorial_manager"]]["enrolled"] += \
                reports_by_locations[location][
                    "enrolled"]
            totals_tm[reports_by_locations[location]["territorial_manager"]]["payments"] += \
                reports_by_locations[location][
                    "payments"]
        else:
            totals_tm[reports_by_locations[location]["territorial_manager"]] = {}
            totals_tm[reports_by_locations[location]["territorial_manager"]]["attended"] = \
                reports_by_locations[location][
                    "attended"]
            totals_tm[reports_by_locations[location]["territorial_manager"]]["enrolled"] = \
                reports_by_locations[location][
                    "enrolled"]
            totals_tm[reports_by_locations[location]["territorial_manager"]]["payments"] = \
                reports_by_locations[location][
                    "payments"]
    managers = {}
    for tm in territorial_managers:
        rm = get_rm_by_tm(tm)
        if rm in managers:
            managers[rm].append(tm)
        else:
            managers[rm] = [tm]

    context = {
        'segment': 'programming_new',
        "report_date_default": report_date_default,
        "username": request.user.username,
        "report_scales": possible_report_scales,
        "user_group": get_user_role(request.user),
        'reports_by_locations': reports_by_locations,
        'managers': managers,
        'totals_rm': totals_rm,
        'totals_tm': totals_tm,
        'reports_by_cm': reports_by_cm,
        # 'totals_km': total_kms,
        'totals': totals,
        'user_role': get_user_role(request.user)
    }
    html_template = loader.get_template('home/report_programming_new_admin.html')
    return HttpResponse(html_template.render(context, request))


@login_required(login_url="/login/")
def english_new(request):
    month_report = None
    with open(f"{base_path}/../report_scales.txt", "r", encoding="UTF-8") as report_scales_fileobj:
        scales = report_scales_fileobj.readlines()
    scales_dict = {}
    for i in range(len(scales)):
        scales[i] = scales[i].replace("\n", "").replace("_", " - ")
        month = scales[i].split(":")[0]
        dates = scales[i].split(":")[1]
        if month not in scales_dict:
            scales_dict[month] = [dates]
        else:
            scales_dict[month].append(dates)
    possible_report_scales = []
    for key, value in scales_dict.items():
        possible_report_scales.append(key)
        for val in value:
            possible_report_scales.append(val)
    if request.method == 'POST':
        form = ReportDateForm(request.POST)
        if form.is_valid():
            try:
                report_start, report_end = form.cleaned_data["report_scale"].split(" - ")
            except ValueError:
                month_report = form.cleaned_data["report_scale"]
        else:
            report_start, report_end = possible_report_scales[-1].split(" - ")
    else:
        report_start, report_end = possible_report_scales[-1].split(" - ")
    if not month_report:
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_end = datetime.datetime.strptime(report_end, "%Y-%m-%d").date()
        report_date_default = f"{report_start} - {report_end}"
    else:
        report_end = max(set(StudentReport.objects.all().values_list('end_date', flat=True)))
        report_scales = scales_dict[month_report]
        report_start = report_scales[0].split(" - ")[0]
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_date_default = f'{report_start} - {report_end}'
    if get_user_role(request.user) == 'admin':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="english").order_by("regional_manager").exclude(
            amo_id=None).all()
    elif get_user_role(request.user) == 'regional':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="english",
                                               regional_manager=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).all()
    elif get_user_role(request.user) == 'territorial_manager':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="english",
                                               territorial_manager=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).all()
    all_locations = []
    territorial_managers = []
    all_client_managers = []
    for report in reports:
        if report.location not in all_locations:
            all_locations.append(report.location)
        if report.client_manager not in all_client_managers:
            all_client_managers.append(report.client_manager)
        if report.territorial_manager and report.territorial_manager not in territorial_managers:
            territorial_managers.append(report.territorial_manager)
    totals = {
        "Ukraine": {
            "enrolled": 0,
            "attended": 0,
            "payments": 0}}
    reports_by_locations = {}
    for location in all_locations:
        if location is None:
            continue
        location_payments = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                         is_duplicate=0,
                                                         business="english", payment=1, location=location).exclude(
            amo_id=None).all()
        location_attendeds = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                          is_duplicate=0,
                                                          business="english", attended_mc=1,
                                                          location=location).exclude(amo_id=None).all()
        location_enrolled = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                         is_duplicate=0,
                                                         business="english", enrolled_mc=1,
                                                         location=location).exclude(amo_id=None).all()
        location_obj = Location.objects.filter(lms_location_name=location).first()
        if location_obj:
            territorial_manager = location_obj.territorial_manager
            regional_manager = location_obj.regional_manager
            client_manager = location_obj.client_manager
        else:
            print("LOCATION NOT IN LIST!!!", location)
            territorial_manager = location_enrolled[0].territorial_manager
            regional_manager = location_enrolled[0].territorial_manager
            client_manager = location_enrolled[0].territorial_manager

        reports_by_locations[location] = {
            "enrolled": len(location_enrolled),
            "attended": len(location_attendeds),
            "payments": len(location_payments),
            "territorial_manager": territorial_manager,
            "regional_manager": regional_manager,
            "client_manager": client_manager
        }
        totals["Ukraine"]['enrolled'] += len(location_enrolled)
        totals["Ukraine"]['attended'] += len(location_attendeds)
        totals["Ukraine"]['payments'] += len(location_payments)

    reports_by_cm = {}
    for cm in all_client_managers:
        if cm is None:
            continue
        location_payments = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                         is_duplicate=0,
                                                         business="english", payment=1, client_manager=cm).exclude(
            amo_id=None).all()
        location_attendeds = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                          is_duplicate=0,
                                                          business="english", attended_mc=1,
                                                          client_manager=cm).exclude(amo_id=None).all()
        location_enrolled = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                         is_duplicate=0,
                                                         business="english", enrolled_mc=1,
                                                         client_manager=cm).exclude(amo_id=None).all()
        location_obj = Location.objects.filter(client_manager_english=cm).first()
        if location_obj:
            territorial_manager = location_obj.territorial_manager
            regional_manager = location_obj.regional_manager
        else:
            print("CM NOT IN LIST!!!", cm)
            location_obj = Location.objects.filter(client_manager=cm).first()
            if location_obj:
                territorial_manager = location_obj.territorial_manager
                regional_manager = location_obj.regional_manager
            else:
                territorial_manager = location_enrolled[0].territorial_manager if len(location_enrolled) > 0 else None
                regional_manager = location_enrolled[0].territorial_manager if len(location_enrolled) > 0 else None

        reports_by_cm[cm] = {
            "enrolled": len(location_enrolled),
            "attended": len(location_attendeds),
            "payments": len(location_payments),
            "territorial_manager": territorial_manager,
            "regional_manager": regional_manager
        }

    totals_rm = {}
    totals_tm = {}
    for location in reports_by_locations:
        if reports_by_locations[location]["regional_manager"] in totals_rm:
            totals_rm[reports_by_locations[location]["regional_manager"]]["attended"] += reports_by_locations[location][
                "attended"]
            totals_rm[reports_by_locations[location]["regional_manager"]]["enrolled"] += reports_by_locations[location][
                "enrolled"]
            totals_rm[reports_by_locations[location]["regional_manager"]]["payments"] += reports_by_locations[location][
                "payments"]
        else:
            totals_rm[reports_by_locations[location]["regional_manager"]] = {}
            totals_rm[reports_by_locations[location]["regional_manager"]]["attended"] = reports_by_locations[location][
                "attended"]
            totals_rm[reports_by_locations[location]["regional_manager"]]["enrolled"] = reports_by_locations[location][
                "enrolled"]
            totals_rm[reports_by_locations[location]["regional_manager"]]["payments"] = reports_by_locations[location][
                "payments"]
        if reports_by_locations[location]["territorial_manager"] in totals_tm:
            totals_tm[reports_by_locations[location]["territorial_manager"]]["attended"] += \
                reports_by_locations[location][
                    "attended"]
            totals_tm[reports_by_locations[location]["territorial_manager"]]["enrolled"] += \
                reports_by_locations[location][
                    "enrolled"]
            totals_tm[reports_by_locations[location]["territorial_manager"]]["payments"] += \
                reports_by_locations[location][
                    "payments"]
        else:
            totals_tm[reports_by_locations[location]["territorial_manager"]] = {}
            totals_tm[reports_by_locations[location]["territorial_manager"]]["attended"] = \
                reports_by_locations[location][
                    "attended"]
            totals_tm[reports_by_locations[location]["territorial_manager"]]["enrolled"] = \
                reports_by_locations[location][
                    "enrolled"]
            totals_tm[reports_by_locations[location]["territorial_manager"]]["payments"] = \
                reports_by_locations[location][
                    "payments"]
    managers = {}
    for tm in territorial_managers:
        rm = get_rm_by_tm(tm)
        if rm in managers:
            managers[rm].append(tm)
        else:
            managers[rm] = [tm]

    context = {
        'segment': 'english_new',
        "report_date_default": report_date_default,
        "username": request.user.username,
        "report_scales": possible_report_scales,
        "user_group": get_user_role(request.user),
        'reports_by_locations': reports_by_locations,
        'managers': managers,
        'totals_rm': totals_rm,
        'totals_tm': totals_tm,
        'reports_by_cm': reports_by_cm,
        # 'totals_km': total_kms,
        'totals': totals,
        'user_role': get_user_role(request.user)
    }
    html_template = loader.get_template('home/report_english_new_admin.html')
    return HttpResponse(html_template.render(context, request))


@login_required(login_url="/login/")
def programming_tutor_new(request):
    month_report = None
    with open(f"{base_path}/../report_scales.txt", "r", encoding="UTF-8") as report_scales_fileobj:
        scales = report_scales_fileobj.readlines()
    scales_dict = {}
    for i in range(len(scales)):
        scales[i] = scales[i].replace("\n", "").replace("_", " - ")
        month = scales[i].split(":")[0]
        dates = scales[i].split(":")[1]
        if month not in scales_dict:
            scales_dict[month] = [dates]
        else:
            scales_dict[month].append(dates)
    possible_report_scales = []
    for key, value in scales_dict.items():
        possible_report_scales.append(key)
        for val in value:
            possible_report_scales.append(val)
    if request.method == 'POST':
        form = ReportDateForm(request.POST)
        if form.is_valid():
            try:
                report_start, report_end = form.cleaned_data["report_scale"].split(" - ")
            except ValueError:
                month_report = form.cleaned_data["report_scale"]
        else:
            report_start, report_end = possible_report_scales[-1].split(" - ")
    else:
        report_start, report_end = possible_report_scales[-1].split(" - ")
    if not month_report:
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_end = datetime.datetime.strptime(report_end, "%Y-%m-%d").date()
        report_date_default = f"{report_start} - {report_end}"
    else:
        report_end = max(set(StudentReport.objects.all().values_list('end_date', flat=True)))
        report_scales = scales_dict[month_report]
        report_start = report_scales[0].split(" - ")[0]
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_date_default = f'{report_start} - {report_end}'
    if get_user_role(request.user) == 'admin':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="programming").order_by("regional_manager").exclude(
            amo_id=None).all()
    elif get_user_role(request.user) == 'regional':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="programming",
                                               regional_manager=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).all()
    elif get_user_role(request.user) == 'territorial_manager':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="programming",
                                               territorial_manager=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).all()
    elif get_user_role(request.user) == 'tutor':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="programming",
                                               tutor=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).all()
    all_locations = []
    territorial_managers = []
    all_tutors = []
    for report in reports:
        if report.location not in all_locations:
            all_locations.append(report.location)
        if report.tutor not in all_tutors:
            all_tutors.append(report.tutor)
        if report.territorial_manager and report.territorial_manager not in territorial_managers:
            territorial_managers.append(report.territorial_manager)
    totals = {
        "Ukraine": {
            "enrolled": 0,
            "attended": 0,
            "payments": 0}}
    reports_by_tutor = {}
    for location in all_tutors:
        if location is None:
            continue
        location_payments = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                         is_duplicate=0,
                                                         business="programming", payment=1, tutor=location).exclude(
            amo_id=None).all()
        location_attendeds = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                          is_duplicate=0,
                                                          business="programming", attended_mc=1,
                                                          tutor=location).exclude(amo_id=None).all()
        location_enrolled = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                         is_duplicate=0,
                                                         business="programming", enrolled_mc=1,
                                                         tutor=location).exclude(amo_id=None).all()
        location_obj = Location.objects.filter(tutor=location).first()
        if location_obj:
            territorial_manager = location_obj.territorial_manager
            regional_manager = location_obj.regional_manager
        else:
            print("LOCATION NOT IN LIST!!!", location)
            territorial_manager = location_enrolled[0].territorial_manager
            regional_manager = location_enrolled[0].territorial_manager

        reports_by_tutor[location] = {
            "enrolled": len(location_enrolled),
            "attended": len(location_attendeds),
            "payments": len(location_payments),
            "territorial_manager": territorial_manager,
            "regional_manager": regional_manager
        }
        totals["Ukraine"]['enrolled'] += len(location_enrolled)
        totals["Ukraine"]['attended'] += len(location_attendeds)
        totals["Ukraine"]['payments'] += len(location_payments)

    totals_rm = {}
    totals_tm = {}
    for location in reports_by_tutor:
        if reports_by_tutor[location]["regional_manager"] in totals_rm:
            totals_rm[reports_by_tutor[location]["regional_manager"]]["attended"] += reports_by_tutor[location][
                "attended"]
            totals_rm[reports_by_tutor[location]["regional_manager"]]["enrolled"] += reports_by_tutor[location][
                "enrolled"]
            totals_rm[reports_by_tutor[location]["regional_manager"]]["payments"] += reports_by_tutor[location][
                "payments"]
        else:
            totals_rm[reports_by_tutor[location]["regional_manager"]] = {}
            totals_rm[reports_by_tutor[location]["regional_manager"]]["attended"] = reports_by_tutor[location][
                "attended"]
            totals_rm[reports_by_tutor[location]["regional_manager"]]["enrolled"] = reports_by_tutor[location][
                "enrolled"]
            totals_rm[reports_by_tutor[location]["regional_manager"]]["payments"] = reports_by_tutor[location][
                "payments"]
        if reports_by_tutor[location]["territorial_manager"] in totals_tm:
            totals_tm[reports_by_tutor[location]["territorial_manager"]]["attended"] += \
                reports_by_tutor[location][
                    "attended"]
            totals_tm[reports_by_tutor[location]["territorial_manager"]]["enrolled"] += \
                reports_by_tutor[location][
                    "enrolled"]
            totals_tm[reports_by_tutor[location]["territorial_manager"]]["payments"] += \
                reports_by_tutor[location][
                    "payments"]
        else:
            totals_tm[reports_by_tutor[location]["territorial_manager"]] = {}
            totals_tm[reports_by_tutor[location]["territorial_manager"]]["attended"] = \
                reports_by_tutor[location][
                    "attended"]
            totals_tm[reports_by_tutor[location]["territorial_manager"]]["enrolled"] = \
                reports_by_tutor[location][
                    "enrolled"]
            totals_tm[reports_by_tutor[location]["territorial_manager"]]["payments"] = \
                reports_by_tutor[location][
                    "payments"]
    managers = {}
    for tm in territorial_managers:
        rm = get_rm_by_tm(tm)
        if rm in managers:
            managers[rm].append(tm)
        else:
            managers[rm] = [tm]

    context = {
        'segment': 'programming_tutor',
        "report_date_default": report_date_default,
        "username": request.user.username,
        "report_scales": possible_report_scales,
        "user_group": get_user_role(request.user),
        'reports_by_locations': reports_by_tutor,
        'managers': managers,
        'totals_rm': totals_rm,
        'totals_tm': totals_tm,
        'totals': totals,
        'user_role': get_user_role(request.user)
    }
    html_template = loader.get_template('home/report_programming_tutor_new_admin.html')
    return HttpResponse(html_template.render(context, request))


@login_required(login_url="/login/")
def english_tutor_new(request):
    month_report = None
    with open(f"{base_path}/../report_scales.txt", "r", encoding="UTF-8") as report_scales_fileobj:
        scales = report_scales_fileobj.readlines()
    scales_dict = {}
    for i in range(len(scales)):
        scales[i] = scales[i].replace("\n", "").replace("_", " - ")
        month = scales[i].split(":")[0]
        dates = scales[i].split(":")[1]
        if month not in scales_dict:
            scales_dict[month] = [dates]
        else:
            scales_dict[month].append(dates)
    possible_report_scales = []
    for key, value in scales_dict.items():
        possible_report_scales.append(key)
        for val in value:
            possible_report_scales.append(val)
    if request.method == 'POST':
        form = ReportDateForm(request.POST)
        if form.is_valid():
            try:
                report_start, report_end = form.cleaned_data["report_scale"].split(" - ")
            except ValueError:
                month_report = form.cleaned_data["report_scale"]
        else:
            report_start, report_end = possible_report_scales[-1].split(" - ")
    else:
        report_start, report_end = possible_report_scales[-1].split(" - ")
    if not month_report:
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_end = datetime.datetime.strptime(report_end, "%Y-%m-%d").date()
        report_date_default = f"{report_start} - {report_end}"
    else:
        report_end = max(set(StudentReport.objects.all().values_list('end_date', flat=True)))
        report_scales = scales_dict[month_report]
        report_start = report_scales[0].split(" - ")[0]
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_date_default = f'{report_start} - {report_end}'
    if get_user_role(request.user) == 'admin':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="english").order_by("regional_manager").exclude(
            amo_id=None).all()
    elif get_user_role(request.user) == 'regional':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="english",
                                               regional_manager=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).all()
    elif get_user_role(request.user) == 'territorial_manager':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="english",
                                               territorial_manager=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).all()
    elif get_user_role(request.user) == 'tutor':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="english",
                                               tutor=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).all()
    all_locations = []
    territorial_managers = []
    all_tutors = []
    for report in reports:
        if report.location not in all_locations:
            all_locations.append(report.location)
        if report.tutor not in all_tutors:
            all_tutors.append(report.tutor)
        if report.territorial_manager and report.territorial_manager not in territorial_managers:
            territorial_managers.append(report.territorial_manager)
    totals = {
        "Ukraine": {
            "enrolled": 0,
            "attended": 0,
            "payments": 0}}
    reports_by_tutor = {}
    for location in all_tutors:
        if location is None:
            continue
        location_payments = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                         is_duplicate=0,
                                                         business="english", payment=1, tutor=location).exclude(
            amo_id=None).all()
        location_attendeds = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                          is_duplicate=0,
                                                          business="english", attended_mc=1,
                                                          tutor=location).exclude(amo_id=None).all()
        location_enrolled = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end,
                                                         is_duplicate=0,
                                                         business="english", enrolled_mc=1,
                                                         tutor=location).exclude(amo_id=None).all()
        location_obj = Location.objects.filter(tutor_english=location).first()
        if location_obj:
            territorial_manager = location_obj.territorial_manager
            regional_manager = location_obj.regional_manager
        else:
            print("LOCATION NOT IN LIST!!!", location)
            location_obj = Location.objects.filter(tutor_english=location).first()
            if location_obj:
                territorial_manager = location_obj.territorial_manager
                regional_manager = location_obj.regional_manager
            else:
                territorial_manager = location_enrolled[0].territorial_manager if len(location_enrolled) > 0 else None
                regional_manager = location_enrolled[0].territorial_manager if len(location_enrolled) > 0 else None

        reports_by_tutor[location] = {
            "enrolled": len(location_enrolled),
            "attended": len(location_attendeds),
            "payments": len(location_payments),
            "territorial_manager": territorial_manager,
            "regional_manager": regional_manager
        }
        totals["Ukraine"]['enrolled'] += len(location_enrolled)
        totals["Ukraine"]['attended'] += len(location_attendeds)
        totals["Ukraine"]['payments'] += len(location_payments)

    totals_rm = {}
    totals_tm = {}
    for location in reports_by_tutor:
        if reports_by_tutor[location]["regional_manager"] in totals_rm:
            totals_rm[reports_by_tutor[location]["regional_manager"]]["attended"] += reports_by_tutor[location][
                "attended"]
            totals_rm[reports_by_tutor[location]["regional_manager"]]["enrolled"] += reports_by_tutor[location][
                "enrolled"]
            totals_rm[reports_by_tutor[location]["regional_manager"]]["payments"] += reports_by_tutor[location][
                "payments"]
        else:
            totals_rm[reports_by_tutor[location]["regional_manager"]] = {}
            totals_rm[reports_by_tutor[location]["regional_manager"]]["attended"] = reports_by_tutor[location][
                "attended"]
            totals_rm[reports_by_tutor[location]["regional_manager"]]["enrolled"] = reports_by_tutor[location][
                "enrolled"]
            totals_rm[reports_by_tutor[location]["regional_manager"]]["payments"] = reports_by_tutor[location][
                "payments"]
        if reports_by_tutor[location]["territorial_manager"] in totals_tm:
            totals_tm[reports_by_tutor[location]["territorial_manager"]]["attended"] += \
                reports_by_tutor[location][
                    "attended"]
            totals_tm[reports_by_tutor[location]["territorial_manager"]]["enrolled"] += \
                reports_by_tutor[location][
                    "enrolled"]
            totals_tm[reports_by_tutor[location]["territorial_manager"]]["payments"] += \
                reports_by_tutor[location][
                    "payments"]
        else:
            totals_tm[reports_by_tutor[location]["territorial_manager"]] = {}
            totals_tm[reports_by_tutor[location]["territorial_manager"]]["attended"] = \
                reports_by_tutor[location][
                    "attended"]
            totals_tm[reports_by_tutor[location]["territorial_manager"]]["enrolled"] = \
                reports_by_tutor[location][
                    "enrolled"]
            totals_tm[reports_by_tutor[location]["territorial_manager"]]["payments"] = \
                reports_by_tutor[location][
                    "payments"]
    managers = {}
    for tm in territorial_managers:
        rm = get_rm_by_tm(tm)
        if rm in managers:
            managers[rm].append(tm)
        else:
            managers[rm] = [tm]

    context = {
        'segment': 'english_tutor',
        "report_date_default": report_date_default,
        "username": request.user.username,
        "report_scales": possible_report_scales,
        "user_group": get_user_role(request.user),
        'reports_by_locations': reports_by_tutor,
        'managers': managers,
        'totals_rm': totals_rm,
        'totals_tm': totals_tm,
        'totals': totals,
        'user_role': get_user_role(request.user)
    }
    html_template = loader.get_template('home/report_english_tutor_new_admin.html')
    return HttpResponse(html_template.render(context, request))


@login_required(login_url="/login/")
def programming_teacher_new(request):
    month_report = None
    with open(f"{base_path}/../report_scales.txt", "r", encoding="UTF-8") as report_scales_fileobj:
        scales = report_scales_fileobj.readlines()
    scales_dict = {}
    for i in range(len(scales)):
        scales[i] = scales[i].replace("\n", "").replace("_", " - ")
        month = scales[i].split(":")[0]
        dates = scales[i].split(":")[1]
        if month not in scales_dict:
            scales_dict[month] = [dates]
        else:
            scales_dict[month].append(dates)
    possible_report_scales = []
    for key, value in scales_dict.items():
        possible_report_scales.append(key)
        for val in value:
            possible_report_scales.append(val)
    if request.method == 'POST':
        form = ReportDateForm(request.POST)
        if form.is_valid():
            try:
                report_start, report_end = form.cleaned_data["report_scale"].split(" - ")
            except ValueError:
                month_report = form.cleaned_data["report_scale"]
        else:
            report_start, report_end = possible_report_scales[-1].split(" - ")
    else:
        report_start, report_end = possible_report_scales[-1].split(" - ")
    if not month_report:
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_end = datetime.datetime.strptime(report_end, "%Y-%m-%d").date()
        report_date_default = f"{report_start} - {report_end}"
    else:
        report_end = max(set(StudentReport.objects.all().values_list('end_date', flat=True)))
        report_scales = scales_dict[month_report]
        report_start = report_scales[0].split(" - ")[0]
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_date_default = f'{report_start} - {report_end}'
    if get_user_role(request.user) == 'admin':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="programming").order_by("regional_manager").exclude(
            amo_id=None).order_by("location")
    elif get_user_role(request.user) == 'regional':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="programming",
                                               regional_manager=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).order_by("location")
    elif get_user_role(request.user) == 'territorial_manager':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="programming",
                                               territorial_manager=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).order_by("location")
    elif get_user_role(request.user) == 'tutor':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="programming",
                                               tutor=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).order_by("location")
    all_regionals = []
    all_tutors_by_rm = {}
    if get_user_role(request.user) == 'regional':
        all_regionals = [f"{request.user.last_name} {request.user.first_name}"]
        locations = Location.objects.filter(regional_manager=all_regionals[0]).all()
    elif get_user_role(request.user) == 'territorial_manager':
        regional = get_rm_by_tm(f"{request.user.last_name} {request.user.first_name}")
        all_regionals = [regional]
        locations = Location.objects.filter(regional_manager=all_regionals[0]).all()
    elif get_user_role(request.user) == 'tutor':
        regional = get_rm_by_tutor_programming(f"{request.user.last_name} {request.user.first_name}")
        all_regionals = [regional]
        locations = Location.objects.filter(regional_manager=all_regionals[0], tutor=f"{request.user.last_name} {request.user.first_name}").all()
    else:
        locations = Location.objects.all()

    for location in locations:
        if location.regional_manager not in all_regionals:
            all_regionals.append(location.regional_manager)
        if location.tutor not in all_tutors_by_rm:
            all_tutors_by_rm[location.tutor] = location.regional_manager
    teachers_report = {}
    for tutor in all_tutors_by_rm:
        tutor_reports = reports.filter(tutor=tutor)
        for report in tutor_reports:
            if report.teacher and report.teacher in teachers_report:
                teachers_report[report.teacher]["enrolled"] += report.enrolled_mc
                teachers_report[report.teacher]["attended"] += report.attended_mc
                teachers_report[report.teacher]["payments"] += report.payment
            elif report.teacher not in teachers_report and report.teacher:
                teachers_report[report.teacher] = {}
                teachers_report[report.teacher]["enrolled"] = report.enrolled_mc
                teachers_report[report.teacher]["attended"] = report.attended_mc
                teachers_report[report.teacher]["payments"] = report.payment
                teachers_report[report.teacher]["regional_manager"] = report.regional_manager
                teachers_report[report.teacher]["tutor"] = report.tutor

    totals_rm = {}
    totals_tm = {}
    for location in teachers_report:
        if teachers_report[location]["regional_manager"] in totals_rm:
            totals_rm[teachers_report[location]["regional_manager"]]["attended"] += teachers_report[location][
                "attended"]
            totals_rm[teachers_report[location]["regional_manager"]]["enrolled"] += teachers_report[location][
                "enrolled"]
            totals_rm[teachers_report[location]["regional_manager"]]["payments"] += teachers_report[location][
                "payments"]
        else:
            totals_rm[teachers_report[location]["regional_manager"]] = {}
            totals_rm[teachers_report[location]["regional_manager"]]["attended"] = teachers_report[location][
                "attended"]
            totals_rm[teachers_report[location]["regional_manager"]]["enrolled"] = teachers_report[location][
                "enrolled"]
            totals_rm[teachers_report[location]["regional_manager"]]["payments"] = teachers_report[location][
                "payments"]
        if teachers_report[location]["tutor"] in totals_tm:
            totals_tm[teachers_report[location]["tutor"]]["attended"] += \
                teachers_report[location][
                    "attended"]
            totals_tm[teachers_report[location]["tutor"]]["enrolled"] += \
                teachers_report[location][
                    "enrolled"]
            totals_tm[teachers_report[location]["tutor"]]["payments"] += \
                teachers_report[location][
                    "payments"]
        else:
            totals_tm[teachers_report[location]["tutor"]] = {}
            totals_tm[teachers_report[location]["tutor"]]["attended"] = \
                teachers_report[location][
                    "attended"]
            totals_tm[teachers_report[location]["tutor"]]["enrolled"] = \
                teachers_report[location][
                    "enrolled"]
            totals_tm[teachers_report[location]["tutor"]]["payments"] = \
                teachers_report[location][
                    "payments"]
    managers = {}
    for tutor in all_tutors_by_rm:
        rm = get_rm_by_tutor_programming(tutor)
        if rm in managers:
            managers[rm].append(tutor)
        else:
            managers[rm] = [tutor]
    context = {
        'segment': 'programming_teacher_new',
        "report_date_default": report_date_default,
        "username": request.user.username,
        "report_scales": possible_report_scales,
        "user_group": get_user_role(request.user),
        # 'reports_by_locations': reports_by_locations,
        'managers': managers,
        'totals_rm': totals_rm,
        'totals_tm': totals_tm,
        'reports_by_teacher': teachers_report,
        # 'totals_km': total_kms,
        # 'totals': totals,
        'user_role': get_user_role(request.user)
    }
    html_template = loader.get_template('home/report_programming_teacher_admin.html')
    return HttpResponse(html_template.render(context, request))

@login_required(login_url="/login/")
def english_teacher_new(request):
    month_report = None
    with open(f"{base_path}/../report_scales.txt", "r", encoding="UTF-8") as report_scales_fileobj:
        scales = report_scales_fileobj.readlines()
    scales_dict = {}
    for i in range(len(scales)):
        scales[i] = scales[i].replace("\n", "").replace("_", " - ")
        month = scales[i].split(":")[0]
        dates = scales[i].split(":")[1]
        if month not in scales_dict:
            scales_dict[month] = [dates]
        else:
            scales_dict[month].append(dates)
    possible_report_scales = []
    for key, value in scales_dict.items():
        possible_report_scales.append(key)
        for val in value:
            possible_report_scales.append(val)
    if request.method == 'POST':
        form = ReportDateForm(request.POST)
        if form.is_valid():
            try:
                report_start, report_end = form.cleaned_data["report_scale"].split(" - ")
            except ValueError:
                month_report = form.cleaned_data["report_scale"]
        else:
            report_start, report_end = possible_report_scales[-1].split(" - ")
    else:
        report_start, report_end = possible_report_scales[-1].split(" - ")
    if not month_report:
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_end = datetime.datetime.strptime(report_end, "%Y-%m-%d").date()
        report_date_default = f"{report_start} - {report_end}"
    else:
        report_end = max(set(StudentReport.objects.all().values_list('end_date', flat=True)))
        report_scales = scales_dict[month_report]
        report_start = report_scales[0].split(" - ")[0]
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_date_default = f'{report_start} - {report_end}'
    if get_user_role(request.user) == 'admin':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="english").order_by("regional_manager").exclude(
            amo_id=None).order_by("location")
    elif get_user_role(request.user) == 'regional':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="english",
                                               regional_manager=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).order_by("location")
    elif get_user_role(request.user) == 'territorial_manager':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="english",
                                               territorial_manager=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).order_by("location")
    elif get_user_role(request.user) == 'tutor':
        reports = StudentReport.objects.filter(start_date__gte=report_start, end_date__lte=report_end, is_duplicate=0,
                                               business="english",
                                               tutor=f"{request.user.last_name} {request.user.first_name}").exclude(
            amo_id=None).order_by("location")
    all_regionals = []
    all_tutors_by_rm = {}
    if get_user_role(request.user) == 'regional':
        all_regionals = [f"{request.user.last_name} {request.user.first_name}"]
        locations = Location.objects.filter(regional_manager=all_regionals[0]).all()
    elif get_user_role(request.user) == 'territorial_manager':
        regional = get_rm_by_tm(f"{request.user.last_name} {request.user.first_name}")
        all_regionals = [regional]
        locations = Location.objects.filter(regional_manager=all_regionals[0]).all()
    elif get_user_role(request.user) == 'tutor':
        regional = get_rm_by_tutor_english(f"{request.user.last_name} {request.user.first_name}")
        all_regionals = [regional]
        locations = Location.objects.filter(regional_manager=all_regionals[0],
                                            tutor_english=f"{request.user.last_name} {request.user.first_name}").all()
    else:
        locations = Location.objects.all()
    for location in locations:
        if location.regional_manager not in all_regionals:
            all_regionals.append(location.regional_manager)
        if location.tutor_english not in all_tutors_by_rm and location.tutor_english:
            all_tutors_by_rm[location.tutor_english] = location.regional_manager
    teachers_report = {}
    for tutor in all_tutors_by_rm:
        tutor_reports = reports.filter(tutor=tutor)
        for report in tutor_reports:
            if report.teacher and report.teacher in teachers_report:
                teachers_report[report.teacher]["enrolled"] += report.enrolled_mc
                teachers_report[report.teacher]["attended"] += report.attended_mc
                teachers_report[report.teacher]["payments"] += report.payment
            elif report.teacher not in teachers_report and report.teacher:
                teachers_report[report.teacher] = {}
                teachers_report[report.teacher]["enrolled"] = report.enrolled_mc
                teachers_report[report.teacher]["attended"] = report.attended_mc
                teachers_report[report.teacher]["payments"] = report.payment
                teachers_report[report.teacher]["regional_manager"] = report.regional_manager
                teachers_report[report.teacher]["tutor"] = report.tutor

    totals_rm = {}
    totals_tm = {}
    for location in teachers_report:
        if teachers_report[location]["regional_manager"] in totals_rm:
            totals_rm[teachers_report[location]["regional_manager"]]["attended"] += teachers_report[location][
                "attended"]
            totals_rm[teachers_report[location]["regional_manager"]]["enrolled"] += teachers_report[location][
                "enrolled"]
            totals_rm[teachers_report[location]["regional_manager"]]["payments"] += teachers_report[location][
                "payments"]
        else:
            totals_rm[teachers_report[location]["regional_manager"]] = {}
            totals_rm[teachers_report[location]["regional_manager"]]["attended"] = teachers_report[location][
                "attended"]
            totals_rm[teachers_report[location]["regional_manager"]]["enrolled"] = teachers_report[location][
                "enrolled"]
            totals_rm[teachers_report[location]["regional_manager"]]["payments"] = teachers_report[location][
                "payments"]
        if teachers_report[location]["tutor"] in totals_tm:
            totals_tm[teachers_report[location]["tutor"]]["attended"] += \
                teachers_report[location][
                    "attended"]
            totals_tm[teachers_report[location]["tutor"]]["enrolled"] += \
                teachers_report[location][
                    "enrolled"]
            totals_tm[teachers_report[location]["tutor"]]["payments"] += \
                teachers_report[location][
                    "payments"]
        else:
            totals_tm[teachers_report[location]["tutor"]] = {}
            totals_tm[teachers_report[location]["tutor"]]["attended"] = \
                teachers_report[location][
                    "attended"]
            totals_tm[teachers_report[location]["tutor"]]["enrolled"] = \
                teachers_report[location][
                    "enrolled"]
            totals_tm[teachers_report[location]["tutor"]]["payments"] = \
                teachers_report[location][
                    "payments"]
    managers = {}
    for tutor in all_tutors_by_rm:
        rm = get_rm_by_tutor_english(tutor)
        if rm in managers:
            managers[rm].append(tutor)
        else:
            managers[rm] = [tutor]
    context = {
        'segment': 'english_teacher_new',
        "report_date_default": report_date_default,
        "username": request.user.username,
        "report_scales": possible_report_scales,
        "user_group": get_user_role(request.user),
        # 'reports_by_locations': reports_by_locations,
        'managers': managers,
        'totals_rm': totals_rm,
        'totals_tm': totals_tm,
        'reports_by_teacher': teachers_report,
        # 'totals_km': total_kms,
        # 'totals': totals,
        'user_role': get_user_role(request.user)
    }
    html_template = loader.get_template('home/report_english_teacher_admin.html')
    return HttpResponse(html_template.render(context, request))


@login_required(login_url="/login/")
def issues_new(request):
    user_role = get_user_role(request.user)
    no_amo_id = Issue.objects.filter(issue_type="student_issue:no_amo_id",
                                     issue_status__in=["assigned", "to_check", "to_be_assigned"], issue_priority="medium_new").all()
    ready_no_amo_id = {}
    to_be_assigned_amo_id = {}
    for issue in no_amo_id:
        if issue.issue_status in ["resolved", "closed", "resolved_without_actions"]:
            continue
        if not issue.issue_header:
            continue
        header = issue.issue_header
        description = "\n".join(issue.issue_data.split(";"))
        todo = "?????????????? ?????? ???? ?????????????? ???????????????? ?? ?????? ?????? ???????????????? ??????????????????????."
        issue_id = issue.id
        role = issue.issue_roles

        if user_role == "admin":
            if issue.issue_status == "to_be_assigned":
                to_be_assigned_amo_id[issue_id] = {
                    "header": header,
                    "description": description,
                    "todo": todo
                }
            ready_no_amo_id[issue_id] = {
                "header": header,
                "description": description,
                "todo": todo
            }

        if user_role.startswith("territorial_manager") or user_role == "regional":
            if role.startswith("territorial_manager"):
                tm_name = role.split(":")[1]
                rm_name = get_rm_by_tm(tm_name)
                user_full_name = f"{request.user.last_name} {request.user.first_name}"
                if user_full_name == tm_name or user_full_name == rm_name:
                    ready_no_amo_id[issue_id] = {
                        "header": header,
                        "description": description,
                        "todo": todo
                    }
    issues_to_check = Issue.objects.filter(issue_type="to_check:no_amo_id", issue_priority="medium_new").all()
    issues_to_check_ready = {}
    for issue in issues_to_check:
        if issue.issue_status in ["resolved", "closed", "resolved_without_actions"]:
            continue
        header = issue.issue_header
        description = "\n".join(issue.issue_data.split(";"))
        todo = "?????????????????? ?????????????? ??????????????????????"
        issue_id = issue.id
        roles = issue.issue_roles.split(";")
        roles.pop(-1)

        issues_to_check_ready[issue_id] = {
            "header": header,
            "description": description,
            "todo": todo
        }

    # unknown_location = Issue.objects.filter(issue_type="group_issue:unknown_location",
    #                                         issue_status="not_resolved").all()
    # ready_unknown_location = {}
    # for issue in unknown_location:
    #     header = ". ".join(issue.issue_header.split("+++"))
    #     description = "\n".join(issue.issue_data.split("+++"))
    #     todo = "???????????????? ?????????????? ?? ??????."
    #     issue_id = issue.id
    #     roles = issue.issue_roles.split(";")
    #     roles.pop(-1)
    #
    #     if user_role == "admin":
    #         ready_unknown_location[issue_id] = {
    #             "header": header,
    #             "description": description,
    #             "todo": todo
    #         }
    #
    #     if user_role == "territorial_manager" or user_role == "regional":
    #         for role in roles:
    #             if role.startswith("territorial_manager"):
    #                 tm_name = role.split(":")[1]
    #                 rm_name = get_rm_by_tm(tm_name)
    #                 user_full_name = f"{request.user.last_name} {request.user.first_name}"
    #                 if user_full_name == tm_name or user_full_name == rm_name:
    #                     ready_unknown_location[issue_id] = {
    #                         "header": header,
    #                         "description": description,
    #                         "todo": todo
    #                     }
    html_template = loader.get_template('home/issues_new.html')
    context = {
        "segment": "issues",
        "user_role": user_role,
        "no_amo_id": ready_no_amo_id,
        "no_amo_id_to_check": issues_to_check_ready,
        "total_issues": len(ready_no_amo_id),
        "amo_to_check_total": len(issues_to_check_ready),
        "to_be_assigned_amo_id": to_be_assigned_amo_id
    }
    return HttpResponse(html_template.render(context, request))

@login_required(login_url="/login/")
def assign_issue(request, issue_id):
    html_template = loader.get_template('home/assign_issue.html')
    issue: Issue = Issue.objects.filter(id=issue_id).first()
    lms_id = issue.issue_description.split(";")[0]
    if request.method == "POST":
        form = AssignIssueForm(request.POST)
        if form.is_valid():
            tm = form.cleaned_data['territorial_manager']
            location = Location.objects.filter(territorial_manager=tm).first()
            if location is None:
                return HttpResponse(html_template.render({
                    'segment': 'issues',
                    "lms_id": lms_id,
                    "issue_id": issue_id,
                    "form": form,
                    "msg": "???? ?????????? ???????????? ???? ?? ???????????? ??????????????!"}, request))
            else:
                rm = location.regional_manager
                issue.issue_data = issue.issue_data.replace("????: ??????????????????", f"????: {tm}")
                issue.issue_data = issue.issue_data.replace("????: ??????????????????", f"????: {rm}")
                issue.issue_status = "assigned"
                issue.issue_roles = f"territorial_manager:{tm}"
                issue.save()

            return redirect(issues_new)
        else:
            form = AssignIssueForm()
            return HttpResponse(html_template.render({
                'segment': 'issues',
                "lms_id": lms_id,
                "issue_id": issue_id,
                "form": form}, request))

    else:
        form = AssignIssueForm()
        return HttpResponse(html_template.render({
            'segment': 'issues',
            "lms_id": lms_id,
            "issue_id": issue_id,
            "form": form,
            "msg": ""}, request))


@login_required(login_url="/login/")
def close_issue_new(request, issue_id):
    issue: Issue = Issue.objects.filter(id=issue_id).first()
    issue.issue_status = "closed"
    issue.issue_data += ";??????: ?????????????? ?????? ????????;"
    issue.save()
    return redirect(issues_new)


@login_required(login_url="/login/")
def close_issue_reason_new(request, issue_id):
    html_template = loader.get_template('home/reason_new.html')
    issue: Issue = Issue.objects.filter(id=issue_id).first()
    url = "close"
    lms_id = issue.issue_description.split(";")[0]
    if request.method == "POST":
        form = ReasonForCloseForm(request.POST)
        if form.is_valid():
            reason = form.cleaned_data['reason']
            issue.issue_roles = 'admin;'
            issue.issue_status = 'to_check'
            issue.issue_type = f"to_check:{issue.issue_type.split(':')[1]}"
            issue.issue_data += f'??????????????: {reason};??????: ?????????????? ?????? ????????;??????????????: {request.user.last_name} {request.user.first_name};????????, ??????: {datetime.datetime.now()};'
            issue.save()
            return redirect(issues_new)
        else:
            form = ReasonForCloseForm()
            return HttpResponse(html_template.render({
                'segment': 'issues',
                "lms_id": lms_id,
                "issue_id": issue_id,
                "form": form,
                "msg": "???????????????? ???????????? ??????????????!"}, request))

    else:
        form = ReasonForCloseForm()
        return HttpResponse(html_template.render({
            'segment': 'issues',
            "lms_id": lms_id,
            "issue_id": issue_id,
            "form": form,
            "msg": "",
            "url": url}, request))


@login_required(login_url="/login/")
def create_student_amo_ref_new(request, issue_id):
    html_template = loader.get_template('home/create_amo_ref.html')
    issue: Issue = Issue.objects.filter(id=issue_id).first()
    lms_id = issue.issue_description.split(";")[0]
    if request.method == 'POST':
        form = CreateAmoRef(request.POST)
        if form.is_valid():
            entered_amo_id = form.cleaned_data["amo_id"]
            real_amo_id = get_student_amo_id(lms_id)
            if str(entered_amo_id) != str(real_amo_id):
                form = CreateAmoRef()
                return HttpResponse(html_template.render({
                    'segment': 'issues',
                    "lms_id": lms_id,
                    "issue_id": issue_id,
                    "form": form,
                    "msg": "???????????????? ?????? ID ???? ?????????????????? ?? ??????, ???? ?? LMS!"}, request))
            else:
                issue.issue_status = "resolved"
                issue.save()
                student = StudentReport.objects.filter(student_lms_id=lms_id, enrolled_mc=1).all()
                for rep in student:
                    if not rep.amo_id:
                        rep.amo_id = entered_amo_id
                        rep.save()
                return redirect(issues_new)

    else:
        form = CreateAmoRef()
        return HttpResponse(html_template.render({
            'segment': 'issues',
            "lms_id": lms_id,
            "issue_id": issue_id,
            "form": form,
            "msg": ""}, request))


@login_required(login_url="/login/")
def close_no_actions_issue_reason_new(request, issue_id):
    html_template = loader.get_template('home/reason.html')
    issue: Issue = Issue.objects.filter(id=issue_id).first()
    lms_id = issue.issue_description.split(";")[0]
    if request.method == "POST":
        form = ReasonForCloseForm(request.POST)
        if form.is_valid():
            reason = form.cleaned_data['reason']
            issue.issue_roles = 'admin;'
            issue.issue_status = 'to_check'
            issue.issue_type = f"to_check:{issue.issue_type.split(':')[1]}"
            issue.issue_data += f'??????????????: {reason};??????: ???????????????????? ?????? ????????;??????????????: {request.user.last_name} {request.user.first_name};????????, ??????: {datetime.datetime.now()};'
            issue.save()
            return redirect(issues_new)
        else:
            form = ReasonForCloseForm()
            return HttpResponse(html_template.render({
                'segment': 'issues',
                "lms_id": lms_id,
                "issue_id": issue_id,
                "form": form,
                "msg": "???????????????? ???????????? ??????????????!"}, request))

    else:
        form = ReasonForCloseForm()
        return HttpResponse(html_template.render({
            'segment': 'issues',
            "lms_id": lms_id,
            "issue_id": issue_id,
            "form": form,
            "msg": "",
            "url": "add"}, request))


@login_required(login_url="/login/")
def resolve_no_amo_issue_without_actions_new(request, issue_id):
    issue: Issue = Issue.objects.filter(id=issue_id).first()
    lms_id = issue.issue_description.split(";")[0]
    issue.issue_status = "resolved_without_actions"
    issue.save()
    student = StudentReport.objects.filter(student_lms_id=lms_id, enrolled_mc=1).all()
    for rep in student:
        if not rep.amo_id:
            rep.amo_id = 0
            rep.save()
    return redirect(issues_new)


@login_required(login_url="/login/")
def programming(request):
    month_report = None
    totals = {}
    rm_totals = {}
    ukraine_total = {
        "Ukraine": {
            "total": 0,
            "attended": 0,
            "payments": 0}}

    with open(f"{base_path}/../report_scales.txt", "r", encoding="UTF-8") as report_scales_fileobj:
        scales = report_scales_fileobj.readlines()
    scales_dict = {}
    for i in range(len(scales)):
        scales[i] = scales[i].replace("\n", "").replace("_", " - ")
        month = scales[i].split(":")[0]
        dates = scales[i].split(":")[1]
        if month not in scales_dict:
            scales_dict[month] = [dates]
        else:
            scales_dict[month].append(dates)
    possible_report_scales = []
    for key, value in scales_dict.items():
        possible_report_scales.append(key)
        for val in value:
            possible_report_scales.append(val)
    if request.method == 'POST':
        form = ReportDateForm(request.POST)
        if form.is_valid():
            try:
                report_start, report_end = form.cleaned_data["report_scale"].split(" - ")
            except ValueError:
                month_report = form.cleaned_data["report_scale"]
        else:
            report_start, report_end = possible_report_scales[-1].split(" - ")
    else:
        report_start, report_end = possible_report_scales[-1].split(" - ")
    if not month_report:
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_end = datetime.datetime.strptime(report_end, "%Y-%m-%d").date()
        reports = Report.objects.filter(start_date__exact=report_start).filter(
            end_date__exact=report_end).all().order_by("client_manager")
        report_date_default = f"{report_start} - {report_end}"
    else:
        scale_end = max(set(Report.objects.all().values_list('end_date', flat=True)))
        report_scales = scales_dict[month_report]
        scale_start = report_scales[0].split(" - ")[0]
        scale_start = datetime.datetime.strptime(scale_start, "%Y-%m-%d").date()
        reports = Report.objects.filter(start_date__exact=scale_start).filter(end_date__exact=scale_end).all().order_by(
            "client_manager")
        report_date_default = f'{scale_start} - {scale_end}'
    if not is_member(request.user, "territorial_manager"):
        regionals = []
        territorial_managers_by_regionals = {}
        if is_member(request.user, "admin"):
            for report in reports:
                if not (report.regional_manager in regionals):
                    regionals.append(report.regional_manager)
        elif is_member(request.user, "regional"):
            full_name = f'{request.user.last_name} {request.user.first_name}'
            regionals.append(full_name)
        for report in reports:
            if not (report.territorial_manager in territorial_managers_by_regionals):
                territorial_managers_by_regionals[report.territorial_manager] = report.regional_manager

            report.conversion = round(float(report.conversion), 2)
            if report.business == "programming":
                if not (report.territorial_manager in totals):
                    totals[report.territorial_manager] = {
                        "total": report.total,
                        "attended": report.attended,
                        "payments": report.payments
                    }
                else:
                    totals[report.territorial_manager]["total"] += report.total
                    totals[report.territorial_manager]["attended"] += report.attended
                    totals[report.territorial_manager]["payments"] += report.payments
                if not (report.regional_manager in rm_totals):
                    rm_totals[report.regional_manager] = {
                        "total": report.total,
                        "attended": report.attended,
                        "payments": report.payments
                    }
                else:
                    rm_totals[report.regional_manager]["total"] += report.total
                    rm_totals[report.regional_manager]["attended"] += report.attended
                    rm_totals[report.regional_manager]["payments"] += report.payments
                if is_member(request.user, "admin"):
                    ukraine_total["Ukraine"]["total"] += report.total
                    ukraine_total["Ukraine"]["attended"] += report.attended
                    ukraine_total["Ukraine"]["payments"] += report.payments
        for tm in totals:
            if totals[tm]["payments"] == 0 and totals[tm]["attended"] == 0:
                totals[tm]["conversion"] = 0
            else:
                try:
                    totals[tm]["conversion"] = round((totals[tm]["payments"] / totals[tm]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    totals[tm]["conversion"] = 100
        for regman in rm_totals:
            if rm_totals[regman]["payments"] == 0 and rm_totals[regman]["attended"] == 0:
                rm_totals[regman]["conversion"] = 0
            else:
                try:
                    rm_totals[regman]["conversion"] = round(
                        (rm_totals[regman]["payments"] / rm_totals[regman]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    rm_totals[regman]["conversion"] = 100
        if is_member(request.user, "admin"):
            for country in ukraine_total:
                if ukraine_total[country]["payments"] == 0 and ukraine_total[country]["attended"] == 0:
                    ukraine_total[country]["conversion"] = 0
                else:
                    try:
                        ukraine_total[country]["conversion"] = round(
                            (ukraine_total[country]["payments"] / ukraine_total[country]["attended"]) * 100, 2)
                    except ZeroDivisionError:
                        ukraine_total[country]["conversion"] = 100
        reports_by_km = {}
        for report in reports:
            if report.business != "programming":
                continue
            if report.client_manager not in reports_by_km:
                reports_by_km[report.client_manager] = {
                    "total": report.total,
                    "attended": report.attended,
                    "payments": report.payments,
                    "territorial_manager": report.territorial_manager,
                    "regional_manager": report.regional_manager,
                    "business": "programming"
                }
            else:
                reports_by_km[report.client_manager]["total"] += report.total
                reports_by_km[report.client_manager]["attended"] += report.attended
                reports_by_km[report.client_manager]["payments"] += report.payments
        for rep in reports_by_km:
            if reports_by_km[rep]["payments"] == 0 and reports_by_km[rep]["attended"] == 0:
                reports_by_km[rep]["conversion"] = 0
            else:
                try:
                    reports_by_km[rep]["conversion"] = round(
                        (reports_by_km[rep]["payments"] / reports_by_km[rep]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    reports_by_km[rep]["conversion"] = 100

        context = {
            'segment': 'programming',
            "regionals": regionals,
            "tms": territorial_managers_by_regionals,
            "reports": reports,
            "report_date_default": report_date_default,
            "username": request.user.username,
            "report_scales": possible_report_scales,
            "tm_totals": totals,
            "rm_totals": rm_totals,
            "ukraine_total": ukraine_total,
            "reports_by_km": reports_by_km,
            "user_group": get_user_role(request.user)
        }
        html_template = loader.get_template('home/report_programming_admin.html')
    else:
        tm_reports = []
        tm = f"{request.user.last_name} {request.user.first_name}"
        for report in reports:
            if report.territorial_manager == tm:
                report.conversion = round(float(report.conversion), 2)
                tm_reports.append(report)
                if report.business == "programming":
                    if not (report.territorial_manager in totals):
                        totals[report.territorial_manager] = {
                            "total": report.total,
                            "attended": report.attended,
                            "payments": report.payments
                        }
                    else:
                        totals[report.territorial_manager]["total"] += report.total
                        totals[report.territorial_manager]["attended"] += report.attended
                        totals[report.territorial_manager]["payments"] += report.payments
        for tm in totals:
            if totals[tm]["payments"] == 0 and totals[tm]["attended"] == 0:
                totals[tm]["conversion"] = 0
            else:
                try:
                    totals[tm]["conversion"] = round((totals[tm]["payments"] / totals[tm]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    totals[tm]["conversion"] = 100
        reports_by_km = {}
        for report in reports:
            if report.territorial_manager != tm:
                continue
            if report.business != "programming":
                continue
            if report.client_manager not in reports_by_km:
                reports_by_km[report.client_manager] = {
                    "total": report.total,
                    "attended": report.attended,
                    "payments": report.payments,
                    "territorial_manager": report.territorial_manager,
                    "regional_manager": report.regional_manager,
                    "business": "programming"
                }
            else:
                reports_by_km[report.client_manager]["total"] += report.total
                reports_by_km[report.client_manager]["attended"] += report.attended
                reports_by_km[report.client_manager]["payments"] += report.payments
        for rep in reports_by_km:
            if reports_by_km[rep]["payments"] == 0 and reports_by_km[rep]["attended"] == 0:
                reports_by_km[rep]["conversion"] = 0
            else:
                try:
                    reports_by_km[rep]["conversion"] = round(
                        (reports_by_km[rep]["payments"] / reports_by_km[rep]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    reports_by_km[rep]["conversion"] = 100
        context = {
            'segment': 'programming',
            "reports": tm_reports,
            "report_date_default": report_date_default,
            "username": request.user.username,
            "report_scales": possible_report_scales,
            "tm": tm,
            "tm_totals": totals,
            "reports_by_km": reports_by_km,
            "user_group": get_user_role(request.user)
        }
        html_template = loader.get_template('home/report_programming_tm.html')
    return HttpResponse(html_template.render(context, request))


@login_required(login_url="/login/")
def english(request):
    month_report = None
    totals = {}
    rm_totals = {}
    ukraine_total = {
        "Ukraine": {
            "total": 0,
            "attended": 0,
            "payments": 0}}
    with open(f"{base_path}/../report_scales.txt", "r", encoding="UTF-8") as report_scales_fileobj:
        scales = report_scales_fileobj.readlines()
    scales_dict = {}
    for i in range(len(scales)):
        scales[i] = scales[i].replace("\n", "").replace("_", " - ")
        month = scales[i].split(":")[0]
        dates = scales[i].split(":")[1]
        if month not in scales_dict:
            scales_dict[month] = [dates]
        else:
            scales_dict[month].append(dates)
    possible_report_scales = []
    for key, value in scales_dict.items():
        possible_report_scales.append(key)
        for val in value:
            possible_report_scales.append(val)
    if request.method == 'POST':
        form = ReportDateForm(request.POST)
        if form.is_valid():
            try:
                report_start, report_end = form.cleaned_data["report_scale"].split(" - ")
            except ValueError:
                month_report = form.cleaned_data["report_scale"]
        else:
            report_start, report_end = possible_report_scales[-1].split(" - ")
    else:
        report_start, report_end = possible_report_scales[-1].split(" - ")
    if not month_report:
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_end = datetime.datetime.strptime(report_end, "%Y-%m-%d").date()
        reports = Report.objects.filter(start_date__exact=report_start).filter(
            end_date__exact=report_end).all().order_by("client_manager")
        report_date_default = f"{report_start} - {report_end}"
    else:
        report_scales = scales_dict[month_report]
        scale_start = report_scales[0].split(" - ")[0]
        scale_end = report_scales[-1].split(" - ")[1]
        scale_start = datetime.datetime.strptime(scale_start, "%Y-%m-%d").date()
        scale_end = datetime.datetime.strptime(scale_end, "%Y-%m-%d").date()
        reports = Report.objects.filter(start_date__exact=scale_start).filter(end_date__exact=scale_end).all().order_by(
            "client_manager")
        report_date_default = f'{scale_start} - {scale_end}'
    if not is_member(request.user, "territorial_manager"):
        regionals = []
        territorial_managers_by_regionals = {}
        if is_member(request.user, "admin"):
            for report in reports:
                if not (report.regional_manager in regionals):
                    regionals.append(report.regional_manager)
        elif is_member(request.user, "regional"):
            full_name = f'{request.user.last_name} {request.user.first_name}'
            regionals.append(full_name)
        for report in reports:
            if not (report.territorial_manager in territorial_managers_by_regionals):
                territorial_managers_by_regionals[report.territorial_manager] = report.regional_manager

            report.conversion = round(float(report.conversion), 2)
            if report.business == "english":
                if not (report.territorial_manager in totals):
                    totals[report.territorial_manager] = {
                        "total": report.total,
                        "attended": report.attended,
                        "payments": report.payments
                    }
                else:
                    totals[report.territorial_manager]["total"] += report.total
                    totals[report.territorial_manager]["attended"] += report.attended
                    totals[report.territorial_manager]["payments"] += report.payments
                if not (report.regional_manager in rm_totals):
                    rm_totals[report.regional_manager] = {
                        "total": report.total,
                        "attended": report.attended,
                        "payments": report.payments
                    }
                else:
                    rm_totals[report.regional_manager]["total"] += report.total
                    rm_totals[report.regional_manager]["attended"] += report.attended
                    rm_totals[report.regional_manager]["payments"] += report.payments
                if is_member(request.user, "admin"):
                    ukraine_total["Ukraine"]["total"] += report.total
                    ukraine_total["Ukraine"]["attended"] += report.attended
                    ukraine_total["Ukraine"]["payments"] += report.payments
        for tm in totals:
            if totals[tm]["payments"] == 0 and totals[tm]["attended"] == 0:
                totals[tm]["conversion"] = 0
            else:
                try:
                    totals[tm]["conversion"] = round((totals[tm]["payments"] / totals[tm]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    totals[tm]["conversion"] = 100
        for regman in rm_totals:
            if rm_totals[regman]["payments"] == 0 and rm_totals[regman]["attended"] == 0:
                rm_totals[regman]["conversion"] = 0
            else:
                try:
                    rm_totals[regman]["conversion"] = round(
                        (rm_totals[regman]["payments"] / rm_totals[regman]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    rm_totals[regman]["conversion"] = 100
        if is_member(request.user, "admin"):
            for country in ukraine_total:
                if ukraine_total[country]["payments"] == 0 and ukraine_total[country]["attended"] == 0:
                    ukraine_total[country]["conversion"] = 0
                else:
                    try:
                        ukraine_total[country]["conversion"] = round(
                            (ukraine_total[country]["payments"] / ukraine_total[country]["attended"]) * 100, 2)
                    except ZeroDivisionError:
                        ukraine_total[country]["conversion"] = 100
        reports_by_km = {}
        for report in reports:
            if report.business != "english":
                continue
            if report.client_manager not in reports_by_km:
                reports_by_km[report.client_manager] = {
                    "total": report.total,
                    "attended": report.attended,
                    "payments": report.payments,
                    "territorial_manager": report.territorial_manager,
                    "regional_manager": report.regional_manager,
                    "business": "english"
                }
            else:
                reports_by_km[report.client_manager]["total"] += report.total
                reports_by_km[report.client_manager]["attended"] += report.attended
                reports_by_km[report.client_manager]["payments"] += report.payments
        for rep in reports_by_km:
            if reports_by_km[rep]["payments"] == 0 and reports_by_km[rep]["attended"] == 0:
                reports_by_km[rep]["conversion"] = 0
            else:
                try:
                    reports_by_km[rep]["conversion"] = round(
                        (reports_by_km[rep]["payments"] / reports_by_km[rep]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    reports_by_km[rep]["conversion"] = 100

        context = {
            'segment': 'english',
            "regionals": regionals,
            "tms": territorial_managers_by_regionals,
            "reports": reports,
            "report_date_default": report_date_default,
            "username": request.user.username,
            "report_scales": possible_report_scales,
            "tm_totals": totals,
            "rm_totals": rm_totals,
            "ukraine_total": ukraine_total,
            "reports_by_km": reports_by_km,
            "user_group": get_user_role(request.user)
        }
        html_template = loader.get_template('home/report_english_admin.html')
    else:
        tm_reports = []
        tm = f"{request.user.last_name} {request.user.first_name}"
        for report in reports:
            if report.territorial_manager == tm:
                report.conversion = round(float(report.conversion), 2)
                tm_reports.append(report)
                if report.business == "english":
                    if not (report.territorial_manager in totals):
                        totals[report.territorial_manager] = {
                            "total": report.total,
                            "attended": report.attended,
                            "payments": report.payments
                        }
                    else:
                        totals[report.territorial_manager]["total"] += report.total
                        totals[report.territorial_manager]["attended"] += report.attended
                        totals[report.territorial_manager]["payments"] += report.payments
        for tm in totals:
            if totals[tm]["payments"] == 0 and totals[tm]["attended"] == 0:
                totals[tm]["conversion"] = 0
            else:
                try:
                    totals[tm]["conversion"] = round((totals[tm]["payments"] / totals[tm]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    totals[tm]["conversion"] = 100
        reports_by_km = {}
        for report in reports:
            if report.territorial_manager != tm:
                continue
            if report.business != "english":
                continue
            if report.client_manager not in reports_by_km:
                reports_by_km[report.client_manager] = {
                    "total": report.total,
                    "attended": report.attended,
                    "payments": report.payments,
                    "territorial_manager": report.territorial_manager,
                    "regional_manager": report.regional_manager,
                    "business": "english"
                }
            else:
                reports_by_km[report.client_manager]["total"] += report.total
                reports_by_km[report.client_manager]["attended"] += report.attended
                reports_by_km[report.client_manager]["payments"] += report.payments
        for rep in reports_by_km:
            if reports_by_km[rep]["payments"] == 0 and reports_by_km[rep]["attended"] == 0:
                reports_by_km[rep]["conversion"] = 0
            else:
                try:
                    reports_by_km[rep]["conversion"] = round(
                        (reports_by_km[rep]["payments"] / reports_by_km[rep]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    reports_by_km[rep]["conversion"] = 100
        context = {
            'segment': 'english',
            "reports": tm_reports,
            "report_date_default": report_date_default,
            "username": request.user.username,
            "report_scales": possible_report_scales,
            "tm": tm,
            "tm_totals": totals,
            "reports_by_km": reports_by_km,
            "user_group": get_user_role(request.user)
        }
        html_template = loader.get_template('home/report_english_tm.html')
    return HttpResponse(html_template.render(context, request))


@login_required(login_url="/login/")
def tutors_programming(request):
    # reports = Report.objects.all()
    # for report in reports:
    #     location = report.location_name
    #     location_tutor = Location.objects.filter(lms_location_name=location).first().tutor
    #     report.tutor = location_tutor
    #     report.save()
    month_report = None
    totals = {}
    rm_totals = {}
    ukraine_total = {
        "Ukraine": {
            "total": 0,
            "attended": 0,
            "payments": 0}}
    with open(f"{base_path}/../report_scales.txt", "r", encoding="UTF-8") as report_scales_fileobj:
        scales = report_scales_fileobj.readlines()
    scales_dict = {}
    for i in range(len(scales)):
        scales[i] = scales[i].replace("\n", "").replace("_", " - ")
        month = scales[i].split(":")[0]
        dates = scales[i].split(":")[1]
        if month not in scales_dict:
            scales_dict[month] = [dates]
        else:
            scales_dict[month].append(dates)
    possible_report_scales = []
    for key, value in scales_dict.items():
        possible_report_scales.append(key)
        for val in value:
            possible_report_scales.append(val)
    if request.method == 'POST':
        form = ReportDateForm(request.POST)
        if form.is_valid():
            try:
                report_start, report_end = form.cleaned_data["report_scale"].split(" - ")
            except ValueError:
                month_report = form.cleaned_data["report_scale"]
        else:
            report_start, report_end = possible_report_scales[-1].split(" - ")
    else:
        report_start, report_end = possible_report_scales[-1].split(" - ")
    if not month_report:
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_end = datetime.datetime.strptime(report_end, "%Y-%m-%d").date()
        reports = Report.objects.filter(start_date__exact=report_start).filter(
            end_date__exact=report_end).all().order_by("client_manager")
        report_date_default = f"{report_start} - {report_end}"
    else:
        report_scales = scales_dict[month_report]
        scale_start = report_scales[0].split(" - ")[0]
        scale_end = report_scales[-1].split(" - ")[1]
        scale_start = datetime.datetime.strptime(scale_start, "%Y-%m-%d").date()
        scale_end = datetime.datetime.strptime(scale_end, "%Y-%m-%d").date()
        reports = Report.objects.filter(start_date__exact=scale_start).filter(end_date__exact=scale_end).all().order_by(
            "tutor")
        report_date_default = f'{scale_start} - {scale_end}'
    if not is_member(request.user, "territorial_manager"):
        regionals = []
        territorial_managers_by_regionals = {}
        if is_member(request.user, "admin"):
            for report in reports:
                if not (report.regional_manager in regionals):
                    regionals.append(report.regional_manager)
        elif is_member(request.user, "regional"):
            full_name = f'{request.user.last_name} {request.user.first_name}'
            regionals.append(full_name)
        for report in reports:
            if not (report.territorial_manager in territorial_managers_by_regionals):
                territorial_managers_by_regionals[report.territorial_manager] = report.regional_manager

            report.conversion = round(float(report.conversion), 2)
            if report.business == "programming":
                if not (report.territorial_manager in totals):
                    totals[report.territorial_manager] = {
                        "total": report.total,
                        "attended": report.attended,
                        "payments": report.payments
                    }
                else:
                    totals[report.territorial_manager]["total"] += report.total
                    totals[report.territorial_manager]["attended"] += report.attended
                    totals[report.territorial_manager]["payments"] += report.payments
                if not (report.regional_manager in rm_totals):
                    rm_totals[report.regional_manager] = {
                        "total": report.total,
                        "attended": report.attended,
                        "payments": report.payments
                    }
                else:
                    rm_totals[report.regional_manager]["total"] += report.total
                    rm_totals[report.regional_manager]["attended"] += report.attended
                    rm_totals[report.regional_manager]["payments"] += report.payments
                if is_member(request.user, "admin"):
                    ukraine_total["Ukraine"]["total"] += report.total
                    ukraine_total["Ukraine"]["attended"] += report.attended
                    ukraine_total["Ukraine"]["payments"] += report.payments
        for tm in totals:
            if totals[tm]["payments"] == 0 and totals[tm]["attended"] == 0:
                totals[tm]["conversion"] = 0
            else:
                try:
                    totals[tm]["conversion"] = round((totals[tm]["payments"] / totals[tm]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    totals[tm]["conversion"] = 100
        for regman in rm_totals:
            if rm_totals[regman]["payments"] == 0 and rm_totals[regman]["attended"] == 0:
                rm_totals[regman]["conversion"] = 0
            else:
                try:
                    rm_totals[regman]["conversion"] = round(
                        (rm_totals[regman]["payments"] / rm_totals[regman]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    rm_totals[regman]["conversion"] = 100
        if is_member(request.user, "admin"):
            for country in ukraine_total:
                if ukraine_total[country]["payments"] == 0 and ukraine_total[country]["attended"] == 0:
                    ukraine_total[country]["conversion"] = 0
                else:
                    try:
                        ukraine_total[country]["conversion"] = round(
                            (ukraine_total[country]["payments"] / ukraine_total[country]["attended"]) * 100, 2)
                    except ZeroDivisionError:
                        ukraine_total[country]["conversion"] = 100
        reports_by_tutor = {}
        for report in reports:
            if report.business != "programming":
                continue
            if report.tutor not in reports_by_tutor:
                reports_by_tutor[report.tutor] = {
                    "total": report.total,
                    "attended": report.attended,
                    "payments": report.payments,
                    "territorial_manager": report.territorial_manager,
                    "regional_manager": report.regional_manager,
                    "business": "programming"
                }
            else:
                reports_by_tutor[report.tutor]["total"] += report.total
                reports_by_tutor[report.tutor]["attended"] += report.attended
                reports_by_tutor[report.tutor]["payments"] += report.payments
        for rep in reports_by_tutor:
            if reports_by_tutor[rep]["payments"] == 0 and reports_by_tutor[rep]["attended"] == 0:
                reports_by_tutor[rep]["conversion"] = 0
            else:
                try:
                    reports_by_tutor[rep]["conversion"] = round(
                        (reports_by_tutor[rep]["payments"] / reports_by_tutor[rep]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    reports_by_tutor[rep]["conversion"] = 100

        context = {
            'segment': 'programming_tutor',
            "regionals": regionals,
            "tms": territorial_managers_by_regionals,
            "reports": reports,
            "report_date_default": report_date_default,
            "username": request.user.username,
            "report_scales": possible_report_scales,
            "tm_totals": totals,
            "rm_totals": rm_totals,
            "ukraine_total": ukraine_total,
            "reports_by_tutor": reports_by_tutor,
            "user_group": get_user_role(request.user)
        }
        html_template = loader.get_template('home/report_programming_tutor_admin.html')
    else:
        tm_reports = []
        tm = f"{request.user.last_name} {request.user.first_name}"
        for report in reports:
            if report.territorial_manager == tm:
                report.conversion = round(float(report.conversion), 2)
                tm_reports.append(report)
                if report.business == "programming":
                    if not (report.territorial_manager in totals):
                        totals[report.territorial_manager] = {
                            "total": report.total,
                            "attended": report.attended,
                            "payments": report.payments
                        }
                    else:
                        totals[report.territorial_manager]["total"] += report.total
                        totals[report.territorial_manager]["attended"] += report.attended
                        totals[report.territorial_manager]["payments"] += report.payments
        for tm in totals:
            if totals[tm]["payments"] == 0 and totals[tm]["attended"] == 0:
                totals[tm]["conversion"] = 0
            else:
                try:
                    totals[tm]["conversion"] = round((totals[tm]["payments"] / totals[tm]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    totals[tm]["conversion"] = 100
        reports_by_tutor = {}
        for report in reports:
            if report.territorial_manager != tm:
                continue
            if report.business != "programming":
                continue
            if report.tutor not in reports_by_tutor:
                reports_by_tutor[report.tutor] = {
                    "total": report.total,
                    "attended": report.attended,
                    "payments": report.payments,
                    "territorial_manager": report.territorial_manager,
                    "regional_manager": report.regional_manager,
                    "business": "programming"
                }
            else:
                reports_by_tutor[report.tutor]["total"] += report.total
                reports_by_tutor[report.tutor]["attended"] += report.attended
                reports_by_tutor[report.tutor]["payments"] += report.payments
        for rep in reports_by_tutor:
            if reports_by_tutor[rep]["payments"] == 0 and reports_by_tutor[rep]["attended"] == 0:
                reports_by_tutor[rep]["conversion"] = 0
            else:
                try:
                    reports_by_tutor[rep]["conversion"] = round(
                        (reports_by_tutor[rep]["payments"] / reports_by_tutor[rep]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    reports_by_tutor[rep]["conversion"] = 100
        context = {
            'segment': 'programming_tutor',
            "reports": tm_reports,
            "report_date_default": report_date_default,
            "username": request.user.username,
            "report_scales": possible_report_scales,
            "tm": tm,
            "tm_totals": totals,
            "reports_by_tutor": reports_by_tutor,
            "user_group": get_user_role(request.user)
        }
        html_template = loader.get_template('home/report_programming_tutor_tm.html')
    return HttpResponse(html_template.render(context, request))


@login_required(login_url="/login/")
def tutors_english(request):
    # reports = Report.objects.all()
    # for report in reports:
    #     location = report.location_name
    #     location_tutor = Location.objects.filter(lms_location_name=location).first().tutor
    #     report.tutor = location_tutor
    #     report.save()
    month_report = None
    totals = {}
    rm_totals = {}
    ukraine_total = {
        "Ukraine": {
            "total": 0,
            "attended": 0,
            "payments": 0}}
    with open(f"{base_path}/../report_scales.txt", "r", encoding="UTF-8") as report_scales_fileobj:
        scales = report_scales_fileobj.readlines()
    scales_dict = {}
    for i in range(len(scales)):
        scales[i] = scales[i].replace("\n", "").replace("_", " - ")
        month = scales[i].split(":")[0]
        dates = scales[i].split(":")[1]
        if month not in scales_dict:
            scales_dict[month] = [dates]
        else:
            scales_dict[month].append(dates)
    possible_report_scales = []
    for key, value in scales_dict.items():
        possible_report_scales.append(key)
        for val in value:
            possible_report_scales.append(val)
    if request.method == 'POST':
        form = ReportDateForm(request.POST)
        if form.is_valid():
            try:
                report_start, report_end = form.cleaned_data["report_scale"].split(" - ")
            except ValueError:
                month_report = form.cleaned_data["report_scale"]
        else:
            report_start, report_end = possible_report_scales[-1].split(" - ")
    else:
        report_start, report_end = possible_report_scales[-1].split(" - ")
    if not month_report:
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_end = datetime.datetime.strptime(report_end, "%Y-%m-%d").date()
        reports = Report.objects.filter(start_date__exact=report_start).filter(
            end_date__exact=report_end).all().order_by("client_manager")
        report_date_default = f"{report_start} - {report_end}"
    else:
        report_scales = scales_dict[month_report]
        scale_start = report_scales[0].split(" - ")[0]
        scale_end = report_scales[-1].split(" - ")[1]
        scale_start = datetime.datetime.strptime(scale_start, "%Y-%m-%d").date()
        scale_end = datetime.datetime.strptime(scale_end, "%Y-%m-%d").date()
        reports = Report.objects.filter(start_date__exact=scale_start).filter(end_date__exact=scale_end).all().order_by(
            "tutor")
        report_date_default = f'{scale_start} - {scale_end}'
    if not is_member(request.user, "territorial_manager"):
        regionals = []
        territorial_managers_by_regionals = {}
        if is_member(request.user, "admin"):
            for report in reports:
                if not (report.regional_manager in regionals):
                    regionals.append(report.regional_manager)
        elif is_member(request.user, "regional"):
            full_name = f'{request.user.last_name} {request.user.first_name}'
            regionals.append(full_name)
        for report in reports:
            if not (report.territorial_manager in territorial_managers_by_regionals):
                territorial_managers_by_regionals[report.territorial_manager] = report.regional_manager

            report.conversion = round(float(report.conversion), 2)
            if report.business == "english":
                if not (report.territorial_manager in totals):
                    totals[report.territorial_manager] = {
                        "total": report.total,
                        "attended": report.attended,
                        "payments": report.payments
                    }
                else:
                    totals[report.territorial_manager]["total"] += report.total
                    totals[report.territorial_manager]["attended"] += report.attended
                    totals[report.territorial_manager]["payments"] += report.payments
                if not (report.regional_manager in rm_totals):
                    rm_totals[report.regional_manager] = {
                        "total": report.total,
                        "attended": report.attended,
                        "payments": report.payments
                    }
                else:
                    rm_totals[report.regional_manager]["total"] += report.total
                    rm_totals[report.regional_manager]["attended"] += report.attended
                    rm_totals[report.regional_manager]["payments"] += report.payments
                if is_member(request.user, "admin"):
                    ukraine_total["Ukraine"]["total"] += report.total
                    ukraine_total["Ukraine"]["attended"] += report.attended
                    ukraine_total["Ukraine"]["payments"] += report.payments
        for tm in totals:
            if totals[tm]["payments"] == 0 and totals[tm]["attended"] == 0:
                totals[tm]["conversion"] = 0
            else:
                try:
                    totals[tm]["conversion"] = round((totals[tm]["payments"] / totals[tm]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    totals[tm]["conversion"] = 100
        for regman in rm_totals:
            if rm_totals[regman]["payments"] == 0 and rm_totals[regman]["attended"] == 0:
                rm_totals[regman]["conversion"] = 0
            else:
                try:
                    rm_totals[regman]["conversion"] = round(
                        (rm_totals[regman]["payments"] / rm_totals[regman]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    rm_totals[regman]["conversion"] = 100
        if is_member(request.user, "admin"):
            for country in ukraine_total:
                if ukraine_total[country]["payments"] == 0 and ukraine_total[country]["attended"] == 0:
                    ukraine_total[country]["conversion"] = 0
                else:
                    try:
                        ukraine_total[country]["conversion"] = round(
                            (ukraine_total[country]["payments"] / ukraine_total[country]["attended"]) * 100, 2)
                    except ZeroDivisionError:
                        ukraine_total[country]["conversion"] = 100
        reports_by_tutor = {}
        for report in reports:
            if report.business != "english":
                continue
            if report.tutor not in reports_by_tutor:
                reports_by_tutor[report.tutor] = {
                    "total": report.total,
                    "attended": report.attended,
                    "payments": report.payments,
                    "territorial_manager": report.territorial_manager,
                    "regional_manager": report.regional_manager,
                    "business": "english"
                }
            else:
                reports_by_tutor[report.tutor]["total"] += report.total
                reports_by_tutor[report.tutor]["attended"] += report.attended
                reports_by_tutor[report.tutor]["payments"] += report.payments
        for rep in reports_by_tutor:
            if reports_by_tutor[rep]["payments"] == 0 and reports_by_tutor[rep]["attended"] == 0:
                reports_by_tutor[rep]["conversion"] = 0
            else:
                try:
                    reports_by_tutor[rep]["conversion"] = round(
                        (reports_by_tutor[rep]["payments"] / reports_by_tutor[rep]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    reports_by_tutor[rep]["conversion"] = 100

        context = {
            'segment': 'english_tutor',
            "regionals": regionals,
            "tms": territorial_managers_by_regionals,
            "reports": reports,
            "report_date_default": report_date_default,
            "username": request.user.username,
            "report_scales": possible_report_scales,
            "tm_totals": totals,
            "rm_totals": rm_totals,
            "ukraine_total": ukraine_total,
            "reports_by_tutor": reports_by_tutor,
            "user_group": get_user_role(request.user)
        }
        html_template = loader.get_template('home/report_english_tutor_admin.html')
    else:
        tm_reports = []
        tm = f"{request.user.last_name} {request.user.first_name}"
        for report in reports:
            if report.territorial_manager == tm:
                report.conversion = round(float(report.conversion), 2)
                tm_reports.append(report)
                if report.business == "english":
                    if not (report.territorial_manager in totals):
                        totals[report.territorial_manager] = {
                            "total": report.total,
                            "attended": report.attended,
                            "payments": report.payments
                        }
                    else:
                        totals[report.territorial_manager]["total"] += report.total
                        totals[report.territorial_manager]["attended"] += report.attended
                        totals[report.territorial_manager]["payments"] += report.payments
        for tm in totals:
            if totals[tm]["payments"] == 0 and totals[tm]["attended"] == 0:
                totals[tm]["conversion"] = 0
            else:
                try:
                    totals[tm]["conversion"] = round((totals[tm]["payments"] / totals[tm]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    totals[tm]["conversion"] = 100
        reports_by_tutor = {}
        for report in reports:
            if report.territorial_manager != tm:
                continue
            if report.business != "english":
                continue
            if report.tutor not in reports_by_tutor:
                reports_by_tutor[report.tutor] = {
                    "total": report.total,
                    "attended": report.attended,
                    "payments": report.payments,
                    "territorial_manager": report.territorial_manager,
                    "regional_manager": report.regional_manager,
                    "business": "english"
                }
            else:
                reports_by_tutor[report.tutor]["total"] += report.total
                reports_by_tutor[report.tutor]["attended"] += report.attended
                reports_by_tutor[report.tutor]["payments"] += report.payments
        for rep in reports_by_tutor:
            if reports_by_tutor[rep]["payments"] == 0 and reports_by_tutor[rep]["attended"] == 0:
                reports_by_tutor[rep]["conversion"] = 0
            else:
                try:
                    reports_by_tutor[rep]["conversion"] = round(
                        (reports_by_tutor[rep]["payments"] / reports_by_tutor[rep]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    reports_by_tutor[rep]["conversion"] = 100
        context = {
            'segment': 'english_tutor',
            "reports": tm_reports,
            "report_date_default": report_date_default,
            "username": request.user.username,
            "report_scales": possible_report_scales,
            "tm": tm,
            "tm_totals": totals,
            "reports_by_tutor": reports_by_tutor,
            "user_group": get_user_role(request.user)
        }
        html_template = loader.get_template('home/report_english_tutor_tm.html')
    return HttpResponse(html_template.render(context, request))


def get_user_role(user):
    if is_member(user, "admin"):
        return "admin"
    elif is_member(user, "regional"):
        return "regional"
    elif is_member(user, "territorial_manager"):
        return "territorial_manager"
    elif is_member(user, "tutor"):
        return "tutor"


def get_rm_by_tm(tm):
    location = Location.objects.filter(territorial_manager=tm).first()
    if location:
        return location.regional_manager
    else:
        return "None"

def get_rm_by_tutor_programming(tutor):
    location = Location.objects.filter(tutor=tutor).first()
    if location:
        return location.regional_manager
    else:
        return "None"

def get_rm_by_tutor_english(tutor):
    location = Location.objects.filter(tutor_english=tutor).first()
    if location:
        return location.regional_manager
    else:
        return "None"

@login_required(login_url="/login/")
def issues(request):
    user_role = get_user_role(request.user)
    no_amo_id = Issue.objects.filter(issue_type="student_issue:no_amo_id",
                                     issue_status__in=["not_resolved", "to_check"]).all()
    ready_no_amo_id = {}
    for issue in no_amo_id:
        if issue.issue_status in ["resolved", "closed", "resolved_without_actions"]:
            continue
        header = ". ".join(issue.issue_header.split("+++"))
        description = "\n".join(issue.issue_data.split("+++"))
        todo = "?????????????? ?????? ???? ?????????????? ???????????????? ?? ?????? ?????? ???????????????? ??????????????????????."
        issue_id = issue.id
        roles = issue.issue_roles.split(";")
        roles.pop(-1)

        if user_role == "admin":
            ready_no_amo_id[issue_id] = {
                "header": header,
                "description": description,
                "todo": todo
            }

        if user_role == "territorial_manager" or user_role == "regional":
            for role in roles:
                if role.startswith("territorial_manager"):
                    tm_name = role.split(":")[1]
                    rm_name = get_rm_by_tm(tm_name)
                    user_full_name = f"{request.user.last_name} {request.user.first_name}"
                    if user_full_name == tm_name or user_full_name == rm_name:
                        ready_no_amo_id[issue_id] = {
                            "header": header,
                            "description": description,
                            "todo": todo
                        }
    issues_to_check = Issue.objects.filter(issue_type="to_check:no_amo_id").all()
    issues_to_check_ready = {}
    for issue in issues_to_check:
        if issue.issue_status in ["resolved", "closed", "resolved_without_actions"]:
            continue
        header = ". ".join(issue.issue_header.split("+++"))
        description = "\n".join(issue.issue_data.split("+++"))
        todo = "?????????????????? ?????????????? ??????????????????????"
        issue_id = issue.id
        roles = issue.issue_roles.split(";")
        roles.pop(-1)

        issues_to_check_ready[issue_id] = {
            "header": header,
            "description": description,
            "todo": todo
        }

    unknown_location = Issue.objects.filter(issue_type="group_issue:unknown_location",
                                            issue_status="not_resolved").all()
    ready_unknown_location = {}
    for issue in unknown_location:
        header = ". ".join(issue.issue_header.split("+++"))
        description = "\n".join(issue.issue_data.split("+++"))
        todo = "???????????????? ?????????????? ?? ??????."
        issue_id = issue.id
        roles = issue.issue_roles.split(";")
        roles.pop(-1)

        if user_role == "admin":
            ready_unknown_location[issue_id] = {
                "header": header,
                "description": description,
                "todo": todo
            }

        if user_role == "territorial_manager" or user_role == "regional":
            for role in roles:
                if role.startswith("territorial_manager"):
                    tm_name = role.split(":")[1]
                    rm_name = get_rm_by_tm(tm_name)
                    user_full_name = f"{request.user.last_name} {request.user.first_name}"
                    if user_full_name == tm_name or user_full_name == rm_name:
                        ready_unknown_location[issue_id] = {
                            "header": header,
                            "description": description,
                            "todo": todo
                        }
    html_template = loader.get_template('home/issues.html')
    context = {
        "segment": "issues",
        "user_role": user_role,
        "no_amo_id": ready_no_amo_id,
        "no_amo_id_to_check": issues_to_check_ready,
        "total_issues": len(ready_no_amo_id),
        "amo_to_check_total": len(issues_to_check_ready),
        "unknown_location": ready_unknown_location,
        "unknown_location_amount": len(ready_unknown_location)
    }
    return HttpResponse(html_template.render(context, request))


def get_student_amo_id(student_id):
    url = f"https://lms.logikaschool.com/api/v2/student/default/view/{student_id}?id={student_id}&expand=lastGroup%2Cwallet%2Cbranch%2ClastGroup.branch%2CamoLead%2Cgroups%2Cgroups.b2bPartners"
    resp = requests.get(url, headers=library.headers)
    if resp.status_code == 200:
        info_dict = resp.json()
    else:
        raise Exception(f"Status of request for student: {student_id}: response code is {resp.status_code}")
    if info_dict["status"] == "success":
        amo_lead = info_dict.get("data").get("amoLead", None)
        if not amo_lead:
            amo_id = ""
        else:
            amo_id = info_dict.get("data").get("amoLead").get("id")
        return amo_id
    else:
        raise Exception(f"Status of request for student: {student_id} is unsuccessfully got")


def get_group_attendance(group_id):
    url = f'https://lms.logikaschool.com/api/v1/stats/default/attendance?group={group_id}'
    resp = requests.get(url, headers=library.headers)
    data_dict = resp.json()
    return data_dict["data"]


def get_student_attendance(student_id, group_id):
    attendance = get_group_attendance(group_id)
    for student in attendance:
        lms_id = student["student_id"]
        if str(lms_id) == student_id:
            if student["attendance"][0]["status"] == "present":
                attended = "1"
            else:
                attended = "0"
            return attended


def update_report_total(region, start_date,
                        end_date, total,
                        location, business):
    reports = Report.objects.filter(location_name=location, region=region, business=business).all()
    report_to_change = None
    for report in reports:
        if str(report.start_date) == start_date and str(report.end_date) == end_date:
            report_to_change = report
            break
    if report_to_change:
        report_to_change.total = str(int(report_to_change.total) + int(total))
        report_to_change.save()
        print(f"Updated report for {location}")
    else:
        return None


def update_report_attended(region, start_date,
                           end_date, attended,
                           location, business):
    reports = Report.objects.filter(location_name=location, region=region, business=business).all()
    report_to_change = None
    for report in reports:
        if str(report.start_date) == start_date and str(report.end_date) == end_date:
            report_to_change = report
            break
    if report_to_change:
        report_to_change.attended = str(int(report_to_change.attended) + int(attended))
        report_to_change.save()
        print(f"Updated report for {location}")
        return report_to_change
    else:
        return None


def get_conversion(payments, attended):
    conversion = None
    if payments == 0 and attended == 0:
        conversion = 0
    else:
        try:
            conversion = round(
                (payments / attended) * 100, 2)
        except ZeroDivisionError:
            conversion = 100
    return conversion if conversion else 0


def update_teacher(student_id, group_id, attended):
    payment = Payment.objects.filter(client_lms_id=student_id).first()
    group = GlobalGroup.objects.filter(lms_id=group_id).first()
    if not group:
        print("GROUP NOT IN LIST OF ALL GROUPS!!!!")
    else:
        teacher_report = TeacherReport.objects.filter(teacher=group.teacher,
                                                      location_name=group.location.lms_location_name,
                                                      start_date=library.report_start,
                                                      end_date=library.report_end).first()
        if teacher_report:
            if payment:
                teacher_report.payments += 1
            if attended == "1":
                teacher_report.attended += 1
            teacher_report.conversion = get_conversion(teacher_report.payments, teacher_report.attended)
            print(f"UPDATED REPORT FOR {teacher_report.teacher}, {teacher_report.location_name}")
            teacher_report.save()
        else:
            new_report = TeacherReport(teacher=group.teacher,
                                       attended=1 if attended == "1" else 0,
                                       payments=1 if payment else 0,
                                       conversion=0,
                                       location_name=group.location,
                                       region="",
                                       territorial_manager="",
                                       start_date=library.report_start,
                                       end_date=library.report_end,
                                       business="programming",
                                       regional_manager="",
                                       tutor="")

            location = Location.objects.filter(lms_location_name=new_report.location_name).first()
            if location:
                new_report.territorial_manager = location.territorial_manager
                new_report.region = location.region
                new_report.regional_manager = location.regional_manager
                new_report.tutor = location.tutor

            new_report.conversion = get_conversion(new_report.payments, new_report.attended)
            new_report.save()
            print(f"CREATED NEW REPORT FOR {teacher_report.teacher}, {teacher_report.location_name}")


def update_attendance(student_id, issue):
    base_path = os.path.dirname(os.path.dirname(__file__))
    df = pd.read_csv(f"{base_path}/../lms_reports/??????????????_20220831_150332.csv", sep=";")
    df = df[df["ID"] == int(student_id)]
    group = int(df.iloc[0]["ID ????????????"])
    attendance = get_student_attendance(student_id, group)
    group_url = f"https://lms.logikaschool.com/api/v1/group/{group}?expand=venue,teacher,curator,branch"
    resp = requests.get(group_url, headers=library.headers)
    if resp.status_code == 200:
        group_info = resp.json()["data"]
        location_name = group_info.get("venue").get("title")
        region = group_info.get("branch").get("title")
        course = group_info.get("course").get("name")
        course = library.get_business_by_group_course(course)

        update_report_total(region=region, start_date=issue.report_start,
                            end_date=issue.report_end, total=1,
                            location=location_name, business=course)
        if attendance == "1":
            update_attended: Report = update_report_attended(region=region, start_date=issue.report_start,
                                                             end_date=issue.report_end, attended=1,
                                                             location=location_name, business=course)
            if update_attended:
                report = Report.objects.filter(id=update_attended.id).first()
                if report.conversion == 0 and report.attended == 0:
                    report.conversion = 0
                else:
                    try:
                        report.conversion = round(
                            (report.payments / report.attended) * 100, 2)
                    except ZeroDivisionError:
                        report.conversion = 100
                report.save()
        update_teacher(student_id, group, attendance)


@login_required(login_url="/login/")
def create_student_amo_ref(request, issue_id):
    html_template = loader.get_template('home/create_amo_ref.html')
    issue: Issue = Issue.objects.filter(id=issue_id).first()
    lms_id = issue.issue_description.split(";")[0]
    if request.method == 'POST':
        form = CreateAmoRef(request.POST)
        if form.is_valid():
            entered_amo_id = form.cleaned_data["amo_id"]
            real_amo_id = get_student_amo_id(lms_id)
            if str(entered_amo_id) != str(real_amo_id):
                form = CreateAmoRef()
                return HttpResponse(html_template.render({
                    'segment': 'issues',
                    "lms_id": lms_id,
                    "issue_id": issue_id,
                    "form": form,
                    "msg": "???????????????? ?????? ID ???? ?????????????????? ?? ??????, ???? ?? LMS!"}, request))
            else:
                issue.issue_status = "resolved"
                issue.save()
                update_attendance(lms_id, issue)
                return redirect(issues_new)

    else:
        form = CreateAmoRef()
        return HttpResponse(html_template.render({
            'segment': 'issues',
            "lms_id": lms_id,
            "issue_id": issue_id,
            "form": form,
            "msg": ""}, request))


@login_required(login_url="/login/")
def close_issue(request, issue_id):
    issue: Issue = Issue.objects.filter(id=issue_id).first()
    issue.issue_status = "closed"
    issue.issue_data += "??????: ?????????????? ?????? ????????+++"
    issue.save()
    return redirect(issues_new)


@login_required(login_url="/login/")
def close_issue_reason(request, issue_id):
    html_template = loader.get_template('home/reason.html')
    issue: Issue = Issue.objects.filter(id=issue_id).first()
    url = "close"
    lms_id = issue.issue_description.split(";")[0]
    if request.method == "POST":
        form = ReasonForCloseForm(request.POST)
        if form.is_valid():
            reason = form.cleaned_data['reason']
            issue.issue_roles = 'admin;'
            issue.issue_status = 'to_check'
            issue.issue_type = f"to_check:{issue.issue_type.split(':')[1]}"
            issue.issue_data += f'??????????????: {reason}+++??????: ?????????????? ?????? ????????+++'
            issue.save()
            return redirect(issues_new)
        else:
            form = ReasonForCloseForm()
            return HttpResponse(html_template.render({
                'segment': 'issues',
                "lms_id": lms_id,
                "issue_id": issue_id,
                "form": form,
                "msg": "???????????????? ???????????? ??????????????!"}, request))

    else:
        form = ReasonForCloseForm()
        return HttpResponse(html_template.render({
            'segment': 'issues',
            "lms_id": lms_id,
            "issue_id": issue_id,
            "form": form,
            "msg": "",
            "url": url}, request))


@login_required(login_url="/login/")
def close_no_actions_issue_reason(request, issue_id):
    html_template = loader.get_template('home/reason.html')
    issue: Issue = Issue.objects.filter(id=issue_id).first()
    lms_id = issue.issue_description.split(";")[0]
    url = "add"
    if request.method == "POST":
        form = ReasonForCloseForm(request.POST)
        if form.is_valid():
            reason = form.cleaned_data['reason']
            issue.issue_roles = 'admin;'
            issue.issue_status = 'to_check'
            issue.issue_type = f"to_check:{issue.issue_type.split(':')[1]}"
            issue.issue_data += f'??????????????: {reason}+++??????: ???????????????????? ?????? ????????+++'
            issue.save()
            return redirect(issues_new)
        else:
            form = ReasonForCloseForm()
            return HttpResponse(html_template.render({
                'segment': 'issues',
                "lms_id": lms_id,
                "issue_id": issue_id,
                "form": form,
                "msg": "???????????????? ???????????? ??????????????!"}, request))

    else:
        form = ReasonForCloseForm()
        return HttpResponse(html_template.render({
            'segment': 'issues',
            "lms_id": lms_id,
            "issue_id": issue_id,
            "form": form,
            "msg": "",
            "url": "add"}, request))


@login_required(login_url="/login/")
def resolve_no_amo_issue_without_actions(request, issue_id):
    issue: Issue = Issue.objects.filter(id=issue_id).first()
    lms_id = issue.issue_description.split(";")[0]
    issue.issue_status = "resolved_without_actions"
    issue.issue_data += "??????: ???????????????????? ?????? ????????+++"
    issue.save()
    update_attendance(lms_id, issue)
    return redirect(issues)


@login_required(login_url="/login/")
def check_group_location(request, issue_id):
    html_template = loader.get_template('home/unknown_location.html')
    issue: Issue = Issue.objects.filter(id=issue_id).first()
    group_id = issue.issue_description.split(";")[0]
    if request.method == 'POST':
        url = f"https://lms.logikaschool.com/api/v1/group/{group_id}?expand=venue%2Cteacher%2Ccurator%2Cbranch"
        resp = requests.get(url, headers=library.headers)
        location = resp.json()
        location = location['data'].get('venue')
        if location:
            location = location.get('title')
        else:
            return HttpResponse(html_template.render({
                'segment': 'issues',
                "issue_id": issue_id,
                "msg": f"?????????????? ?? ?????????? {group_id} ?????? ???? ???? ??????????????????????!"}, request))
        if location:
            issue.issue_status = "resolved"
            issue.save()
            return redirect(issues)
        else:
            return HttpResponse(html_template.render({
                'segment': 'issues',
                "issue_id": issue_id,
                "msg": f"?????????????? ?? ?????????? {group_id} ?????? ???? ???? ??????????????????????!"}, request))
    else:
        return HttpResponse(html_template.render({
            'segment': 'issues',
            "issue_id": issue_id,
            "msg": f""}, request))


@login_required(login_url="/login/")
def create_location(request, issue_id):
    html_template = loader.get_template('home/create_location.html')

    if request.method == 'POST':
        form = LocationCreateForm(request.POST)
        if form.is_valid():
            print("Valid")
        return redirect(issues)
    else:
        form = LocationCreateForm()

    return HttpResponse(html_template.render({
        'segment': 'issues',
        "form": form}, request))


@login_required(login_url="/login/")
def home(request):
    html_template = loader.get_template('home/home_page.html')
    return HttpResponse(html_template.render({
        'segment': '',
        "user_name": f"{request.user.first_name} {request.user.last_name}"
    }, request))


@login_required(login_url="/login/")
def pages(request):
    context = {}
    # All resource paths end in .html.
    # Pick out the html file name from the url. And load that template.
    try:

        load_template = request.path.split('/')[-1]

        if load_template == 'admin':
            return HttpResponseRedirect(reverse('admin:index'))
        context['segment'] = load_template

        html_template = loader.get_template('home/' + load_template)
        return HttpResponse(html_template.render(context, request))

    except template.TemplateDoesNotExist:

        html_template = loader.get_template('home/page-404.html')
        return HttpResponse(html_template.render(context, request))

    except:
        html_template = loader.get_template('home/page-500.html')
        return HttpResponse(html_template.render(context, request))


@login_required(login_url="/login/")
def teachers_programming(request):
    month_report = None
    totals = {}
    rm_totals = {}
    ukraine_total = {
        "Ukraine": {
            "total": 0,
            "attended": 0,
            "payments": 0}}

    with open(f"{base_path}/../report_scales.txt", "r", encoding="UTF-8") as report_scales_fileobj:
        scales = report_scales_fileobj.readlines()
    scales_dict = {}
    for i in range(len(scales)):
        scales[i] = scales[i].replace("\n", "").replace("_", " - ")
        month = scales[i].split(":")[0]
        dates = scales[i].split(":")[1]
        if month not in scales_dict:
            scales_dict[month] = [dates]
        else:
            scales_dict[month].append(dates)
    possible_report_scales = []
    for key, value in scales_dict.items():
        possible_report_scales.append(key)
        for val in value:
            possible_report_scales.append(val)
    if request.method == 'POST':
        form = ReportDateForm(request.POST)
        if form.is_valid():
            try:
                report_start, report_end = form.cleaned_data["report_scale"].split(" - ")
            except ValueError:
                month_report = form.cleaned_data["report_scale"]
        else:
            report_start, report_end = possible_report_scales[-1].split(" - ")
    else:
        report_start, report_end = possible_report_scales[-1].split(" - ")
    if not month_report:
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_end = datetime.datetime.strptime(report_end, "%Y-%m-%d").date()
        report_date_default = f"{report_start} - {report_end}"
    else:
        report_end = max(set(TeacherReport.objects.all().values_list('end_date', flat=True)))
        report_scales = scales_dict[month_report]
        report_start = report_scales[0].split(" - ")[0]
        report_start = datetime.datetime.strptime(report_start, "%Y-%m-%d").date()
        report_date_default = f'{report_start} - {report_end}'

    reports = TeacherReport.objects.filter(start_date__exact=report_start).filter(
        end_date__exact=report_end).all().order_by("teacher")
    regionals = []
    tutors_by_regionals = {}
    if is_member(request.user, "admin"):
        for report in reports:
            if not (report.regional_manager in regionals):
                regionals.append(report.regional_manager)
    elif is_member(request.user, "regional"):
        full_name = f'{request.user.last_name} {request.user.first_name}'
        regionals.append(full_name)
    for report in reports:
        if not (report.tutor in tutors_by_regionals):
            tutors_by_regionals[report.tutor] = report.regional_manager

        if not (report.tutor in totals):
            totals[report.tutor] = {
                "attended": report.attended,
                "payments": report.payments
            }
        else:
            totals[report.tutor]["attended"] += report.attended
            totals[report.tutor]["payments"] += report.payments
    for tm in totals:
        if totals[tm]["payments"] == 0 and totals[tm]["attended"] == 0:
            totals[tm]["conversion"] = 0
        else:
            try:
                totals[tm]["conversion"] = round((totals[tm]["payments"] / totals[tm]["attended"]) * 100, 2)
            except ZeroDivisionError:
                totals[tm]["conversion"] = 100
    for regman in rm_totals:
        if rm_totals[regman]["payments"] == 0 and rm_totals[regman]["attended"] == 0:
            rm_totals[regman]["conversion"] = 0
        else:
            try:
                rm_totals[regman]["conversion"] = round(
                    (rm_totals[regman]["payments"] / rm_totals[regman]["attended"]) * 100, 2)
            except ZeroDivisionError:
                rm_totals[regman]["conversion"] = 100

    context = {
        'segment': 'teachers_programming',
        "reports_by_tutor": reports,
        "regionals": regionals,
        "tms": tutors_by_regionals,
        "reports": reports,
        "report_date_default": report_date_default,
        "username": request.user.username,
        "report_scales": possible_report_scales,
        "tm_totals": totals,
        "rm_totals": rm_totals,
        "user_group": get_user_role(request.user)
    }
    html_template = loader.get_template('home/report_programming_teacher_admin.html')

    return HttpResponse(html_template.render(context, request))
