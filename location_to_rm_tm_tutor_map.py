import pandas as pd
from sql_app.schemas import LocationCreate
from sql_app.database import SessionLocal
from sql_app.crud import create_location
df = pd.read_csv("location_tm_regional_tutor_mapping.csv", delimiter=",")

df.fillna('', inplace=True)
df.replace({'-': ''}, inplace=True)
for idx, row in df.iterrows():
    if row["ТМ"] == '':
        row["ТМ"] = f"ТМ ще не знайдено"
    if row["КМ"] == '':
        row["КМ"] = f"Невідомий КМ {row['Название локации в ЛМС']}"
    if row["ТЬЮТОР"] == '':
        row["ТЬЮТОР"] = f"Невідомий т'ютор {row['Название локации в ЛМС']}"
    ref = LocationCreate(
        lms_location_name=row["Название локации в ЛМС"].strip(),
        region=row["Офис в ЛМС"].strip(),
        territorial_manager=row["ТМ"].strip(),
        regional_manager=row["РЕГИОНАЛ"].strip(),
        tutor=row["ТЬЮТОР"].strip(),
        client_manager=row["КМ"].strip()
    )
    db = SessionLocal()
    create_location(db, ref)
    db.close()

