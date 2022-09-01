# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from django import template
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import redirect
from django.template import loader
from django.urls import reverse
from .forms import ReportDateForm, CreateAmoRef, CreateLocation
import datetime
import math

import library
from .models import Report, Issue, Location


def is_member(user, group_name):
    return user.groups.filter(name=group_name).exists()


def results(request):
    report_scale = request.POST.get('report_scale', None)
    print(report_scale)


@login_required(login_url="/login/")
def programming(request):
    month_report = None
    totals = {}
    rm_totals = {}
    ukraine_total = {"Ukraine": {"total": 0, "attended": 0, "payments": 0}}
    with open("report_scales.txt", "r") as report_scales_fileobj:
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
        reports = Report.objects.filter(start_date__exact=report_start).filter(end_date__exact=report_end).all().order_by("client_manager")
        report_date_default = f"{report_start} - {report_end}"
    else:
        report_scales = scales_dict[month_report]
        scale_start = report_scales[0].split(" - ")[0]
        scale_end = report_scales[-1].split(" - ")[1]
        scale_start = datetime.datetime.strptime(scale_start, "%Y-%m-%d").date()
        scale_end = datetime.datetime.strptime(scale_end, "%Y-%m-%d").date()
        reports = Report.objects.filter(start_date__exact=scale_start).filter(end_date__exact=scale_end).all().order_by("client_manager")
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
                if not(report.territorial_manager in totals):
                    totals[report.territorial_manager] = {
                        "total": report.total,
                        "attended": report.attended,
                        "payments": report.payments
                    }
                else:
                    totals[report.territorial_manager]["total"] += report.total
                    totals[report.territorial_manager]["attended"] += report.attended
                    totals[report.territorial_manager]["payments"] += report.payments
                if not(report.regional_manager in rm_totals):
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
                    rm_totals[regman]["conversion"] = round((rm_totals[regman]["payments"] / rm_totals[regman]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    rm_totals[regman]["conversion"] = 100
        if is_member(request.user, "admin"):
            for country in ukraine_total:
                if ukraine_total[country]["payments"] == 0 and ukraine_total[country]["attended"] == 0:
                    ukraine_total[country]["conversion"] = 0
                else:
                    try:
                        ukraine_total[country]["conversion"] = round((ukraine_total[country]["payments"] / ukraine_total[country]["attended"]) * 100, 2)
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
            'segment': 'index',
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
            'segment': 'index',
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
    ukraine_total = {"Ukraine": {"total": 0, "attended": 0, "payments": 0}}
    with open("report_scales.txt", "r") as report_scales_fileobj:
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
        reports = Report.objects.filter(start_date__exact=report_start).filter(end_date__exact=report_end).all().order_by("client_manager")
        report_date_default = f"{report_start} - {report_end}"
    else:
        report_scales = scales_dict[month_report]
        scale_start = report_scales[0].split(" - ")[0]
        scale_end = report_scales[-1].split(" - ")[1]
        scale_start = datetime.datetime.strptime(scale_start, "%Y-%m-%d").date()
        scale_end = datetime.datetime.strptime(scale_end, "%Y-%m-%d").date()
        reports = Report.objects.filter(start_date__exact=scale_start).filter(end_date__exact=scale_end).all().order_by("client_manager")
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
                if not(report.territorial_manager in totals):
                    totals[report.territorial_manager] = {
                        "total": report.total,
                        "attended": report.attended,
                        "payments": report.payments
                    }
                else:
                    totals[report.territorial_manager]["total"] += report.total
                    totals[report.territorial_manager]["attended"] += report.attended
                    totals[report.territorial_manager]["payments"] += report.payments
                if not(report.regional_manager in rm_totals):
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
                    rm_totals[regman]["conversion"] = round((rm_totals[regman]["payments"] / rm_totals[regman]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    rm_totals[regman]["conversion"] = 100
        if is_member(request.user, "admin"):
            for country in ukraine_total:
                if ukraine_total[country]["payments"] == 0 and ukraine_total[country]["attended"] == 0:
                    ukraine_total[country]["conversion"] = 0
                else:
                    try:
                        ukraine_total[country]["conversion"] = round((ukraine_total[country]["payments"] / ukraine_total[country]["attended"]) * 100, 2)
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
            'segment': 'index',
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
            'segment': 'index',
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
    with open("report_scales.txt", "r") as report_scales_fileobj:
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
            'segment': 'index',
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
            'segment': 'index',
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
    with open("report_scales.txt", "r") as report_scales_fileobj:
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
            'segment': 'index',
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
            'segment': 'index',
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
    return Location.objects.filter(territorial_manager=tm).first().regional_manager

@login_required(login_url="/login/")
def issues(request):
    user_role = get_user_role(request.user)
    ready_location_not_in_list_issues = {}
    location_not_in_list_issues = Issue.objects.filter(issue_type="group_issue:location_not_in_list").all()
    for issue in location_not_in_list_issues:
        header = ". ".join(issue.issue_header.split("+++"))
        description = "\n".join(issue.issue_data.split("+++"))
        todo = "Створіть локацію - після цього нестиковка автоматично буде вирішена."
        issue_id = issue.id
        roles = issue.issue_roles.split(";")
        roles.pop(-1)

        if user_role == "admin" and "admin" in roles:
            ready_location_not_in_list_issues[issue_id] = {
                "header": header,
                "description": description,
                "todo": todo,
                "issue_id": issue_id
            }
        if user_role == "territorial_manager" or user_role == "regional":
            for role in roles:
                if role.startswith("territorial_manager"):
                    tm_name = role.split(":")[1]
                    rm_name = get_rm_by_tm(tm_name)
                    user_full_name = f"{request.user.last_name} {request.user.first_name}"
                    if user_full_name == tm_name or user_full_name == rm_name:
                        ready_location_not_in_list_issues[issue_id] = {
                            "header": header,
                            "description": description,
                            "todo": todo,
                            "issue_id": issue_id
                        }

    unknown_course_in_mk_issues = Issue.objects.filter(issue_type="group_issue:unknown_course_in_mk").all()

    unknown_location_issues = Issue.objects.filter(issue_type="group_issue:unknown_location").all()
    for issue in unknown_location_issues:
        header = ". ".join(issue.issue_header.split("+++"))
        description = "\n".join(issue.issue_data.split("+++"))
        todo = "Створіть локацію - після цього нестиковка автоматично p."
        issue_id = issue.id
        roles = issue.issue_roles.split(";")
        roles.pop(-1)

        if user_role == "admin" and "admin" in roles:
            ready_location_not_in_list_issues[issue_id] = {
                "header": header,
                "description": description,
                "todo": todo,
                "issue_id": issue_id
            }
        if user_role == "territorial_manager" or user_role == "regional":
            for role in roles:
                if role.startswith("territorial_manager"):
                    tm_name = role.split(":")[1]
                    rm_name = get_rm_by_tm(tm_name)
                    user_full_name = f"{request.user.last_name} {request.user.first_name}"
                    if user_full_name == tm_name or user_full_name == rm_name:
                        ready_location_not_in_list_issues[issue_id] = {
                            "header": header,
                            "description": description,
                            "todo": todo,
                            "issue_id": issue_id
                        }

    no_amo_id = Issue.objects.filter(issue_type="student_issue:no_amo_id").all()
    ready_no_amo_id = {}
    for issue in no_amo_id:
        header = ". ".join(issue.issue_header.split("+++"))
        description = "\n".join(issue.issue_data.split("+++"))
        todo = "Заповніть інформацію про студента або закрийте без змін."
        issue_id = issue.id
        roles = issue.issue_roles.split(";")
        roles.pop(-1)

        if user_role == "admin" and "admin" in roles:
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

    html_template = loader.get_template('home/issues.html')
    context = {"location_not_in_list_issues": ready_location_not_in_list_issues, "user_role": user_role, "no_amo_id": ready_no_amo_id}
    return HttpResponse(html_template.render(context, request))


@login_required(login_url="/login/")
def create_student_amo_ref(request):
    html_template = loader.get_template('home/create_amo_ref.html')

    if request.method == 'POST':
        form = CreateAmoRef(request.POST)
        if form.is_valid():
            lms_id = form.cleaned_data["lms_id"]
            amo_id = form.cleaned_data["amo_id"]
            print(lms_id, amo_id)
        return redirect(issues)

    return HttpResponse(html_template.render({
        'segment': 'index'}, request))


@login_required(login_url="/login/")
def create_location(request):
    html_template = loader.get_template('home/create_location.html')

    if request.method == 'POST':
        form = CreateAmoRef(request.POST)
        if form.is_valid():
            print("Valid")
        return redirect(issues)

    return HttpResponse(html_template.render({
        'segment': 'index'}, request))

@login_required(login_url="/login/")
def home(request):
    html_template = loader.get_template('home/home_page.html')
    return HttpResponse(html_template.render({
                                                 'segment': 'index'}, request))


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
