import pandas as pd
from sql_app.schemas import LocationCreate
from sql_app.database import SessionLocal
from sql_app.crud import create_location
df = pd.read_csv("location_tm_regional_tutor_mapping.csv", delimiter=",")
# lms_location_name: str
#     region: str
#     territorial_manager: str
#     regional_manager: str
#     tutor: str
df.fillna('', inplace=True)
df.replace({'-': ''}, inplace=True)
for idx, row in df.iterrows():
    ref = LocationCreate(
        lms_location_name=row["Название локации в ЛМС"],
        region=row["Офис в ЛМС"],
        territorial_manager=row["ТМ"],
        regional_manager=row["РЕГИОНАЛ"],
        tutor=row["ТЬЮТОР"]
    )
    db = SessionLocal()
    create_location(db, ref)
    db.close()

