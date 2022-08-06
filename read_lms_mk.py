import pandas as pd
import datetime
import library
import os
from library import region, report_start, report_end, month, download_path
from parser import parse_groups, parse_students_in_group_threads
import sql_app.main as sq
from sql_app import crud, schemas
from sql_app.database import SessionLocal


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
                if row["Курс"].lower().replace(" ", "_").replace("-", "_").replace('"', "'") in library.COURSES["programming"][key]:
                    df.at[idx, "Курс"] = key

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
    students = parse_students_in_group_threads(group_ids)
    end = datetime.datetime.now()
    print(f"Time for {len(group_ids)} groups and {len(students)} students: {end - start}")

    for student in students:
        db = SessionLocal()
        amo_id = student["amo_id"]
        if not amo_id:
            amo_id = ""
        ref = schemas.StudentAMORefCreate(
            lms_id=student["lms_id"],
            amo_id=amo_id,
            group_id=student["group_id"],
            attended="1" if student["attended_mc"] else "0"
        )
        crud.create_student_amo_ref(db, ref)
        db.close()


if __name__ == "__main__":
    main()
