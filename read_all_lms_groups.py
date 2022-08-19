import glob
import os
import pandas as pd
import library
from sql_app.database import SessionLocal
from sql_app import crud, schemas
import requests


def main():
    url = "https://lms.logikaschool.com/group?GroupSearch%5Bid%5D=&GroupSearch%5Btitle%5D=&GroupSearch%5Bvenue%5D=&GroupSearch%5Bactive_student_count%5D=&GroupSearch%5BnextLessonTime%5D=&GroupSearch%5BnextLessonNumber%5D=&GroupSearch%5BnextLessonTitle%5D=&GroupSearch%5Bteacher%5D=&GroupSearch%5Bcurator%5D=&GroupSearch%5Btype%5D=&GroupSearch%5Btype%5D%5B%5D=regular&GroupSearch%5Btype%5D%5B%5D=masterclass&GroupSearch%5Bstatus%5D=&GroupSearch%5Bis_online%5D=&GroupSearch%5Bcreated_at%5D%5Bop%5D=gt&GroupSearch%5Bcreated_at%5D%5Bdate%5D=&GroupSearch%5Bbranch%5D=&export=true&name=default&exportType=csv"
    headers = library.headers
    print("Starting downloading groups_total_report")
    data = requests.get(url, headers=headers)
    with open(f"lms_reports/{library.month}/Группы_{library.report_start}_{library.report_end}.csv", "wb") as csv_file_obj:
        csv_file_obj.write(data.content)

    list_of_files = glob.glob(f'lms_reports/{library.month}/Группы_{library.report_start}_{library.report_end}.csv')
    latest_file = max(list_of_files, key=os.path.getctime)
    df = pd.read_csv(latest_file, delimiter=";")
    #"ID";"Название";"Площадка";"Преподаватель";"Куратор", "Офис"
    for idx, row in df.iterrows():
        group = schemas.GlobalGroupCreate(
            group_id=str(row["ID"]),
            group_name=str(row["Название"]),
            group_location=str(row["Площадка"]),
            group_teacher=str(row["Преподаватель"]),
            group_manager=str(row["Куратор"]),
            group_region=str(row["Офис"]),
        )
        db = SessionLocal()
        crud.create_globalgroup(db, group)
        db.close()


if __name__ == "__main__":
    main()
