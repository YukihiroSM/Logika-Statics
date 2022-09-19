import datetime

import initial_create_report
import analyse_payments
import read_lms_mk
import read_1c
import update_report
import library
from sql_app.database import SessionLocal
from sql_app import crud, schemas
from typing import List


with open("report_scales.txt", "r") as report_scales_fileobj:
    scales = [sc.replace("\n", "") for sc in report_scales_fileobj.readlines()]
new_scale = f"{library.month}:{library.report_start}_{library.report_end}"
if new_scale not in scales:
    with open("report_scales.txt", "a") as report_scales_fileobj:
        report_scales_fileobj.write(f'\n{new_scale}')


def generate_month_report(month):

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
    report_scales = scales_dict[month]
    scale_start = report_scales[0].split(" - ")[0]
    scale_end = report_scales[-1].split(" - ")[1]
    scale_start = datetime.datetime.strptime(scale_start, "%Y-%m-%d").date()
    scale_end = datetime.datetime.strptime(scale_end, "%Y-%m-%d").date()
    db = SessionLocal()
    reports: List[schemas.Report] = crud.get_reports(db)
    db.close()
    reports_to_process: List[schemas.Report] = []
    for report in reports:

        if report.start_date >= scale_start and report.end_date <= scale_end:
            reports_to_process.append(report)

    locations = {}
    for rep in reports_to_process:
        if rep.location_name in locations:
            locations[rep.location_name].append(rep)
        else:
            locations[rep.location_name] = [rep]
    for location in locations:
        general_report_total = 0
        general_report_attended = 0
        general_report_payments = 0
        for rep in locations[location]:
            if rep.business == "programming":
                general_report_total += int(rep.total)
                general_report_payments += int(rep.payments)
                general_report_attended += int(rep.attended)
        if general_report_total == 0 and general_report_attended == 0:
            general_report_conversion = 0
        else:
            try:
                general_report_conversion = round((general_report_payments / general_report_attended) * 100, 2)
            except ZeroDivisionError:
                general_report_conversion = 100
        db = SessionLocal()
        crud.create_report(db, schemas.ReportCreate(
            location_name=location,
            region=locations[location][0].region,
            total=general_report_total,
            attended=general_report_attended,
            payments=general_report_payments,
            conversion=general_report_conversion,
            students_without_amo="",
            territorial_manager=locations[location][0].territorial_manager,
            start_date=str(scale_start),
            end_date=str(scale_end),
            regional_manager=locations[location][0].regional_manager,
            client_manager=locations[location][0].client_manager,
            business="programming",
            tutor=locations[location][0].tutor
        ))
        general_report_total = 0
        general_report_attended = 0
        general_report_payments = 0
        for rep in locations[location]:
            if rep.business == "english":
                general_report_total += int(rep.total)
                general_report_payments += int(rep.payments)
                general_report_attended += int(rep.attended)
        if general_report_total == 0 and general_report_attended == 0:
            general_report_conversion = 0
        else:
            try:
                general_report_conversion = round((general_report_payments / general_report_attended) * 100, 2)
            except ZeroDivisionError:
                general_report_conversion = 100
        crud.create_report(db, schemas.ReportCreate(
            location_name=location,
            region=locations[location][0].region,
            total=general_report_total,
            attended=general_report_attended,
            payments=general_report_payments,
            conversion=general_report_conversion,
            students_without_amo="",
            territorial_manager=locations[location][0].territorial_manager,
            start_date=str(scale_start),
            end_date=str(scale_end),
            regional_manager=locations[location][0].regional_manager,
            client_manager=locations[location][0].client_manager,
            business="english",
            tutor=locations[location][0].tutor
        ))
        db.close()


# read_lms_mk.main()
# read_1c.main()
# initial_create_report.main()
# analyse_payments.main()
# update_report.main()
# db = SessionLocal()
# crud.update_conversions(db)
# db.close()
generate_month_report("Вересень")


