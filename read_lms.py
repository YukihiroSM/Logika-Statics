import pandas as pd
import library
import utils
import datetime

REGION = "online_region"
MONTH = "june"
REPORT_SCALE = "month"
REPORT_TYPE = "mc"
REPORT_START = datetime.date(2022, 6, 1)
REPORT_END = datetime.date(2022, 6, 30)

useful_columns_headers = ["ID", "Имя", "Имя родителя", "Тел. родителя", "ID группы", "Группа",
                          "Преподаватель", "Куратор", "Старт группы", " Посетил уроков"]

df = pd.read_csv(f'{library.REGIONS[REGION]["lms_reports"]}/{MONTH}/{REPORT_TYPE}_{REPORT_SCALE}_report.csv', delimiter=";")

pd.options.display.max_rows = 9999
pd.options.display.max_columns = 9999
df = (df[useful_columns_headers])
df = df.where(pd.notnull(df), None)
indexes_to_delete = []
for idx, row in df.iterrows():
    if datetime.datetime.strptime(str(row['Старт группы']), "%d.%m.%Y").date() < REPORT_START:
        indexes_to_delete.append(idx)

for idx, row in df.iterrows():
    if str(row[' Посетил уроков']) == "1":
        df.at[idx, "attended_mc"] = True
    else:
        df.at[idx, "attended_mc"] = False

df.drop(indexes_to_delete, axis=0, inplace=True)
df = utils.clean_numbers(df, "phone_number", ["Тел. родителя"])
df = df.drop(["Тел. родителя", ' Посетил уроков', 'Старт группы'], axis=1)
df.rename(columns={
    'ID': 'lms_id',
    'Имя': 'lms_student_name',
    'Имя родителя': 'lms_parent_name',
    "ID группы": "lms_group_id",
    "Группа": "lms_group_name",
    "Преподаватель": "lms_teacher",
    "Куратор": "lms_curator"
}, inplace=True)

with open(
        f'{library.REGIONS[REGION]["lms_reports"]}/{MONTH}/cleaned_{REPORT_TYPE}_{REPORT_SCALE}_{REPORT_START}_{REPORT_END}_report.csv',
        "w") as file:
    df.to_csv(file, index=False)


df = pd.read_csv(f'{library.REGIONS[REGION]["lms_reports"]}/leads_report.csv', delimiter=";")
df = (df[["Имя ученика", "ID сделки AmoCRM"]])
df.rename(columns={
    'Имя ученика': 'lms_student_name',
    'ID сделки AmoCRM': 'amo_id'
}, inplace=True)
with open(
        f'{library.REGIONS[REGION]["lms_reports"]}/{MONTH}/cleaned_leads_{REPORT_SCALE}_{REPORT_START}_{REPORT_END}_report.csv',
        "w") as file:
    df.to_csv(file, index=False)
