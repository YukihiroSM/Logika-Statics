import pandas as pd
import os

import requests

import library
from library import report_start, report_end, month
import sql_app.main as sq
from sql_app import crud, schemas
from sql_app.database import SessionLocal


def main():
    db = SessionLocal()
    payments = crud.get_payments_by_start_end(db, report_start, report_end)
    db.close()
    unknown_payments = []
    for payment in payments:
        student_id = payment.client_lms_id
        url = f"https://lms.logikaschool.com/api/v2/student/default/view/{student_id}?id={student_id}&expand=lastGroup%2Cwallet%2Cbranch%2ClastGroup.branch%2CamoLead%2Cgroups%2Cgroups.b2bPartners"
        resp = requests.get(url, headers=library.headers)
        if resp.status_code == 200:
            info_dict = resp.json()
            try:
                group_id = info_dict["data"]["lastGroup"]["id"]
            except (TypeError, KeyError):
                db = SessionLocal()
                issue = schemas.IssueCreate(
                    issue_type="payment_issue:student_has_no_groups",
                    report_start=library.report_start,
                    report_end=library.report_end,
                    issue_description=f"{student_id}",
                    issue_status="not_resolved",
                    issue_priority="medium",
                    issue_roles=""
                )
                crud.create_issue(db, issue)
                db.close()
                continue
            group_url = f"https://lms.logikaschool.com/api/v1/group/{group_id}?expand=venue,teacher,curator,branch"
            resp = requests.get(group_url, headers=library.headers)
            if resp.status_code == 200:
                group_info = resp.json()
                try:
                    location_name = group_info.get("data").get("venue").get("title")
                except AttributeError:
                    db = SessionLocal()
                    issue = schemas.IssueCreate(
                        issue_type="payment_issue:student_group_without_location",
                        report_start=library.report_start,
                        report_end=library.report_end,
                        issue_description=f"{student_id}",
                        issue_status="not_resolved",
                        issue_priority="medium",
                        issue_roles=""
                    )
                    crud.create_issue(db, issue)
                    db.close()
                    continue
                region = group_info.get("data").get("branch").get("title")
                try:
                    course = group_info.get("data").get("course").get("name")
                except AttributeError:
                    course = "unknown"
                else:
                    course = library.get_business_by_group_course(course)

                if course == "unknown":
                    course = payment.bussiness
                db = SessionLocal()
                add_payment = crud.update_report_payment(db=db, region=region, start_date=library.report_start,
                                                         end_date=library.report_end, payments=1,
                                                         location=location_name, business=course)
                db.close()
                if add_payment == None:
                    print("PAYMENT LOCATION IS NOT IN CURRENT LOCATIONS LIST!!! UPDATE LOCATIONS LIST!")
                    db = SessionLocal()
                    issue = schemas.IssueCreate(
                        issue_type="payment_issue:location_not_in_list",
                        report_start=library.report_start,
                        report_end=library.report_end,
                        issue_description=f"{group_id}",
                        issue_status="not_resolved",
                        issue_priority="medium",
                        issue_roles=""
                    )
                    crud.create_issue(db, issue)
                    db.close()
        else:
            db = SessionLocal()
            issue = schemas.IssueCreate(
                issue_type="payment_issue:student_not_found",
                report_start=library.report_start,
                report_end=library.report_end,
                issue_description=f"{student_id}",
                issue_status="not_resolved",
                issue_priority="medium",
                issue_roles=""
            )
            crud.create_issue(db, issue)
            db.close()



if __name__ == "__main__":
    main()






