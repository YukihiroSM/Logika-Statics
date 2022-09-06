import csv
import os.path

from sqlalchemy.orm import Session
from sql_app import crud, models, schemas
from sql_app.database import SessionLocal, engine
import library


# models.Base.metadata.create_all(bind=engine)


def groups_report_to_db():
    csv_path = f'/home/universe.dart.spb/asmidonov/Learning/django-datta-able-master/lms_reports/{library.month}/{library.report_start}_{library.report_end}/cleaned_groups_report.csv'

    # lms_group_id,lms_group_name,lms_group_location,lms_group_teacher,lms_group_manager,lms_group_course
    if not os.path.exists(csv_path):
        return
    with open(csv_path) as f:
        groups = [{k: v for k, v in row.items()} for row in csv.DictReader(f, skipinitialspace=True)]
        for group in groups:
            db = SessionLocal()
            issued = False

            mc = schemas.GroupCreate(
                group_id=group["lms_group_id"],
                group_name=group["lms_group_name"],
                group_location=group["lms_group_location"],
                group_teacher=group["lms_group_teacher"],
                group_manager=group["lms_group_manager"],
                group_course=group["lms_group_course"],
                report_date_start=library.report_start,
                report_date_end=library.report_end
            )
            if group["lms_group_course"] not in ("programming", "english"):
                issued = True
                issue = schemas.IssueCreate(
                    issue_type="group_issue:programming_or_english",
                    report_start=library.report_start,
                    report_end=library.report_end,
                    issue_description=f"{group['lms_group_id']}",
                    issue_status="not_resolved",
                    issue_priority="medium",
                    issue_roles=""
                )
                crud.create_issue(db, issue)
            if group["lms_group_location"] is None or len(group["lms_group_location"]) < 1:
                issued = True
                issue = schemas.IssueCreate(
                    issue_type="group_issue:unknown_location",
                    report_start=library.report_start,
                    report_end=library.report_end,
                    issue_description=f"{group['lms_group_id']}",
                    issue_status="not_resolved",
                    issue_priority="medium",
                    issue_roles=""
                )
                crud.create_issue(db, issue)

            if not issued:
                crud.create_group(db=db, mc=mc)
            db.close()


def get_groups():
    db = SessionLocal()
    ids = crud.get_groups_by_start_end(db, start=library.report_start, end=library.report_end)
    db.close()
    return ids


def update_group_total(id, total):
    db = SessionLocal()
    st = crud.update_total_group_by_id(db, id, total)
    db.close()
    return st


def update_group_attended(id, attended):
    db = SessionLocal()
    st = crud.update_attended_group_by_id(db, id, attended)
    db.close()
    return st


def get_location_by_one_c(name, region):
    db = SessionLocal()
    res = crud.get_standart_location_by_one_c(db, name, region)
    db.close()
    return res


def get_location_by_lms(name, region):
    db = SessionLocal()
    res = crud.get_standart_location_by_lms(db, name, region)
    db.close()
    return res


def get_lms_location_by_standart(name, region):
    db = SessionLocal()
    res = crud.get_lms_location_by_standart(db, name, region)
    db.close()
    return res


def create_report(report):
    db = SessionLocal()
    rep = schemas.ReportCreate(
        location_name=report["location_name"],
        region=report["region"],
        total=report["total"],
        attended=report["attended"],
        payments=report["payments"],
        conversion=report["conversion"],
        start_date=report["report_start"],
        end_date=report["report_end"]
    )
    crud.create_report(db=db, rep=rep)
    db.close()


def get_payments_by_location(location):
    db = SessionLocal()
    res = crud.get_payment_by_location(db, location)
    db.close()
    return res


def get_locations(region):
    db = SessionLocal()
    res = crud.get_locations_by_region(db, region)
    db.close()
    return res


def get_lms_locations(region):
    db = SessionLocal()
    res = crud.get_lms_locations_by_region(db, region)
    db.close()
    return res


def update_location_payments(location, payments):
    db = SessionLocal()
    st = crud.update_location_payments(db, location, payments)
    db.close()
    return st


def get_totals_by_location(location):
    db = SessionLocal()
    res = crud.get_totals_by_location(db, location)
    db.close()
    return res


def get_attendeds_by_location(location):
    db = SessionLocal()
    res = crud.get_attendeds_by_location(db, location)
    db.close()
    return res
