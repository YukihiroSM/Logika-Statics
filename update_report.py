from sql_app import main as sq
import library
import read_lms_mk
from sql_app import crud, schemas
from sql_app.database import SessionLocal
import analyse_payments

students_ref_without_amo = []
students_ref_without_location = []
unknown_payments = []

# db = SessionLocal()
#
# for location in results:
#     if location == "unknown_payments":
#         continue
#     ref = schemas.LocationCreate(
#         lms_location_name=location.split("***")[0],
#         region=location.split("***")[1],
#         territorial_manager=offices[location.split("***")[1]]
#     )
#     crud.create_location(db, ref)
# db.close()
res = {}
db = SessionLocal()
group_ids = list(set([grid[0] for grid in
                      crud.get_groupids_from_studentamoref_by_dates(db, library.report_start, library.report_end)]))
db.close()
for group in group_ids:
    db = SessionLocal()
    group_total = 0
    group_attended = 0
    location = crud.get_globalgroup_location_by_id(db, group)
    office = crud.get_globalgroup_office_by_id(db, group)[0]
    if location and len(location[0]) > 2 and location[0] != "nan":
        location = location[0]
    else:
        students_ref_without_location += crud.get_studentsamoref_by_group_id(db, group)
        continue

    ref = schemas.LocationCreate(
        lms_location_name=location,
        region=office,
        territorial_manager=offices[office]
    )

    students = crud.get_studentsamoref_by_group_id(db, group)
    for student in students:
        if not student.amo_id:
            students_ref_without_amo.append(student)
        else:
            group_total += 1
            if student.attended == '1':
                group_attended += 1
    print(f"Updating group {group} from {location} total: {group_total} attended: {group_attended}")
    crud.update_report_total(db, location=location, region=office, tm=offices[office], start_date=library.report_start,
                             end_date=library.report_end, total=group_total)
    crud.update_report_attended(db, location=location, region=office, tm=offices[office],
                                start_date=library.report_start, end_date=library.report_end, attended=group_attended)

    res[group] = {}
    res[group]["attended_mc"] = group_attended
    res[group]["total"] = group_total

    db.close()
db = SessionLocal()
crud.update_conversions(db)
db.close()
print(res)
print(students_ref_without_amo)
