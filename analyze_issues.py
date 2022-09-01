from sql_app.database import SessionLocal
from sql_app import crud, models, schemas
from typing import List
import library
import requests


def process_group_issues(group_issues):
    # group_issue:unknown_course_in_mk
    # group_issue:unknown_location
    processed_group_ids = {
        "unknown_location": [],
        "unknown_course_in_mk": [],
        "location_not_in_list": []
    }
    processed_location_names = {}
    for issue in group_issues:
        print(f"Working on issue {issue}, {group_issues[issue]}")
        db = SessionLocal()
        crud.set_issue_header(db, issue, "")
        crud.set_issue_data(db, issue, "")
        crud.set_issue_roles(db, issue, "")
        if group_issues[issue]["type"] == "unknown_location":

            group_id = group_issues[issue]["issue_description"][0].split(":")[1]
            if group_id in processed_group_ids[group_issues[issue]["type"]]:
                crud.delete_issue_by_id(db, issue)
                continue
            crud.update_issue_header(db, issue, "Не вдалось знайти локацію в групі БО+++")
            url = f'https://lms.logikaschool.com/api/v1/group/{group_id}?expand=venue,teacher,curator,branch'
            resp = requests.get(url, headers=library.headers)
            data_dict = resp.json()
            group_name = data_dict.get("data").get("title")
            try:
                client_manager = data_dict.get("data").get("curator").get("name")
            except:
                client_manager = None
            if client_manager:
                tm = crud.get_tm_by_client_manager(db, client_manager)
                if not tm:
                    client_manager = " ".join(client_manager.split(" ")[::-1])
                    tm = crud.get_tm_by_client_manager(db, client_manager)
                if tm:
                    crud.update_issue_roles(db, issue, f"admin;")
                else:
                    crud.update_issue_roles(db, issue, "admin;")
                    crud.update_issue_data(db, issue, f"КМ: {client_manager}+++")
                    crud.update_issue_header(db, issue, "Знайдено КМ але не визначено ТМ+++")
            else:
                crud.update_issue_roles(db, issue, "admin;")
            crud.update_issue_data(db, issue, f"Назва групи: {group_name}+++ID Групи в БО: {group_id}")
        if group_issues[issue]["type"] == "unknown_course_in_mk":
            group_id = group_issues[issue]["issue_description"][0].split(":")[1]
            if group_id in processed_group_ids[group_issues[issue]["type"]]:
                crud.delete_issue_by_id(db, issue)
                continue
            crud.update_issue_header(db, issue, "Не вдалось визначити курс в групі БО+++")
            url = f'https://lms.logikaschool.com/api/v1/group/{group_id}?expand=venue,teacher,curator,branch'
            resp = requests.get(url, headers=library.headers)
            data_dict = resp.json()
            group_name = data_dict.get("data").get("title")
            try:
                client_manager = data_dict.get("data").get("curator").get("name")
            except:
                client_manager = None
            if client_manager:
                tm = crud.get_tm_by_client_manager(db, client_manager)
                if not tm:
                    client_manager = " ".join(client_manager.split(" ")[::-1])
                    tm = crud.get_tm_by_client_manager(db, client_manager)
                if tm:
                    crud.update_issue_roles(db, issue, f"admin;")
                else:
                    crud.update_issue_roles(db, issue, "admin;")
                    crud.update_issue_data(db, issue, f"КМ: {client_manager}+++")
                    crud.update_issue_header(db, issue, "Знайдено КМ але не визначено ТМ+++")
            else:
                crud.update_issue_roles(db, issue, "admin;")
            crud.update_issue_data(db, issue, f"Назва групи: {group_name}+++ID Групи в БО: {group_id}")

        if group_issues[issue]["type"] == "location_not_in_list":
            group_id = group_issues[issue]["issue_description"][0].split(":")[1]
            if group_id in processed_group_ids[group_issues[issue]["type"]]:
                crud.delete_issue_by_id(db, issue)
                continue

            crud.update_issue_header(db, issue, "Вказана локація не знайдена в загальному списку+++")
            url = f'https://lms.logikaschool.com/api/v1/group/{group_id}?expand=venue,teacher,curator,branch'
            resp = requests.get(url, headers=library.headers)
            data_dict = resp.json()
            location_name = data_dict.get("data").get("venue").get("title")
            if location_name in processed_location_names:
                crud.delete_issue_by_id(db, issue)
                continue
            else:
                processed_location_names[location_name] = {
                    "total": 0,
                    "attended": 0}
            try:
                client_manager = data_dict.get("data").get("curator").get("name")
            except:
                client_manager = None

            crud.update_issue_roles(db, issue, "admin;")
            if client_manager:
                tm = crud.get_tm_by_client_manager(db, client_manager)
                if not tm:
                    client_manager = " ".join(client_manager.split(" ")[::-1])
                    tm = crud.get_tm_by_client_manager(db, client_manager)
                if tm:
                    crud.update_issue_data(db, issue, f"КМ: {client_manager}+++ТМ: {tm[0]}+++")
                    crud.update_issue_header(db, issue, "Знайдено КМ та визначено ТМ+++")
                else:
                    crud.update_issue_data(db, issue, f"КМ: {client_manager}+++")
                    crud.update_issue_header(db, issue, "Знайдено КМ але не визначено ТМ+++")
            processed_location_names[location_name]["total"] += int(group_issues[issue]["issue_description"][2].split(":")[1])
            processed_location_names[location_name]["attended"] += int(group_issues[issue]["issue_description"][3].split(":")[1])
            crud.update_issue_data(db, issue, f"Назва локації: {location_name}+++Всього Записано: {processed_location_names[location_name]['total']}+++Всього Відвідали: {processed_location_names[location_name]['attended']}")
        processed_group_ids[group_issues[issue]["type"]].append(group_id)
        db.close()

def process_payment_issues(payment_issues):
    pass


def process_student_issues(student_issues):
    for issue in student_issues:
        print(f"Working on issue {issue}, {student_issues[issue]}")
        db = SessionLocal()
        if student_issues[issue]["type"] == "no_amo_id":
            crud.set_issue_header(db, issue, "")
            crud.set_issue_data(db, issue, "")
            crud.set_issue_roles(db, issue, "")

            student_id = student_issues[issue]["issue_description"][0].split(":")[1]
            group_id = student_issues[issue]["issue_description"][2].split(":")[1]
            crud.update_issue_header(db, issue, "Учень без АМО+++")

            crud.update_issue_data(db, issue, f"ID Учня: {student_id}+++")
            crud.update_issue_data(db, issue, f"ID Групи: {group_id}+++")
            attendance = student_issues[issue]["issue_description"][1].split(":")[1]
            if attendance == "0":
                crud.update_issue_data(db, issue, f"Відсутній на уроці+++")
            elif attendance == "1":
                crud.update_issue_data(db, issue, f"Присутній на уроці+++")
            if group_id is not None:
                group_url = f"https://lms.logikaschool.com/api/v1/group/{group_id}?expand=venue,teacher,curator,branch"
                resp = requests.get(group_url, headers=library.headers)
                if resp.status_code == 200:
                    group_info = resp.json()
                    try:
                        location_name = group_info.get("data").get("venue").get("title")
                        crud.update_issue_data(db, issue, f"Локація: {location_name}+++")
                        tm = crud.get_tm_by_location(db, location_name)
                        if tm:
                            tm = tm[0]
                            crud.update_issue_header(db, issue, "Знайдено ТМ+++")
                            crud.update_issue_roles(db, issue, f"admin;")
                        if not tm:
                            crud.update_issue_header(db, issue, "Не знайдено ТМ+++")
                            crud.update_issue_roles(db, issue, "admin;")
                        try:
                            client_manager = group_info.get("data").get("curator").get("name")
                        except:
                            client_manager = None

                        if client_manager:
                            crud.update_issue_data(db, issue, f"КМ: {client_manager}+++")
                            crud.update_issue_header(db, issue, "Знайдено КМ+++")
                        else:
                            crud.update_issue_header(db, issue, "Не знайдено КМ+++")
                            crud.update_issue_roles(db, issue, "admin;")

                    except AttributeError:
                        crud.update_issue_data(db, issue, f"Локацію не знайдено+++")
                        crud.update_issue_roles(db, issue, "admin;")


            db.close()


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
                "issue_description": issue.issue_description.split("+++"),
                "issue_roles": issue.issue_roles
            }
        }
    else:
        issues_dict[general_type][issue.id] = {
            "type": secondary_type,
            "issue_description": issue.issue_description.split("+++"),
            "issue_roles": issue.issue_roles
        }


for general in issues_dict:
    if general == "group_issue":
        process_group_issues(issues_dict[general])
        pass
    elif general == "payment_issue":
        process_payment_issues(issues_dict[general])
    elif general == "student_issue":
        process_student_issues(issues_dict[general])