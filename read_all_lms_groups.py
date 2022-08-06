import glob
import os
import pandas as pd
import library
from sql_app.database import SessionLocal
from sql_app import crud, schemas


def main():
    list_of_files = glob.glob(f'lms_reports/{library.month}/Группы*.csv')
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
