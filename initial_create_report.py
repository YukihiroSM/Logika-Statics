from sql_app import crud, schemas
import library
from sql_app.database import SessionLocal
from typing import List
def main():
    db = SessionLocal()
    locations: List[schemas.Location] = crud.get_locations(db)
    db.close()

    for location in locations:
        db = SessionLocal()
        crud.create_report(db, schemas.ReportCreate(
            location_name=location.lms_location_name,
            region=location.region,
            total=0,
            attended=0,
            payments=0,
            conversion=0,
            students_without_amo="",
            territorial_manager=location.territorial_manager,
            start_date=library.report_start,
            end_date=library.report_end,
            regional_manager=location.regional_manager,
            client_manager=location.client_manager,
            business="programming",
            tutor=location.tutor
        ))
        crud.create_report(db, schemas.ReportCreate(
            location_name=location.lms_location_name,
            region=location.region,
            total=0,
            attended=0,
            payments=0,
            conversion=0,
            students_without_amo="",
            territorial_manager=location.territorial_manager,
            start_date=library.report_start,
            end_date=library.report_end,
            regional_manager=location.regional_manager,
            client_manager=location.client_manager,
            business="english",
            tutor=location.tutor
        ))
        db.close()


if __name__ == "__main__":
    main()