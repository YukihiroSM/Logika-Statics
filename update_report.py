from sql_app import main as sq
import library
import read_lms_mk
from sql_app import crud, schemas
from sql_app.database import SessionLocal
import analyse_payments

students_ref_without_amo = []
students_ref_without_location = []
unknown_payments = []
results = {
    'unknown_payments': [('', 'Постой Анна', 'Семенюк Валерія'), ('111111', 'Білоус Олександр', 'Цупа Яна Дмитрівна'), ('', 'Соколенко Елизавета', 'Нишанбаева Татьяна'), ('1431143', 'Кыяныця Виктор', 'Штепа Марина'), ('1409624', 'Маринеску Антон', 'Зозулина Яна'), ('2548796', 'Строков Илья ', 'Дугельная Екатерина'), ('1425123', 'Луценко Валерия', 'Епитроп Валентина'), ('1424277', 'Николаев Вадим', 'Епитроп Валентина'), ('1389710', 'Яременко Вікторія', 'Цупа Яна Дмитрівна'), ('1249201', 'Костин Тимофей', 'Котова Оксана'), ('1431125', 'Забелин Илья', 'Романова-Савкина Валерия '), ('1425277', 'Бондар Богдан', 'Філімонова Марина'), ('1438860', 'Козловский Александр', 'Обертун Настя '), ('1423820', 'Василишин Даниїл', 'Цупа Яна Дмитрівна'), ('1444057', 'Бакалець Володимир', 'Ружанская Анна Онлайн'), ('1018020', 'Ципайло Ілона', 'Світа Галина'), ('1439539', 'Шитюк Даша', 'Пасниченко Лариса'), ('1426216', 'Шеремет Ілля', ''), ('', '<Object not found> (48:80c100155d00563b11eb7379ec6adb70)', '')],
    'Харьков, Дружбы народов***UA_Kharkov': 5, 'Вузовский.Одесса***UA_Odessa': 4, 'Рубчака***UA_Lviv': 3, 'Русал.Николаев***UA_Nikolaevskaya_obl': 1, 'Бахмач***UA_Chernigov_obl': 4, 'Онлайн***UA_SaaS': 57, 'Львів-Винники***UA_Lviv': 5, 'Фастов***UA_Kievskaya oblast': 5, 'Харьков, Гагарина***UA_Kharkov': 3, 'Херсон Центр***UA_Odesskaya oblast': 2, 'Луцьк-Центр***UA_LvivOblast': 1, 'Харьков, Ботсад***UA_Kharkov': 12, 'Белгород-Днестровский***UA_Odesskaya oblast': 5, 'БЦ Центр 1***UA_Kievskaya oblast': 1, 'Дрогобич***UA_LvivOblast': 3, 'Малин***UA_VynnytsyaOblast': 5, 'Вінниця. КіндерСтар***UA_Vynnytsya': 3, 'Онлайн Киев***UA_Kiev': 6, 'Житомир***UA_VynnytsyaOblast': 6, 'Поселок.Одесса***UA_Odesskaya oblast': 1, 'Мира.Николаев***UA_Odesskaya oblast': 1, 'ХБК***UA_Odesskaya oblast': 5, 'Мирноград***UA_Donetskobl': 1, 'Черноморск***UA_Odesskaya oblast': 3, 'Черкассы***UA_Center': 25, 'Долина***UA_ChernivtsiOblast': 8, 'Онлайн Николаев обл.***UA_Nikolaevskaya_obl': 3, 'Вознесенск***UA_Nikolaevskaya_obl': 2, 'Южноукраинск***UA_Nikolaevskaya_obl': 1, 'Запорожье.Вознесеновский***UA_Dnepropetrovskaya oblast2': 2, 'Вишневое***UA_Kievskaya oblast': 3, 'Покровск***UA_Donetskobl': 3, 'Лимон Энергодар***UA_Dnepr_region': 1, 'Полтава, Центр***UA_Poltava': 6, 'Беляевка.Одесса***UA_Odesskaya oblast': 5, 'Тернопіль-БАМ***UA_Lviv': 3, 'Черемушки.Одесса***UA_Odessa': 1, 'Дубно***UA_LvivOblast': 3, 'Славута***UA_ChernivtsiOblast': 3, 'Рівне-Центр***UA_Lviv': 5, 'Красилів***UA_ChernivtsiOblast': 16, 'Хмельницький офіс***UA_Chernivtsi': 1, 'Болград***UA_Odesskaya oblast': 1, 'КП офіс***UA_ChernivtsiOblast': 4, 'Полонне***UA_ChernivtsiOblast': 16, 'Шепетівка***UA_ChernivtsiOblast': 6, 'ІФ офіс***UA_Chernivtsi': 1, 'Синельниково***UA_Dnepropetrovskaya oblast': 1, 'Мукачево***UA_ChernivtsiOblast': 2, 'Хмільник***UA_VynnytsyaOblast': 2, 'Борисполь Гранат 1***UA_Kievskaya oblast': 3, 'Павлоград Орбита***UA_Donetskobl': 4, 'Бровары 1***UA_Kievskaya oblast': 5, 'Гайсин***UA_VynnytsyaOblast': 6, 'Днепр.Слобожанский***UA_Dnepropetrovskaya oblast2': 2, 'Новоград-Волинський***UA_VynnytsyaOblast': 1, 'Чорновола***UA_Lviv': 1, 'Червоноград***UA_LvivOblast': 5, 'Левицького***UA_Lviv': 3, 'Лисичанск***UA_Donetskobl': 7, 'Каменское***UA_Dnepr_region': 3, 'Бровары 2***UA_Kievskaya oblast': 4, 'Мелитополь***UA_Dnepr_region': 3, 'Борислав***UA_LvivOblast': 11, 'Славянск***UA_Donetskobl': 2, 'Измаил***UA_Odesskaya oblast': 2, 'Слободка.Одесса***UA_Odesskaya oblast': 1, 'Балта.Ладушки***UA_Odesskaya oblast': 2, 'Киев, Троещина2***UA_Kievskaya oblast': 4, 'Рени***UA_Odesskaya oblast': 1, 'Павлоград Цум***UA_Donetskobl': 2, 'Луцьк-Центр***UA_Lviv': 11, 'Центрально-городской***UA_Dnepr_region': 2, 'Бердянск***UA_Dnepr_region': 1, 'Заречный***UA_Dnepr_region': 5, 'Стрий***UA_LvivOblast': 6, 'Татарбунары***UA_Odesskaya oblast': 3, 'Светловодск***UA_Center': 1, 'Поселок.Одесса***UA_Odessa': 3, 'Соцгород***UA_Donetskobl': 1, 'Костопіль***UA_LvivOblast': 4, 'Кропивницкий***UA_Center': 5, 'Харьков, Холодная Гора***UA_Kharkov': 3, 'Днепр.Победа***UA_Dnepr': 4, 'Терновка***UA_Dnepr_region': 2, 'Марганец***UA_Dnepropetrovskaya oblast': 6, 'Знаменка***UA_Center': 3, 'Харьков,Дворец спорта***UA_Kharkov': 1, 'Полтава, Европейская***UA_Poltava': 5, 'Хмельницький ТЦ EL***UA_Chernivtsi': 4, 'Курахово***UA_Donetskobl': 5, 'Киев, Левобережная***UA_Kiev': 1, 'Кременчуг Гагарина***UA_Poltava': 1, 'Золотоноша***UA_Center': 2, 'Вишенька***UA_Vynnytsya': 1, 'Звенигородка***UA_Center': 4, 'Смела***UA_Center': 2, 'Могилів-Подільський***UA_VynnytsyaOblast': 2, 'Жмеринка***UA_VynnytsyaOblast': 3, 'Бердичів***UA_VynnytsyaOblast': 1, 'Северодонецк***UA_Donetskobl': 2, 'Новояворівськ***UA_LvivOblast': 2, 'Умань***UA_Center': 4, 'Ирпень***UA_Kievskaya oblast': 1, 'Тернопіль-Центр***UA_LvivOblast': 1, 'Днепр.Центр***UA_Dnepr': 1, 'Тернопіль-Центр***UA_Lviv': 4, 'Жовква***UA_LvivOblast': 14, 'Хуст***UA_ChernivtsiOblast': 3, 'Новая Каховка***UA_Odesskaya oblast': 2, 'Рівне-Північний***UA_Lviv': 2, 'БЦ Центр 2***UA_Kievskaya oblast': 1, 'Авангард.Одесса***UA_Odessa': 5, 'Днепр.Красный Камень***UA_Dnepr': 1, 'Коломия***UA_ChernivtsiOblast': 4, 'Надвірна***UA_ChernivtsiOblast': 2, 'Келецька***UA_Vynnytsya': 1, 'Украинка***UA_Kievskaya oblast': 12, 'Маразлиевская.Одесса***UA_Odesskaya oblast': 1, 'Переяслав***UA_Kievskaya oblast': 1, 'Чернівці офіс***UA_Chernivtsi': 1, 'Овидиополь.Детский клуб***UA_Odesskaya oblast': 2, 'Старокостянтинів***UA_ChernivtsiOblast': 1, 'Нежин***UA_Chernigov_obl': 2, 'Отель***UA_Dnepropetrovskaya oblast': 1, 'Охтирка***UA_Poltava': 2, 'Краматорск Даманский***UA_Dnepr': 1, 'Калуш***UA_ChernivtsiOblast': 3, 'Южный***UA_Odesskaya oblast': 5, 'Терновка***UA_Donetskobl': 1, 'Коростень***UA_VynnytsyaOblast': 8, 'Боярка***UA_Kievskaya oblast': 5, 'Маразлиевская.Одесса***UA_Odessa': 5, 'Первомайск***UA_Nikolaevskaya_obl': 4, 'Киев онлайн***UA_Chernigov_obl': 1, 'Александрия***UA_Dnepr_region': 1, 'Днепр.Караван***UA_Dnepr': 3, 'Онлайн Киевская Область***UA_Kievskaya oblast': 1, 'Васильков***UA_Kievskaya oblast': 1, 'Киев, Академ***UA_Kiev': 2, 'Киев, Оболонь***UA_Kiev': 1, 'Мира.Николаев***UA_Nikolaevskaya_obl': 2, 'Сихів***UA_Lviv': 1, 'Каховка***UA_Odesskaya oblast': 1, 'Онлайн_Одесская обл***UA_Odesskaya oblast': 1, 'Центр.Николаев***UA_Nikolaevskaya_obl': 1, 'Александрия***UA_Dnepropetrovskaya oblast': 1}

offices = {"UA_Kievskaya oblast": "ТМ Киевская Область",
    "UA_Kiev": "Щербатюк Артем",
    "UA_Odessa": "ТМ Одесса",
    "UA_Kharkov": "ТМ Харьков",
    "UA_Dnepr": "ТМ Днепропетровск",
    "UA_SaaS": "Смидонова Ольга",
    "UA_Odesskaya oblast": "ТМ Одесская Область",
    "UA_Vynnytsya": "ТМ Винница",
    "UA_Dnepropetrovskaya oblast": "ТМ Днепропетровская Область",
    "UA_Chernivtsi": "ТМ Черновцы",
    "UA_Lviv": "ТМ Львов",
    "UA_ChernivtsiOblast": "ТМ Черновцы Область",
    "UA_LvivOblast": "ТМ Львовская Область",
    "UA_VynnytsyaOblast": "ТМ Винницкая Область",
    "UA_Dnepr_region": "ТМ Днепропетровский Регион",
    "UA_Poltava": "ТМ Полтава",
    "UA_Chernigov_obl": "ТМ Черниговская Область",
    "UA_Donetskobl": "ТМ Донецкая Область",
    "UA_Center": "ТМ Центр",
    "UA_Nikolaevskaya_obl": "ТМ Николаевская Область",
    "UA_Dnepropetrovskaya oblast2": "ТМ Днепропетровская Область"}

# db = SessionLocal()
#
# for location in results:
#     if location == "unknown_payments":
#         continue
#     ref = schemas.LocationCreate(
#         lms_location_name=location.split("***")[0],
#         region=location.split("***")[1],
#         territorial_manager=offices[location.split("***")[1]]
#     )
#     crud.create_location(db, ref)
# db.close()
res = {}
db = SessionLocal()
group_ids = list(set([grid[0] for grid in crud.get_groupids_from_studentamoref(db)]))
db.close()
for group in group_ids:
    db = SessionLocal()
    group_total = 0
    group_attended = 0
    location = crud.get_globalgroup_location_by_id(db, group)
    office = crud.get_globalgroup_office_by_id(db, group)[0]
    if location and len(location[0]) > 2 and location[0] != "nan":
        location = location[0]
    else:
        students_ref_without_location.append(*crud.get_studentsamoref_by_group_id(db, group))
        continue


    ref = schemas.LocationCreate(
            lms_location_name=location,
            region=office,
            territorial_manager=offices[office]
        )

    students = crud.get_studentsamoref_by_group_id(db, group)
    for student in students:
        if not student.amo_id:
            students_ref_without_amo.append(student)
        else:
            group_total += 1
            if student.attended == '1':
                group_attended += 1
    print(f"Updating group {group} from {location} total: {group_total} attended: {group_attended}")
    crud.update_report_total(db, location=location, region=office, tm=offices[office], start_date=library.report_start, end_date=library.report_end, total=group_total)
    crud.update_report_attended(db, location=location, region=office, tm=offices[office], start_date=library.report_start, end_date=library.report_end, attended=group_attended)

    res[group] = {}
    res[group]["attended_mc"] = group_attended
    res[group]["total"] = group_total

    db.close()
db = SessionLocal()
crud.update_conversions(db)
db.close()
print(res)
print(students_ref_without_amo)