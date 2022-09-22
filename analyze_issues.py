from sql_app.database import SessionLocal
from sql_app import crud, models, schemas
from typing import List
import library
import requests


def process_student_issues(student_issues):
    for issue in student_issues:
        print(f"Working on issue {issue}, {student_issues[issue]}")
        db = SessionLocal()
        if student_issues[issue]["type"] == "no_amo_id":
            crud.set_issue_header(db, issue, "")
            crud.set_issue_data(db, issue, "")
            crud.set_issue_roles(db, issue, "")

            student_id = student_issues[issue]["issue_description"][0]
            group_id = student_issues[issue]["issue_description"][1]
            crud.update_issue_header(db, issue, "Учень без АМО+++")
            client_manager = None
            territorial_manager = None
            # regional_manager = None
            location = None
            crud.update_issue_data(db, issue, f'Учень в ЛМС{student_id}+++')
            crud.update_issue_data(db, issue, f'Група в ЛМС: {group_id}+++')
            # attendance = student_issues[issue]["issue_description"][1].split(":")[1]
            # if attendance == "0":
            #     crud.update_issue_data(db, issue, f"Відсутній на уроці+++")
            # elif attendance == "1":
            #     crud.update_issue_data(db, issue, f"Присутній на уроці+++")
            if group_id is not None:
                group_url = f"https://lms.logikaschool.com/api/v1/group/{group_id}?expand=venue,teacher,curator,branch"
                resp = requests.get(group_url, headers=library.headers)
                if resp.status_code == 200:
                    group_info = resp.json()["data"]
                    try:
                        location_name = group_info.get("venue").get("title")
                    except AttributeError:
                        location = "Не знайдено в групі студента."
                        location_name = None

                    if location_name:
                        loc_obj: models.Location = crud.get_location_by_name(db, location_name)
                        if not loc_obj:
                            location = f"{location_name} - Не знайдено локацію в списку локацій."
                            try:
                                client_manager = group_info.get("curator").get("name")
                            except AttributeError:
                                client_manager = None
                            if client_manager:
                                tm = crud.get_tm_by_client_manager(db, client_manager)
                                if not tm:
                                    client_manager = " ".join(client_manager.split(" ")[::-1])
                                    tm = crud.get_tm_by_client_manager(db, client_manager)
                                if tm:
                                    territorial_manager = tm[0]
                        else:
                            territorial_manager = loc_obj.territorial_manager
                            client_manager = loc_obj.client_manager
                            # regional_manager = loc_obj.regional_manager
                            location = location_name
            crud.update_issue_data(db, issue, f"TM: {territorial_manager}+++")
            crud.update_issue_data(db, issue, f"KM: {client_manager}+++")
            crud.update_issue_data(db, issue, f"Локація: {location}+++")
            if territorial_manager:
                crud.update_issue_roles(db, issue, f"territorial_manager:{territorial_manager};")
            else:
                crud.update_issue_roles(db, issue, "admin;")

            db.close()

# def process_unknown_location(unknown_locations):



db = SessionLocal()
issues: List[models.Issue] = crud.get_issues_by_date(db, library.report_start, library.report_end)
db.close()

issues_dict = {}
for issue in issues:
    general_type, secondary_type = issue.issue_type.split(":")
    if general_type not in issues_dict:
        issues_dict[general_type] = {
            issue.id: {
                "type": secondary_type,
                "issue_description": issue.issue_description.split(";"),
                "issue_roles": issue.issue_roles
            }
        }
    else:
        issues_dict[general_type][issue.id] = {
            "type": secondary_type,
            "issue_description": issue.issue_description.split(";"),
            "issue_roles": issue.issue_roles
        }

for general in issues_dict:
    if general == "student_issue":
        process_student_issues(issues_dict[general])
