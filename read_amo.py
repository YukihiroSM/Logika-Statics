import pandas as pd
import library
import utils
import datetime

REGION = "online_region"
MONTH = "june"
REPORT_SCALE = "month"
REPORT_START = datetime.date(2022, 6, 1)
REPORT_END = datetime.date(2022, 6, 30)

useful_columns_headers = ["ID", "Дата создания сделки", "Воронка", "Полное имя контакта", "Рабочий телефон",
                          "Рабочий прямой телефон", "Мобильный телефон", "Домашний телефон", "Другой телефон",
                          "Ребенок [ФИО]", "Ребенок [Возраст]", "Город", "Регион", "NAME", "ВОЗРАСТ_РЕБЕНКА", "МІСТО",
                          "Запись на МК (для смс)", "Записался на МК?", "Подтвердил запись на курс?", "Пришел на МК?",
                          "Адрес локации (для смс)", "Дата МК (заполняет КМ)", "Преподаватель",
                          "Локация"]

df = pd.read_csv(f'{library.REGIONS[REGION]["amo_reports"]}/{MONTH}/{REPORT_SCALE}_report.csv')

pd.options.display.max_rows = 9999
pd.options.display.max_columns = 9999
df = (df[useful_columns_headers])
df = df.where(pd.notnull(df), None)

# collect numbers in all possible fields -> format them -> write into "phone_number"
numbers_columns = ["Рабочий телефон", "Рабочий прямой телефон", "Мобильный телефон", "Домашний телефон",
                   "Другой телефон"]
df = utils.clean_numbers(df, "amo_phone_number", numbers_columns)
df = utils.clean_same_columns_values(df, "Ребенок [Возраст]", "ВОЗРАСТ_РЕБЕНКА", "amo_age")
df = utils.clean_same_columns_values(df, "Ребенок [ФИО]", "NAME", "amo_student_name")
df = utils.clean_same_columns_values(df, "Город", "МІСТО", "amo_city")
for idx, row in df.iterrows():
    amo_region = row["Регион"]
    unified_region = utils.get_region(amo_region)
    df.at[idx, "amo_region"] = unified_region

    if row["Записался на МК?"] == "Да":
        df.at[idx, "amo_signed_to_mc"] = True
    else:
        df.at[idx, "amo_signed_to_mc"] = False

    if row["Подтвердил запись на курс?"] == "Да":
        df.at[idx, "amo_signed_to_course"] = True
    else:
        df.at[idx, "amo_signed_to_course"] = False

    if row["Пришел на МК?"] == "Да":
        df.at[idx, "amo_attended_mc"] = True
    else:
        df.at[idx, "amo_attended_mc"] = False

df = df.drop(["Ребенок [Возраст]", "ВОЗРАСТ_РЕБЕНКА", "Ребенок [ФИО]", "NAME", "Рабочий телефон", "Мобильный телефон",
              "Рабочий прямой телефон", "Домашний телефон", "Другой телефон", "Записался на МК?",
              "Подтвердил запись на курс?", "Пришел на МК?", "Город", "МІСТО", "Регион"], axis=1)

df.rename(columns={
    'ID': 'amo_id',
    'Дата создания сделки': 'amo_creation_date',
    'Воронка': 'pipeline',
    "Полное имя контакта": "amo_parent_name",
    "Запись на МК (для смс)": "amo_mc_date_time_sms",
    "Адрес локации (для смс)": "amolocation_address_sms",
    "Дата МК (заполняет КМ)": "amo_mc_date",
    "Преподаватель": "amo_teacher",
    "Локация": "amo_location"
}, inplace=True)

with open(
        f'{library.REGIONS[REGION]["amo_reports"]}/{MONTH}/cleaned_{REPORT_SCALE}_{REPORT_START}_{REPORT_END}_report.csv',
        "w") as file:
    df.to_csv(file, index=False)
