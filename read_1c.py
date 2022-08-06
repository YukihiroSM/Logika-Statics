import openpyxl
from pathlib import Path
import pandas as pd
import library
from sql_app import main as sq
from library import region, month, report_start, report_end
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
sq.payments_report_to_db()





