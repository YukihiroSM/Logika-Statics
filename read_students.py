import glob
import os
import library
import pandas as pd
from sql_app.database import SessionLocal
from sql_app import crud, schemas


def main():
    list_of_files = glob.glob(f'lms_reports/{library.month}/Ученики*.csv')
    latest_file = max(list_of_files, key=os.path.getctime)

    df = pd.read_csv(latest_file, delimiter=";")
    df.rename(columns={
        "ID": "id",
        "Имя": "student_name",
        "ID группы": "group_id",
        "Офис": "office"
    }, inplace=True)
    df = df.astype(str)
    df = df.where(pd.notnull(df), None)

    for idx, row in df.iterrows():
        lms_id = str(row["id"])
        group_id = str(row["group_id"]).replace('.0', '')
        db = SessionLocal()
        location = crud.get_globalgroup_location_by_id(db, group_id)
        if not location or location[0] == "nan":
            location = ""
        else:
            location = location[0]

        student = schemas.StudentCreate(
            lms_id=str(row["id"]),
            student_name=str(row["student_name"]),
            group_id=str(row["group_id"]),
            group_location=location,
            region=str(row["office"])
        )
        crud.create_student(db, student)
        db.close()
        if idx % 1000 == 0:
            print(f"Processed {idx}/{len(df)}")

    # for idx, row in df.iterrows():
    #     id = str(row["id"])
    #     group_id = str(row["group_id"])


if __name__ == "__main__":
    main()