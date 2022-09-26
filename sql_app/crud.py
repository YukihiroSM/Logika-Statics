from sqlalchemy.orm import Session
from . import models, schemas
import library
from sqlalchemy import and_, or_, not_
from sql_app.database import SessionLocal
from datetime import datetime


def create_group(db: Session, mc: schemas.GroupCreate):
    db_user = models.Group(
        group_id=mc.group_id,
        group_name=mc.group_name,
        group_location=mc.group_location,
        group_teacher=mc.group_teacher,
        group_manager=mc.group_manager,
        group_course=mc.group_course,
        report_date_start=mc.report_date_start,
        report_date_end=mc.report_date_end
    )
    if get_group_by_id(db, mc.group_id):
        print("Group already exists!", mc.group_id)
        return db_user
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    print("Group created!")
    return db_user


def get_group_by_id(db: Session, id: str):
    return db.query(models.Group).filter(models.Group.group_id == id).first()


def get_groups(db: Session):
    return db.query(models.Group.group_id).all()


def get_groups_by_start_end(db: Session, start: str, end: str):
    return db.query(models.Group.group_id).filter(
        models.Group.report_date_start == start and models.Group.report_date_end == end).all()


def get_totals_by_location(db: Session, location):
    return db.query(models.Group.total).filter(models.Group.group_location == location).all()


def get_attendeds_by_location(db: Session, location):
    return db.query(models.Group.attended).filter(models.Group.group_location == location).all()


def get_group_location_by_id(db: Session, id):
    return db.query(models.Group.group_location).filter(models.Group.group_id == id).first()


def update_total_group_by_id(db: Session, id, total):
    group = db.query(models.Group).filter(models.Group.group_id == id).first()
    group.total = total
    db.commit()
    db.refresh(group)
    return group


def update_attended_group_by_id(db: Session, id, attended):
    group = db.query(models.Group).filter(models.Group.group_id == id).first()
    group.attended = attended
    db.commit()
    db.refresh(group)
    return group


def get_payment_by_location(db: Session, location: str):
    return db.query(models.Payment).filter(models.Payment.group_location == location).all()


def get_payment_by_lms_id(db: Session, id: str):
    return db.query(models.Payment).filter(models.Payment.client_lms_id == id).first()


def get_payment_by_student_name(db: Session, name: str):
    return db.query(models.Payment).filter(models.Payment.client_name == name).first()


def create_payment(db: Session, paym: schemas.PaymentCreate):
    db_user = models.Payment(
        group_manager=paym.group_manager,
        client_name=paym.client_name,
        client_lms_id=paym.client_lms_id,
        group_course=paym.group_course,
        bussiness=paym.bussiness,
        report_date_start=paym.report_date_start,
        report_date_end=paym.report_date_end
    )
    if get_payment_by_lms_id(db, paym.client_lms_id) and get_payment_by_student_name(db, paym.client_name):
        print(f"Payment {paym.client_lms_id} already exists!")
        return db_user
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    print(f"Payment for {paym.client_lms_id} created!")
    return db_user


def get_standart_location_by_one_c(db, name, region):
    return db.query(models.Location.standart_name).filter(
        models.Location.one_c_location_name == name and models.Location.region == region).first()


def get_standart_location_by_lms(db, name, region):
    return db.query(models.Location.standart_name).filter(
        models.Location.lms_location_name == name and models.Location.region == region).first()


def get_lms_location_by_standart(db, name, region):
    return db.query(models.Location.lms_location_name).filter(
        models.Location.standart_name == name and models.Location.region == region).first()


def create_report(db: Session, rep: schemas.ReportCreate):
    db_user = models.Report(
        location_name=rep.location_name,
        region=rep.region,
        total=rep.total,
        attended=rep.attended,
        payments=rep.payments,
        conversion=rep.conversion,
        students_without_amo=rep.students_without_amo,
        territorial_manager=rep.territorial_manager,
        start_date=rep.start_date,
        end_date=rep.end_date,
        regional_manager=rep.regional_manager,
        client_manager=rep.client_manager,
        business=rep.business,
        tutor=rep.tutor
    )
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    print(
        f"Report for {rep.region}:{rep.location_name} {rep.regional_manager} {rep.start_date}_{rep.end_date} => {rep.conversion} created")
    return db_user


def get_locations_by_region(db: Session, region):
    return db.query(models.Location.standart_name).filter(models.Location.region == region).all()


def get_lms_locations_by_region(db: Session, region):
    return db.query(models.Location.lms_location_name).filter(models.Location.region == region).all()


def update_location_payments(db, location, payments):
    loc = db.query(models.Location).filter(models.Location.standart_name == location).first()
    loc.payments = payments
    db.commit()
    db.refresh(loc)
    return loc


def get_student_amo_ref_by_lms_id(db: Session, id: str):
    return db.query(models.StudentAMORef).filter(models.StudentAMORef.lms_id == id).first()


def update_sudent_amo_ref(db: Session, lms_id: str, amo_id: str):
    ref = db.query(models.StudentAMORef).filter(models.StudentAMORef.lms_id == lms_id).first()
    ref.amo_id = amo_id
    db.commit()
    db.refresh(ref)
    return ref


def create_student_amo_ref(db: Session, ref: schemas.StudentAMORefCreate):
    db_user = models.StudentAMORef(
        lms_id=ref.lms_id,
        amo_id=ref.amo_id,
        group_id=ref.group_id,
        attended=ref.attended,
        report_start=library.report_start,
        report_end=library.report_end
    )
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    print("Amo ref created!", ref.lms_id)
    return db_user


def get_payments(db: Session):
    return db.query(models.Payment).all()


def get_payments_by_start_end(db, date_start, date_end):
    payments = db.query(models.Payment).filter(
        models.Payment.report_date_start.like(date_start),
        models.Payment.report_date_end.like(date_end)
    ).all()
    return payments

def test(db, client_name):
    return db.query(models.Payment).filter(models.Payment.client_name.like(client_name)).first()

def get_locations_by_tm(db: Session, tm: str):
    return db.query(models.Location.lms_location_name, models.Location.region).filter(
        models.Location.territorial_manager == tm).all()


def get_location_by_name(db: Session, name: str):
    return db.query(models.Location).filter(
        models.Location.lms_location_name == name).first()


def get_groupids_from_studentamoref(db: Session):
    return db.query(models.StudentAMORef.group_id).all()


def get_groupids_from_studentamoref_by_dates(db: Session, date_start, date_end):
    group_ids = db.query(models.StudentAMORef.group_id).filter(
        models.StudentAMORef.report_start.like(date_start),
        models.StudentAMORef.report_end.like(date_end)
    ).all()
    return group_ids


def get_studentsamoref_by_group_id(db: Session, grid):
    return db.query(models.StudentAMORef).filter(models.StudentAMORef.group_id == grid).all()


def get_location_by_name_office(db: Session, name, office):
    return db.query(models.Location).filter(
        models.Location.lms_location_name == name and models.Location.region == office).first()


def create_location(db: Session, ref: schemas.LocationCreate):
    loc: models.Location = get_location_by_name(db, ref.lms_location_name)
    if loc:
        loc.lms_location_name = ref.lms_location_name
        loc.region = ref.region
        loc.client_manager = ref.client_manager
        loc.territorial_manager = ref.territorial_manager
        loc.regional_manager = ref.regional_manager
        loc.tutor = ref.tutor
        db.commit()
        db.refresh(loc)
        print("Updated location", ref.lms_location_name)
        return loc


    db_user = models.Location(
        standart_name=str(ref.lms_location_name).lower().replace(" ", "_").replace("-", "_").replace('"', "'").replace(
            ",", "").replace(".", ""),
        lms_location_name=ref.lms_location_name,
        region=ref.region,
        territorial_manager=ref.territorial_manager,
        regional_manager=ref.regional_manager,
        tutor=ref.tutor,
        client_manager=ref.client_manager
    )
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    print("Location created!")
    return db_user


def get_locations(db: Session):
    return db.query(models.Location).all()

def get_reports(db: Session):
    return db.query(models.Report).all()

def update_report_payment(db, location, region, start_date, end_date, payments, business):
    reports = db.query(models.Report).filter(
        models.Report.location_name.like(location),
        models.Report.region.like(region),
        models.Report.business.like(business)
    ).all()
    report_to_change = None
    for report in reports:
        if str(report.start_date) == start_date and str(report.end_date) == end_date:
            report_to_change = report
            break
    if report_to_change:
        report_to_change.payments = str(int(report_to_change.payments) + int(payments))
        db.commit()
        db.refresh(report_to_change)
        print(f"Updated report for {location}")
    else:
        return None
    return report


def update_report_total(db, location, region, start_date, end_date, total, business):
    reports = db.query(models.Report).filter(
        models.Report.location_name.like(location),
        models.Report.region.like(region),
        models.Report.business.like(business)
    ).all()
    report_to_change = None
    for report in reports:
        if str(report.start_date) == start_date and str(report.end_date) == end_date:
            report_to_change = report
            break
    if report_to_change:
        report_to_change.total = str(int(report_to_change.total) + int(total))
        db.commit()
        db.refresh(report_to_change)
        print(f"Updated report for {location}")
    else:
        return None
    return report


def update_report_attended(db, location, region, start_date, end_date, attended, business):
    reports = db.query(models.Report).filter(
        models.Report.location_name.like(location),
        models.Report.region.like(region),
        models.Report.business.like(business)
    ).all()
    report_to_change = None
    for report in reports:
        if str(report.start_date) == start_date and str(report.end_date) == end_date:
            report_to_change = report
            break
    if report_to_change:
        report_to_change.attended = str(int(report_to_change.attended) + int(attended))
        db.commit()
        db.refresh(report_to_change)
        print(f"Updated report for {location}")
    else:
        return None
    return report


def update_conversions(db):
    reports = db.query(models.Report).all()
    reports_to_change = []
    for report in reports:
        if str(report.start_date) == library.report_start and str(report.end_date) == library.report_end:
            reports_to_change.append(report)
    for report in reports_to_change:
        if report.payments == 0 and report.attended == 0:
            report.conversion = 0
        else:
            try:
                report.conversion = (report.payments / report.attended) * 100
            except ZeroDivisionError:
                report.conversion = 100
        db.commit()
        db.refresh(report)
        print(f"Updated conversion for report: ", report, report.location_name)
    return


def create_issue(db, issue_ref: schemas.IssueCreate):
    issue = models.Issue(
        issue_type=issue_ref.issue_type,
        report_start=issue_ref.report_start,
        report_end=issue_ref.report_end,
        issue_description=issue_ref.issue_description,
        issue_status=issue_ref.issue_status,
        issue_priority=issue_ref.issue_priority,
        issue_roles=issue_ref.issue_roles
    )
    db.add(issue)
    db.commit()
    db.refresh(issue)
    print(f"Issue created! {issue_ref.issue_type} - {issue_ref.issue_description}")
    return issue


def get_issues_by_date(db: Session, date_start, date_end):
    issues = db.query(models.Issue).filter(
        models.Issue.report_start.like(date_start),
        models.Issue.report_end.like(date_end)
    ).all()
    return issues
def get_issues(db: Session):
    issues = db.query(models.Issue).all()
    return issues

def update_issue_header(db: Session, id, header):
    issue: models.Issue = db.query(models.Issue).filter(models.Issue.id == id).first()
    if issue.issue_header:
        issue.issue_header += header
    else:
        issue.issue_header = header
    db.commit()
    db.refresh(issue)
    return issue


def update_issue_data(db: Session, id, data):
    issue: models.Issue = db.query(models.Issue).filter(models.Issue.id == id).first()
    if issue.issue_data:
        issue.issue_data += data
    else:
        issue.issue_data = data
    db.commit()
    db.refresh(issue)
    return issue


def update_issue_roles(db: Session, id, role):
    issue: models.Issue = db.query(models.Issue).filter(models.Issue.id == id).first()
    if issue.issue_roles:
        issue.issue_roles += role
    else:
        issue.issue_roles = role
    db.commit()
    db.refresh(issue)
    return issue


def get_tm_by_client_manager(db: Session, client_manager):
    tm = db.query(models.Location.territorial_manager).filter(models.Location.client_manager == client_manager).first()
    return tm


def get_tm_by_location(db: Session, location):
    tm = db.query(models.Location.territorial_manager).filter(models.Location.lms_location_name == location).first()
    return tm

def set_issue_header(db: Session, id, header):
    issue: models.Issue = db.query(models.Issue).filter(models.Issue.id == id).first()

    issue.issue_header = header
    db.commit()
    db.refresh(issue)
    return issue


def set_issue_data(db: Session, id, data):
    issue: models.Issue = db.query(models.Issue).filter(models.Issue.id == id).first()
    issue.issue_data = data
    db.commit()
    db.refresh(issue)
    return issue


def set_issue_roles(db: Session, id, role):
    issue: models.Issue = db.query(models.Issue).filter(models.Issue.id == id).first()
    issue.issue_roles = role
    db.commit()
    db.refresh(issue)
    return issue


def delete_issue_by_id(db: Session, id):
    issue = db.query(models.Issue).filter(models.Issue.id == id)
    issue.delete()
    db.commit()
    return True