import os
REGIONS = {
    "chernivtsi_region": {
        "amo_reports": "amo_reports/chernivtsi_region",
        "lms_reports": "lms_reports/chernivtsi_region",
        "output_reports": "output_reports/chernivtsi_region",
        "titles": "черновицкий_регион"
    },
    "lviv_region": {
        "amo_reports": "amo_reports/lviv_region",
        "lms_reports": "lms_reports/lviv_region",
        "titles": "львовский_регион"
    },
    "online_region": {
        "amo_reports": "amo_reports/online_region",
        "lms_reports": "lms_reports/online_region",
        "titles": ""
    },
    "kyiv_city": {
        "amo_reports": "amo_reports/kyiv_city",
        "lms_reports": "lms_reports/kyiv_city",
        "1c_reports": "1c_reports/kyiv_city",
        "titles": "",
        "locations": ['онлайн_киев', 'киев_лесной_массив', 'киев_контрактовая', 'киев_севастопольская_площадь',
                      'киев_виноградарь', 'киев_академ', 'киев_теремки', 'киев_олимпийская', 'киев_политех',
                      'киев_лукьяновка', 'киев_минская', 'киев_вднх', 'киев_левобережная', 'киев_осокорки',
                      'киев_позняки', 'киев_оболонь']
    }
}

TEACHERS = {
    "chernivtsi_region": {
        "programming": ["Гай Назар", "Ніколаєнко Діна", "Кухарук Ірина", "Сидорук Руслана"],
        "english": []
    }
}

COURSES = {
    "programming": {
        "python start": ["курс_програмування_python_start_2021/2022___1й_рік___укр_(версія_2021)",
                         "курс_програмування_python_start_2020/2021___2й_рік___укр",
                         "мк_курс_програмування_python_укр",
                         "python_start_2021/2022___2й_год", "python_start_1_й_год",
                         "python_start", "пітон_старт", "питон_старт", "пайтон",
                         "пітон", "python", "питон",
                         "курс_програмування_python_start_2020/2021___1й_рік___укр_(версія_2020)"],
        "python pro": ["python_pro_2й_рік,_укр_(курс_1554)", "python_pro_2_й_год",
                       "python_pro_1_й_год",
                       "python_pro_2020_2021___1й_год", "python_pro", "пітон_про", "питон_про"],
        "scratch": ["визуальное_программирование", "мастер_класс,_визуальное_программирование,_офлайн", "scratch",
                    "скретч", "скрэтч", "скрєтч", "скреч", "scretch", "screch", "scrach",
                    "мк_візуальне_програмування_укр", "візуальне_програмування_укр"],
        "gamedesign": ["мк_офлайн_геймдизайн_укр_(курс_707)", "мк_онлайн_геймдизайн_укр_(курс_707)",
                       "геймдизайн_укр_(курс_707)", "мастер_класс,_геймдизайн,_офлайн", "game", "гейм", "гэйм",
                       "геймдизайн", "роблокс", "roblox", "game_design", "gamedesign"],
        "graphdesign": ["майстер_класс,_графічний_дизайн_укр", "графічний_дизайн,_12_14,_укр_(курс_1484)",
                        "мастер_класс,_графический_дизайн_12_14,_онлайн/офлайн", "графический_дизайн,_12_14",
                        "графический_дизайн,_9_11", "графический_дизайн", "граф", "графдиз", "графдизайн",
                        "графическийдизайн", "графічний_дизайн"],
        "webdesign": ["webdesign", "веб", "web", "дизайн", "вебдизайн", "веб_дизайн", "вэб", "вэб_дизайн", "вебдизайн"],
        "websites": ["веб_дизайн_(_сайти)", "курс_створення_сайтів___укр_(версія_2022)",
                     "мк_для_курсу_створення_сайтів___укр_2021_(1750)",
                     "мк_для_курсу_створення_сайтів___укр_(курс_716)", "курс_створення_сайтів___укр_(курс_716,_2021р)",
                     "мастер_класс,_создание_веб_сайтов,_офлайн", "веб_сайти", "web_sites", "вебсайти", "websites",
                     "sites", "site", "сайти", "сайт", "сайты", "вебсайты", "веб_сайты", "создание_веб_сайтов"],
        "comp_gram": ["мк_'комп'ютерна_грамотність'_укр_(курс_777)_new", "комп'ютерна_грамотність_укр_(курс_729)_new",
                      "мастер_класс,_компьютерная_грамотность_2021/2022,_офлайн", "компьютерная_грамотность", "кг",
                      "комп", "грам", "компьютерна_грамотність", "грамотність", "комп'ютерна_грамотність"]
    },
    "english": ["trial_lesson_for_a1", "вхідне_тестування_для_вчителів_англійської_укр_(eng)", "trial_lesson_for_a2",
                "english_test_(trial_lesson)_укр", "english_trial_lesson_(a2)_укр", "пробный_курс_английский",
                "english_level_a1_укр", "english_level_a2_укр", "english_trial_lesson_(a1)_укр"]
}

region = "kyiv_city"
month = "february"
report_start = "2022-02-01"
report_end = "2022-02-06"
download_path = f'{os.getcwd()}/lms_reports/{month}/{report_start}_{report_end}/'

lms_path_to_student_data_by_id = 'https://lms.logikaschool.com/student?StudentSearch%5Bid%5D=1428237&StudentSearch%5Bfullname%5D=&StudentSearch%5Bparent_name%5D=&StudentSearch%5Bphone%5D=&StudentSearch%5BgroupId%5D=&StudentSearch%5Bgroup%5D=&StudentSearch%5Bteacher%5D=&StudentSearch%5Bcurator%5D=&StudentSearch%5BgroupStartDate%5D%5Bop%5D=gt&StudentSearch%5BgroupStartDate%5D%5Bdate%5D=&StudentSearch%5BgroupType%5D='
