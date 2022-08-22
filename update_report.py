import requests
import library
from sql_app import crud, schemas
from sql_app.database import SessionLocal
def main():
    students_ref_without_amo = []
    students_ref_without_location = []
    unknown_payments = []

    res = {}
    db = SessionLocal()
    group_ids = list(set([grid[0] for grid in
                          crud.get_groupids_from_studentamoref_by_dates(db, library.report_start, library.report_end)]))
    db.close()
    for group in group_ids:
        db = SessionLocal()
        group_total = 0
        group_attended = 0
        group_url = f"https://lms.logikaschool.com/api/v1/group/{group}?expand=venue,teacher,curator,branch"
        resp = requests.get(group_url, headers=library.headers)
        if resp.status_code == 200:
            group_info = resp.json()
            try:
                location_name = group_info.get("data").get("venue").get("title")
            except AttributeError:
                print("AAAAAAAAAAAAAAAAAAAAAAAAAA", group)
                continue
                # TODO: add to issues as MK without location
            region = group_info.get("data").get("branch").get("title")
            try:
                course = group_info.get("data").get("course").get("name")
            except AttributeError:
                course = "unknown"
            else:
                course = library.get_business_by_group_course(course)

            if course == "unknown":
                print("COURSE FOR GROUP IS UNKNOWN!!!!")
                # TODO: add to issues

            students = crud.get_studentsamoref_by_group_id(db, group)
            for student in students:
                if not student.amo_id:
                    students_ref_without_amo.append(student)
                    # TODO: add to issues
                else:
                    group_total += 1
                    if student.attended == '1':
                        group_attended += 1
            print(f"Updating group {group} from {location_name} total: {group_total} attended: {group_attended}")

            update_total = crud.update_report_total(db=db, region=region, start_date=library.report_start,
                                                    end_date=library.report_end, total=group_total,
                                                    location=location_name, business=course)
            update_attended = crud.update_report_attended(db=db, region=region, start_date=library.report_start,
                                                          end_date=library.report_end, attended=group_attended,
                                                          location=location_name, business=course)
        db.close()

        res[group] = {}
        res[group]["attended_mc"] = group_attended
        res[group]["total"] = group_total

    db = SessionLocal()
    crud.update_conversions(db)
    db.close()
    print(res)
    print(students_ref_without_amo)

if __name__ == "__main__":
    main()