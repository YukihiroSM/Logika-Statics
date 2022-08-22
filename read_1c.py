import csv

import openpyxl
from pathlib import Path
import pandas as pd
from sql_app import main as sq, schemas, crud
from library import month, report_start, report_end
import os
from parser import download_1c_report
from sql_app.database import SessionLocal
def main():
    download_1c_report()
    xlsx_file = Path(f'1c_reports/{month}/{report_start}_{report_end}/payments_report.xlsx')
    wb_obj = openpyxl.load_workbook(xlsx_file)

    # Read the active sheet:
    sheet = wb_obj.active
    headers = [cell.value for cell in sheet[5]]
    data = []
    for i, row in enumerate(sheet.iter_rows(values_only=True)):
        if i < 5 or type(row[0]) != int:
            continue
        one_row = {}
        for j in range(len(headers)):
            if headers[j] is None:
                continue
            one_row[headers[j]] = row[j]
        data.append(one_row)

    df = pd.DataFrame(data)
    df = df.drop(["№", "Месяц", "Дата", "Регион", "Город", "Группа обучения",
                  "Возраст", "Имя родителя", "Телефон", "Оплата",
                  "Оплачено уроков", "Остаток занятий", "Первый платеж", "Счет/касса", "Организация"], axis=1)
    df.rename(columns={
        "Куратор": "group_manager",
        "Клиент": "client_name",
        "Клиент.ID из БО": "client_lms_id",
        "Локация": "group_location",
        "Курс": "course",
        "Направление бизнеса": "bussiness"
    }, inplace=True)

    with open(
            f'1c_reports/{month}/{report_start}_{report_end}/cleaned_payments_report.csv',
            "w") as file:
        df.to_csv(file, index=False)

    csv_path = f'1c_reports/{month}/{report_start}_{report_end}/cleaned_payments_report.csv'
    if not os.path.exists(csv_path):
        print("No file created for payments!!")

    with open(csv_path) as f:
        payments = [{k: v for k, v in row.items()} for row in csv.DictReader(f, skipinitialspace=True)]
        for paym in payments:
            db = SessionLocal()
            payment = schemas.PaymentCreate(
                group_manager=paym["group_manager"],
                client_name=paym["client_name"],
                client_lms_id=paym["client_lms_id"],
                group_course=paym["course"],
                bussiness=paym["bussiness"],
                report_date_start=report_start,
                report_date_end=report_end
            )
            crud.create_payment(db=db, paym=payment)
            db.close()

