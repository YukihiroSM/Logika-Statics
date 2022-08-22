# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from django import template
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader
from django.urls import reverse
from .forms import ReportDateForm
import datetime
import math

import library
from .models import Report


def is_member(user, group_name):
    return user.groups.filter(name=group_name).exists()


def results(request):
    report_scale = request.POST.get('report_scale', None)
    print(report_scale)


monthes = ["august", "june", "july"]


@login_required(login_url="/login/")
def programming(request):
    month_report = None
    totals = {}
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
        reports = Report.objects.filter(start_date__gte=scale_start).filter(end_date__lte=scale_end).all().order_by("client_manager")
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
        for tm in totals:
            if totals[tm]["payments"] == 0 and totals[tm]["attended"] == 0:
                totals[tm]["conversion"] = 0
            else:
                try:
                    totals[tm]["conversion"] = round((totals[tm]["payments"] / totals[tm]["attended"]) * 100, 2)
                except ZeroDivisionError:
                    totals[tm]["conversion"] = 100
        context = {
            'segment': 'index',
            "regionals": regionals,
            "tms": territorial_managers_by_regionals,
            "reports": reports,
            "report_date_default": report_date_default,
            "username": request.user.username,
            "report_scales": possible_report_scales,
            "tm_totals": totals

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

        context = {
            'segment': 'index',
            "reports": tm_reports,
            "report_date_default": report_date_default,
            "username": request.user.username,
            "report_scales": possible_report_scales,
            "tm": tm,
            "tm_totals": totals
        }
        html_template = loader.get_template('home/report_programming_tm.html')
    return HttpResponse(html_template.render(context, request))


def english(request):
    month_report = None
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
        reports = Report.objects.filter(start_date__exact=report_start).filter(end_date__exact=report_end).all().order_by("location_name")
        report_date_default = f"{report_start} - {report_end}"
    else:
        report_scales = scales_dict[month_report]
        scale_start = report_scales[0].split(" - ")[0]
        scale_end = report_scales[-1].split(" - ")[1]
        scale_start = datetime.datetime.strptime(scale_start, "%Y-%m-%d").date()
        scale_end = datetime.datetime.strptime(scale_end, "%Y-%m-%d").date()
        reports = Report.objects.filter(start_date__gte=scale_start).filter(end_date__lte=scale_end).all().order_by("location_name")
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

        context = {
            'segment': 'index',
            "regionals": regionals,
            "tms": territorial_managers_by_regionals,
            "reports": reports,
            "report_date_default": report_date_default,
            "username": request.user.username,
            "report_scales": possible_report_scales

        }
        html_template = loader.get_template('home/report_english_admin.html')
    else:
        tm_reports = []
        tm = f"{request.user.last_name} {request.user.first_name}"
        for report in reports:
            if report.territorial_manager == tm:
                report.conversion = round(float(report.conversion), 2)
                tm_reports.append(report)
        context = {
            'segment': 'index',
            "reports": tm_reports,
            "report_date_default": report_date_default,
            "username": request.user.username,
            "report_scales": possible_report_scales,
            "tm": tm
        }
        html_template = loader.get_template('home/report_english_tm.html')
    return HttpResponse(html_template.render(context, request))


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
