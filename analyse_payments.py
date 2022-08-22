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
            group_id = info_dict["data"]["lastGroup"]["id"]
            group_url = f"https://lms.logikaschool.com/api/v1/group/{group_id}?expand=venue,teacher,curator,branch"
            resp = requests.get(group_url, headers=library.headers)
            if resp.status_code == 200:
                group_info = resp.json()
                try:
                    location_name = group_info.get("data").get("venue").get("title")
                except AttributeError:
                    print("AAAAAAAAAAAAAAAAAAAAAAAAAA", group_id)
                    continue
                    # TODO: add to issues as GROUP without location
                region = group_info.get("data").get("branch").get("title")
                try:
                    course = group_info.get("data").get("course").get("name")
                except AttributeError:
                    course = "programming"
                else:
                    course = library.get_business_by_group_course(course)

                if course == "unknown":
                    print("COURSE FOR PAYMENT IS UNKNOWN!!!!")
                    # TODO: add to issues
                db = SessionLocal()
                add_payment = crud.update_report_payment(db=db, region=region, start_date=library.report_start,
                                                         end_date=library.report_end, payments=1,
                                                         location=location_name, business=course)
                db.close()
                if add_payment == None:
                    print("PAYMENT LOCATION IS NOT IN CURRENT LOCATIONS LIST!!! UPDATE LOCATIONS LIST!")
                    print(location_name, student_id, group_id, course)
                    # TODO: Add to issues!

        else:
            if resp.status_code == 400:
                print(f"Adding student {student_id} to unknown payments!")
                # TODO: Add to issues!
                unknown_payments.append(student_id)
            else:
                raise Exception(f"Status of request for student: {student_id}: response code is {resp.status_code}")




if __name__ == "__main__":
    main()






