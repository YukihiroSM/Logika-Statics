import pandas as pd
from sql_app.schemas import LocationCreate
from sql_app.database import SessionLocal
from sql_app.crud import create_location
from pathlib import Path
import os
BASE_DIR = os.path.dirname(__file__)
groups_file_path = Path(BASE_DIR, "location_tm_regional_tutor_mapping.csv")
df = pd.read_csv(groups_file_path, delimiter=",", encoding="UTF-8")

df.fillna('', inplace=True)
df.replace({'-': ''}, inplace=True)
for idx, row in df.iterrows():
    if row["ТМ"] == '':
        row["ТМ"] = f"ТМ ще не знайдено"
    if row["КМ"] == '':
        row["КМ"] = f"Невідомий КМ {row['Название локации в ЛМС']}"
    if row["ТЬЮТОР программирования"] == '':
        row["ТЬЮТОР программирования"] = f"Невідомий т'ютор {row['Название локации в ЛМС']}"
    ref = LocationCreate(
        lms_location_name=row["Название локации в ЛМС"].strip(),
        region=row["Офис в ЛМС"].strip(),
        territorial_manager=row["ТМ"].strip(),
        regional_manager=row["РЕГИОНАЛ"].strip(),
        tutor=row["ТЬЮТОР программирования"].strip(),
        client_manager=row["КМ"].strip()
    )
    db = SessionLocal()
    create_location(db, ref)
    db.close()

