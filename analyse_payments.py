import pandas as pd
import os

import library
from library import report_start, report_end, month
import sql_app.main as sq
from sql_app import crud, schemas
from sql_app.database import SessionLocal

def main():
    db = SessionLocal()
    payments = crud.get_payments(db)

    payment_results = {}
    payment_results["unknown_payments"] = []
    for paym in payments:
        location = crud.get_student_location_by_lms_id(db, paym.client_lms_id)
        office = crud.get_student_office_by_lms_id(db, paym.client_lms_id)
        if location and location[0] != "" and location[0] != "nan" and not(location[0] is None):
            location = f'{location[0]}***{office[0]}'
        else:
            payment_results["unknown_payments"].append((paym.client_lms_id, paym.client_name, paym.group_manager))
            continue

        if location in payment_results:
            payment_results[location] += 1
        else:
            payment_results[location] = 1
    db.close()
    offices = {
        "UA_Kievskaya oblast": "ТМ Киевская Область",
        "UA_Kiev": "Щербатюк Артем",
        "UA_Odessa": "ТМ Одесса",
        "UA_Kharkov": "ТМ Харьков",
        "UA_Dnepr": "ТМ Днепропетровск",
        "UA_Odesskaya oblast": "ТМ Одесская Область",
        "UA_Vynnytsya": "ТМ Винница",
        "UA_Dnepropetrovskaya oblast": "ТМ Днепропетровская Область",
        "UA_Chernivtsi": "ТМ Черновцы",
        "UA_Lviv": "ТМ Львов",
        "UA_ChernivtsiOblast": "ТМ Черновцы Область",
        "UA_LvivOblast": "ТМ Львовская Область",
        "UA_VynnytsyaOblast": "ТМ Винницкая Область",
        "UA_Dnepr_region": "ТМ Днепропетровский Регион",
        "UA_Poltava": "ТМ Полтава",
        "UA_Chernigov_obl": "ТМ Черниговская Область",
        "UA_Donetskobl": "ТМ Донецкая Область",
        "UA_Center": "ТМ Центр",
        "UA_Nikolaevskaya_obl": "ТМ Николаевская Область"}
    for terr_manager in offices.values():
        db = SessionLocal()
        tm_locations = [f"{loc[0]}***{loc[1]}" for loc in crud.get_locations_by_tm(db, terr_manager) if loc]
        db.close()
        for k in payment_results:
            if k == "unknown_payments":
                continue
            if k in tm_locations:
                db = SessionLocal()
                crud.create_report(db, schemas.ReportCreate(
                    location_name=k.split("***")[0],
                    region=k.split("***")[1],
                    total=0,
                    attended=0,
                    payments=payment_results[k],
                    conversion=0,
                    students_without_amo="",
                    territorial_manager=terr_manager,
                    start_date=library.report_start,
                    end_date=library.report_end
                ))
                db.close()

    return payment_results


if __name__ == "__main__":
    main()






