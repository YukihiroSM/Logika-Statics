from sqlalchemy.orm import Session
from . import models, schemas
import library
from sqlalchemy import and_, or_, not_
from sql_app.database import SessionLocal


# def get_student(db: Session, user_id: int):
#     return db.query(models.Students).filter(models.Students.id == user_id).first()


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
        print("Group already exists!")
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
        start_date=library.report_start,
        end_date=library.report_end
    )
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    print(f"Report for {rep.region}:{rep.location_name} {rep.start_date}_{rep.end_date} => {rep.conversion} created")
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


def get_student_by_lms_id(db: Session, id: str):
    return db.query(models.Student.lms_id).filter(models.Student.lms_id == id).first()


def get_student_location_by_lms_id(db: Session, id: str):
    return db.query(models.Student.group_location).filter(models.Student.lms_id == id).first()


def get_student_office_by_lms_id(db: Session, id: str):
    return db.query(models.Student.region).filter(models.Student.lms_id == id).first()


def create_student(db: Session, student: schemas.StudentCreate):
    if get_student_by_lms_id(db, student.lms_id):
        # print("Student already exists")
        return

    db_user = models.Student(
        lms_id=student.lms_id,
        student_name=student.student_name,
        group_id=student.group_id,
        group_location=student.group_location,
        region=student.region
    )
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    print("Student created!")
    return db_user


def update_student_location(db, id, location):
    student = db.query(models.Student).filter(models.Student.lms_id == id).first()
    student.group_location = location
    db.commit()
    db.refresh(student)
    return student


def update_student_region(db, id, region):
    student = db.query(models.Student).filter(models.Student.lms_id == id).first()
    student.region = region
    db.commit()
    db.refresh(student)
    return student


def update_student_amo_id(db, id, amo_id):
    student = db.query(models.Student).filter(models.Student.lms_id == id).first()
    student.amo_id = amo_id
    db.commit()
    db.refresh(student)
    return student


def get_students_by_group(db, group_id):
    return db.query(models.Student.lms_id).filter(models.Student.group_id == group_id).all()


def get_global_group_by_id(db, id):
    return db.query(models.GlobalGroup).filter(models.GlobalGroup.group_id == id).first()


def create_globalgroup(db: Session, mc: schemas.GlobalGroupCreate):
    db_user = models.GlobalGroup(
        group_id=mc.group_id,
        group_name=mc.group_name,
        group_location=mc.group_location,
        group_teacher=mc.group_teacher,
        group_manager=mc.group_manager,
        group_region=mc.group_region
    )
    if get_global_group_by_id(db, mc.group_id):
        print("Group already exists!")
        return db_user
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    print("Group created!")
    return db_user


def get_globalgroup_location_by_id(db, id):
    return db.query(models.GlobalGroup.group_location).filter(models.GlobalGroup.group_id == id).first()


def get_globalgroup_office_by_id(db, id):
    return db.query(models.GlobalGroup.group_region).filter(models.GlobalGroup.group_id == id).first()


def get_global_groups(db):
    return db.query(models.GlobalGroup).filter(models.GlobalGroup.group_region == library.region).all()


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
        attended=ref.attended
    )
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    print("Amo ref created!")
    return db_user


def get_payments(db: Session):
    return db.query(models.Payment).all()


def get_locations_by_tm(db: Session, tm: str):
    return db.query(models.Location.lms_location_name, models.Location.region).filter(
        models.Location.territorial_manager == tm).all()


def get_groupids_from_studentamoref(db: Session):
    return db.query(models.StudentAMORef.group_id).all()


def get_studentsamoref_by_group_id(db: Session, grid):
    return db.query(models.StudentAMORef).filter(models.StudentAMORef.group_id == grid).all()


def get_location_by_name_office(db: Session, name, office):
    return db.query(models.Location).filter(
        models.Location.lms_location_name == name and models.Location.region == office).first()


def create_location(db: Session, ref: schemas.LocationCreate):
    if get_location_by_name_office(db, ref.lms_location_name, ref.region):
        return
    db_user = models.Location(
        standart_name=str(ref.lms_location_name).lower().replace(" ", "_").replace("-", "_").replace('"', "'").replace(
            ",", "").replace(".", ""),
        lms_location_name=ref.lms_location_name,
        region=ref.region,
        territorial_manager=ref.territorial_manager
    )
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    print("Location created!")
    return db_user


def update_report_total(db, location, region, tm, start_date, end_date, total):
    report = db.query(models.Report).filter(models.Report.location_name == location).first()
    if report:
        report.total = str(int(report.total) + int(total))
        db.commit()
        db.refresh(report)
    else:
        create_report(db, schemas.ReportCreate(
            location_name=location,
            region=region,
            total=total,
            attended=0,
            payments=0,
            conversion=0,
            students_without_amo="",
            territorial_manager=tm,
            start_date=start_date,
            end_date=end_date
        ))
    return report


def update_report_attended(db, location, region, tm, start_date, end_date, attended):
    report = db.query(models.Report).filter(models.Report.location_name == location).first()
    if report:
        report.attended = str(int(report.attended) + int(attended))
        db.commit()
        db.refresh(report)
    else:
        create_report(db, schemas.ReportCreate(
            location_name=location,
            region=region,
            total=0,
            attended=attended,
            payments=0,
            conversion=0,
            students_without_amo="",
            territorial_manager=tm,
            start_date=start_date,
            end_date=end_date
        ))
    return report


def update_conversions(db):
    reports = db.query(models.Report).all()
    for report in reports:
        try:
            report.conversion = round(report.payments / report.attended, 2) * 100
        except ZeroDivisionError:
            report.conversion = 100
        db.commit()
        db.refresh(report)
    return
