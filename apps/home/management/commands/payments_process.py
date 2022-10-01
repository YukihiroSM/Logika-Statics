import csv

import openpyxl
from django.core.management.base import BaseCommand, CommandError
from apps.home.models import StudentReport, GlobalGroup, Issue
from datetime import datetime
import os
from core.settings import BASE_DIR
from pathlib import Path
import pandas as pd
import requests
import library
        # import the logging library
import logging
        # Get an instance of a logger
parsing_results = {}


class Command(BaseCommand):
    help = 'Does some magical work'

    def __init__(self):
        super().__init__()

        self.logger = logging.getLogger(__name__)

    def message(self, msg):
        self.logger.debug(str(msg) + " " + str(datetime.now()))
    def add_arguments(self, parser):
        parser.add_argument(
            '-c',
            '--course',
            type=str,
            default=None,
            help='Course',
            dest='course'
        )
    @staticmethod
    def process_payment(paym):
        if paym is None:
            return 0
        if isinstance(paym, str):
            paym = paym.replace(".00", "").replace(",", "")
            return int(paym)
        else:
            return paym

    def handle(self, *args, **options):
        start_date = os.environ.get("start_date")
        end_date = os.environ.get("end_date")
        month = os.environ.get("month")
        url_start = start_date.replace("-", "")
        url_end = end_date.replace("-", "")
        course = "Школы Программирования" if options['course'] == 'programming' else "english"
        url = f"https://school.cloud24.com.ua:22443/SCHOOL/ru_RU/hs/1cData/B2C/?from={url_start}&till={url_end}&businessDirection={course}&firstPayment=true"

        response = requests.get(url, headers=library.payments_headers, verify=False)
        payments_data = response.json()
        for payment in payments_data:
            if payment['Оплата'] >= 500:
                student_id = payment['КлиентID_БО']
                business = "programming" if payment["НаправлениеБизнеса"] == "Школы программирования" else "english"
                existing_report = StudentReport.objects.filter(student_lms_id=student_id, business=business, enrolled_mc=1).first()
                if existing_report:
                    self.logger.debug("FOUND EXISTING REPORT FOR" + str(student_id) + str(datetime.now()))
                    report = StudentReport(
                        student_lms_id=student_id,
                        student_first_name=existing_report.student_first_name,
                        student_last_name=existing_report.student_last_name,
                        student_mk_group_id=existing_report.student_mk_group_id,
                        student_current_group_id=existing_report.student_current_group_id,
                        enrolled_mc=0,
                        attended_mc=0,
                        amo_id=0,
                        payment=1,
                        location=existing_report.location,
                        teacher=existing_report.teacher,
                        client_manager=existing_report.client_manager,
                        territorial_manager=existing_report.territorial_manager,
                        regional_manager=existing_report.regional_manager,
                        tutor=existing_report.tutor,
                        business=existing_report.business,
                        course=existing_report.course,
                        is_duplicate=0,
                        start_date=datetime.strptime(start_date, "%Y-%m-%d").date(),
                        end_date=datetime.strptime(end_date, "%Y-%m-%d").date()
                    )
                    report.save()
                    continue
                url = f"https://lms.logikaschool.com/api/v2/student/default/view/{student_id}?id={student_id}&expand=lastGroup%2Cwallet%2Cbranch%2ClastGroup.branch%2CamoLead%2Cgroups%2Cgroups.b2bPartners"
                resp = requests.get(url, headers=library.headers)
                if resp.status_code == 200:
                    info_dict = resp.json()['data']
                    first_name = info_dict["firstName"]
                    last_name = info_dict["lastName"]
                    group_obj = None
                    last_group = None
                    groups = info_dict["groups"]
                    if len(groups) == 0:
                        issue = Issue(
                            issue_type="payment_issue:student_has_no_groups",
                            report_start=library.report_start,
                            report_end=library.report_end,
                            issue_description=f"{student_id};{payment['Клиент']};{payment['ГородРегион']};{payment['Город']};{payment['ГруппаОбученияКуратор']}",
                            issue_status="not_resolved",
                            issue_priority="medium_new",
                            issue_roles=""
                        )
                        issue.save()
                        report = StudentReport(
                            student_lms_id=student_id,
                            student_first_name=first_name,
                            student_last_name=last_name,
                            student_mk_group_id=None,
                            student_current_group_id=None,
                            enrolled_mc=0,
                            attended_mc=0,
                            amo_id=0,
                            payment=1,
                            location=None,
                            teacher=None,
                            client_manager=None,
                            territorial_manager=None,
                            regional_manager=None,
                            tutor=None,
                            business=None,
                            course=None,
                            is_duplicate=0,
                            start_date=datetime.strptime(start_date, "%Y-%m-%d").date(),
                            end_date=datetime.strptime(end_date, "%Y-%m-%d").date()
                        )
                        report.save()
                        continue
                    else:
                        mks = []
                        not_mks = []
                        for i in range(len(groups)):
                            group_obj = GlobalGroup.objects.filter(lms_id=groups[i]['id']).first()
                            try:
                                if group_obj.group_type != "Мастер-класс" and i != len(groups) - 1:
                                    not_mks.append(group_obj)
                                else:
                                    mks.append(group_obj)

                            except AttributeError:
                                if i == len(groups)-1:
                                    self.logger.debug("CAN'T FIND STUDENT GROUP IN ALL GROUPS" + " " + str(datetime.now()))
                                    issue = Issue(
                                        issue_type="payment_issue:student_group_not_found",
                                        report_start=start_date,
                                        report_end=end_date,
                                        issue_description=f"{student_id};{payment['Клиент']};{payment['ГородРегион']};{payment['Город']};{payment['ГруппаОбученияКуратор']}",
                                        issue_status="not_resolved",
                                        issue_priority="medium_new",
                                        issue_roles=""
                                    )
                                    issue.save()
                                    report = StudentReport(
                                        student_lms_id=student_id,
                                        student_first_name=None,
                                        student_last_name=None,
                                        student_mk_group_id=None,
                                        student_current_group_id=None,
                                        enrolled_mc=0,
                                        attended_mc=0,
                                        amo_id=0,
                                        payment=1,
                                        location=None,
                                        teacher=None,
                                        client_manager=None,
                                        territorial_manager=None,
                                        regional_manager=None,
                                        tutor=None,
                                        business=None,
                                        course=None,
                                        is_duplicate=0,
                                        start_date=datetime.strptime(start_date, "%Y-%m-%d").date(),
                                        end_date=datetime.strptime(end_date, "%Y-%m-%d").date()
                                    )
                                    report.save()
                                    break
                        if len(mks) > 0:
                            last_group = mks[-1]
                        elif len(not_mks) > 0:
                            last_group = not_mks[-1]
                    if not last_group or not last_group.location:
                        location = None
                    else:
                        location = last_group.location.lms_location_name
                    self.logger.debug(f"Creating report for {str(student_id)}" + " " + str(datetime.now()))
                    report = StudentReport(
                        student_lms_id=student_id,
                        student_first_name=first_name,
                        student_last_name=last_name,
                        student_mk_group_id=last_group,
                        student_current_group_id=None,
                        enrolled_mc=0,
                        attended_mc=0,
                        amo_id=0,
                        payment=1,
                        location=location,
                        teacher=last_group.teacher if last_group else None,
                        client_manager=last_group.location.client_manager if last_group and last_group.location else None,
                        territorial_manager=last_group.location.territorial_manager if last_group and last_group.location else None,
                        regional_manager=last_group.location.regional_manager if last_group and last_group.location else None,
                        tutor=last_group.location.tutor if last_group and last_group.location else None,
                        business=business,
                        course=last_group.full_course if last_group and last_group.location else None,
                        is_duplicate=0,
                        start_date=datetime.strptime(start_date, "%Y-%m-%d").date(),
                        end_date=datetime.strptime(end_date, "%Y-%m-%d").date()
                    )
                    report.save()
                else:
                    self.logger.debug("CAN'T FIND STUDENT" + " " + str(datetime.now()))
                    issue = Issue(
                        issue_type="payment_issue:student_not_found",
                        report_start=start_date,
                        report_end=end_date,
                        issue_description=f"{student_id};{payment['Клиент']};{payment['ГородРегион']};{payment['Город']};{payment['ГруппаОбученияКуратор']}",
                        issue_status="not_resolved",
                        issue_priority="medium_new",
                        issue_roles="admin;"
                    )
                    issue.save()

                    report = StudentReport(
                        student_lms_id=student_id,
                        student_first_name=None,
                        student_last_name=None,
                        student_mk_group_id=None,
                        student_current_group_id=None,
                        enrolled_mc=0,
                        attended_mc=0,
                        amo_id=0,
                        payment=1,
                        location=None,
                        teacher=None,
                        client_manager=None,
                        territorial_manager=None,
                        regional_manager=None,
                        tutor=None,
                        business=None,
                        course=None,
                        is_duplicate=0,
                        start_date=datetime.strptime(start_date, "%Y-%m-%d").date(),
                        end_date=datetime.strptime(end_date, "%Y-%m-%d").date()
                    )
                    report.save()
            else:
                self.logger.debug(f"СЛИШКОМ МАЛЕННЬКАЯ ОПЛАТА!!!! {str(payment['КлиентID_БО'])}" + " " + str(datetime.now()))
                issue = Issue(
                    issue_type="payment_issue:too_small_payment",
                    report_start=start_date,
                    report_end=end_date,
                    issue_description=f"{str(payment['КлиентID_БО'])};{payment['Клиент']};{payment['ГородРегион']};{payment['Город']};{payment['ГруппаОбученияКуратор']}",
                    issue_status="not_resolved",
                    issue_priority="medium_new",
                    issue_roles="admin;"
                )
                issue.save()
                report = StudentReport(
                    student_lms_id=payment['КлиентID_БО'],
                    student_first_name=None,
                    student_last_name=None,
                    student_mk_group_id=None,
                    student_current_group_id=None,
                    enrolled_mc=0,
                    attended_mc=0,
                    amo_id=0,
                    payment=0,
                    location=None,
                    teacher=None,
                    client_manager=None,
                    territorial_manager=None,
                    regional_manager=None,
                    tutor=None,
                    business=None,
                    course=None,
                    is_duplicate=0,
                    start_date=datetime.strptime(start_date, "%Y-%m-%d").date(),
                    end_date=datetime.strptime(end_date, "%Y-%m-%d").date()
                )
                report.save()
                continue
