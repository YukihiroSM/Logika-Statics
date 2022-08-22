import pandas as pd
import datetime
import library
import os
from library import report_start, report_end, month, download_path, headers
from parser import parse_groups
import sql_app.main as sq
from sql_app import crud, schemas
from sql_app.database import SessionLocal
import requests
from concurrent.futures import ThreadPoolExecutor


def get_student_amo_id(student_id):
    url = f"https://lms.logikaschool.com/api/v2/student/default/view/{student_id}?id={student_id}&expand=lastGroup%2Cwallet%2Cbranch%2ClastGroup.branch%2CamoLead%2Cgroups%2Cgroups.b2bPartners"
    resp = requests.get(url, headers=headers)
    if resp.status_code == 200:
        info_dict = resp.json()
    else:
        raise Exception(f"Status of request for student: {student_id}: response code is {resp.status_code}")
    if info_dict["status"] == "success":
        amo_lead = info_dict.get("data").get("amoLead", None)
        if not amo_lead:
            amo_id = ""
        else:
            amo_id = info_dict.get("data").get("amoLead").get("id")
        return amo_id
    else:
        raise Exception(f"Status of request for student: {student_id} is unsuccessfully got")


def get_group_attendance(group_id):
    url = f'https://lms.logikaschool.com/api/v1/stats/default/attendance?group={group_id}'
    resp = requests.get(url, headers=headers)
    data_dict = resp.json()
    return data_dict["data"]


def parse_students_in_group(group_ids):
    for id in group_ids:
        print(f"parsing group {id} ({group_ids.index(id)}/{len(group_ids)})")
        attendance = get_group_attendance(id)
        for student in attendance:
            lms_id = student["student_id"]
            amo_id = get_student_amo_id(lms_id)
            if student["attendance"][0]["status"] == "present":
                attended = "1"
            else:
                attended = "0"
            parsing_results.append({
                "group_id": id,
                "amo_id": amo_id,
                "lms_id": lms_id,
                "attended_mc": attended})
            db = SessionLocal()
            ref = schemas.StudentAMORefCreate(
                lms_id=lms_id,
                amo_id=amo_id,
                group_id=id,
                attended=attended,
                report_start=library.report_start,
                report_end=library.report_end
            )
            crud.create_student_amo_ref(db, ref)
            db.close()



parsing_results = []


def parse_students_in_groups_threads(group_ids):
    global parsing_results
    num_of_threads = 5
    if num_of_threads == 0:
        num_of_threads = 1
    separator = len(group_ids) // num_of_threads
    args = []
    for i in range(0, num_of_threads):
        if i == num_of_threads - 1:
            arg = group_ids[i * separator:]
        else:
            arg = group_ids[i * separator:(i + 1) * separator]
        args.append(arg)
    with ThreadPoolExecutor(max_workers=num_of_threads) as executor:
        executor.map(parse_students_in_group, args)

    students = parsing_results[::]
    parsing_results = []
    return students


def main():
    os.makedirs(download_path, exist_ok=True)
    print("Getting groups from lms")
    parse_groups()
    print("Got groups, clearing the dataframe")
    df = pd.DataFrame()
    for fname in os.listdir(download_path):
        if fname.startswith("Расписание"):
            df = pd.read_csv(f'{download_path}/{fname}', delimiter=";")
            break

    pd.options.display.max_rows = 9999
    pd.options.display.max_columns = 9999
    if not df.empty:
        df = df.where(pd.notnull(df), None)
        df = df[["ID группы", "Название группы", "Площадка", "Преподаватель", "Куратор", "Курс"]]

        for idx, row in df.iterrows():
            # df.at[idx, "Площадка"] = row["Площадка"].lower().replace(" ", "_").replace("-", "_").replace(",", "")
            for key in library.COURSES["programming"]:
                if row["Курс"].lower().replace(" ", "_").replace("-", "_").replace('"', "'") in \
                        library.COURSES["programming"][key]:
                    df.at[idx, "Курс"] = key

            if row["Курс"].lower().replace(" ", "_").replace("-", "_").replace('"', "'") in \
                    library.COURSES["english"]:
                df.at[idx, "Курс"] = "english"

        df.rename(columns={
            'ID группы': 'lms_group_id',
            'Название группы': 'lms_group_name',
            'Площадка': 'lms_group_location',
            'Преподаватель': 'lms_group_teacher',
            'Куратор': 'lms_group_manager',
            'Курс': 'lms_group_course'
        }, inplace=True)

        with open(
                f'lms_reports/{month}/{report_start}_{report_end}/cleaned_groups_report.csv',
                "w") as file:
            df.to_csv(file, index=False)
            print("result file ready")

    sq.groups_report_to_db()
    group_ids = [group[0] for group in sq.get_groups()]
    start = datetime.datetime.now()
    students = parse_students_in_groups_threads(group_ids)

    end = datetime.datetime.now()
    print(f"Time for {len(group_ids)} groups and {len(students)} students: {end - start}")

if __name__ == "__main__":
    main()
