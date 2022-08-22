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
        "python start": ['(архив)_курс_python._первый_год', '(прошлогодний!!!_назначайте_новый)_мастер_класс_python',
                         '[архив]_курс_python_start_2019/2020___1', 'python_2019_1st_year',
                         "мастер_класс_для_курса_'python_start'_2020/2021", 'python_introductory_lesson',
                         'архив_онбординг._python_start+pro',
                         'курс_програмування_python_start_2020/2021___1й_рік___укр_(версія_2020)',
                         'python_start_1_й_год', 'python_start_2nd_year_2020/2021_english',
                         'python_start_2021/2022___2й_год', 'python_start_2019_first_year_turkey',
                         'мк_курс_програмування_python_укр', 'python_start_test_1_год',
                         'мастер_класс,_python_start,_онлайн', 'python_start_1st_year_2020_2021_english',
                         'курс_програмування_python_start_2020/2021___2й_рік___укр',
                         'курс_програмування_python_start_2021/2022___1й_рік___укр_(версія_2021)',
                         'курс_програмування_python_start_2022/2023___2й_рік___укр',
                         ],
        "python pro": ['курс_программирования_python_pro', "мастер_класс_для_курса_'python_pro'",
                       'python_pro_2020_2021___1й_год', 'python_pro_2020_2021___2й_год', 'python_pro_test_1_год',
                       'мастер_класс,_python_pro,_онлайн', 'мастер_класс,_python_pro,_офлайн', 'python_pro_1_й_год',
                       'python_pro_2_й_год', 'python_pro_1_й_рік_укр_(2027)', 'python_pro_2й_рік,_укр_(курс_1554)',
                       ],
        "scratch": ['мк_креативное_программирование', 'креативное_программирование',
                    'архив_онбординг._креативное_программирование.',
                    'introductory_lesson___visual_programing_<_georgia_>', 'мк_візуальне_програмування_укр',
                    'візуальне_програмування_укр', 'курс_scratch,_начиная_с_повторения_и_модуля_4',
                    'курс_scratch,_начиная_с_повторения_и_модуля_3', 'курс_scratch,_начиная_с_повторения_и_модуля_2',
                    'мастер_класс,_визуальное_программирование,_офлайн', 'визуальное_программирование'],
        "gamedesign": ['геймдизайн', 'мастер_класс,_геймдизайн,_офлайн', 'game_design_spanish', 'game_design_english',
                       'online_introductory_lesson._game_design_english', 'геймдизайн_укр_(курс_707)',
                       'мк_офлайн_геймдизайн_укр_(курс_707)', 'мк_онлайн_геймдизайн_укр_(курс_707)', ],
        "graphdesign": ['графический_дизайн,_9_11', 'графический_дизайн,_12_14',
                        'мастер_класс,_графический_дизайн_12_14,_онлайн/офлайн', 'майстер_класс,_графічний_дизайн_укр',
                        'графічний_дизайн,_12_14,_укр_(курс_1484)',
                        ],
        "websites": ['создание_веб_сайтов', 'мастер_класс,_создание_веб_сайтов,_офлайн',
                     'мк_для_курсу_створення_сайтів___укр_(курс_716)', 'курс_створення_сайтів___укр_(курс_716,_2021р)',
                     'курс_створення_сайтів___укр_(версія_2022)', 'мк_для_курсу_створення_сайтів___укр_2021_(1750)',
                     ],
        "comp_gram": ["мастер_класс_для_курса_'основы_логики_и_программирования'", 'мк_компьютерная_грамотность',
                      'компьютерная_грамотность_и_цифровое_творчество_(7_9_лет)',
                      'архив_онбординг._основы_логики_и_программирования',
                      'компьютерная_грамотность_и_цифровое_творчество_(10_12_лет)',
                      'компьютерная_грамотность_и_цифровое_творчество_(новый!)', 'компьютерная_грамотность',
                      'мастер_класс,_компьютерная_грамотность_2021/2022,_офлайн',
                      "мк_'комп'ютерна_грамотність'_укр_(курс_777)_new",
                      "комп'ютерна_грамотність_укр_(курс_729)_new", ],
        "video_blogging": ['видеоблогинг', 'мастер_класс,_видеоблогинг,_онлайн', 'мастер_класс,_видеоблогинг,_офлайн', ]
    },
    "english": ['пробный_курс_английский', 'пробный_урок_англ', 'trial_lesson_for_a1',
                'вхідне_тестування_для_вчителів_англійської_укр_(eng)', 'trial_lesson_for_a2',
                'english_test_(trial_lesson)_укр', 'english_trial_lesson_(a2)_укр', 'english_trial_lesson_(a1)_укр',
                'english_level_a2_укр', 'english_level_a1_укр',

                ]
}

month = "august"
report_start = "2022-08-01"
report_end = "2022-08-07"
download_path = f'{os.getcwd()}/lms_reports/{month}/{report_start}_{report_end}/'

lms_path_to_student_data_by_id = 'https://lms.logikaschool.com/student?StudentSearch%5Bid%5D=1428237&StudentSearch%5Bfullname%5D=&StudentSearch%5Bparent_name%5D=&StudentSearch%5Bphone%5D=&StudentSearch%5BgroupId%5D=&StudentSearch%5Bgroup%5D=&StudentSearch%5Bteacher%5D=&StudentSearch%5Bcurator%5D=&StudentSearch%5BgroupStartDate%5D%5Bop%5D=gt&StudentSearch%5BgroupStartDate%5D%5Bdate%5D=&StudentSearch%5BgroupType%5D='

headers = {
    'authority': 'lms.logikaschool.com',
    'accept': 'application/json, text/plain, */*',
    'accept-language': 'en-US,en;q=0.9,uk;q=0.8',
    'cookie': '_ga=GA1.2.848093747.1631883892; _ym_uid=1631979493518118225; __ddg1=VVjX0yaoIU5vGXiDL2vj; __ddg2=x6IsthCFjdQpsCpM; __ddgid=ySYQvgv8a8T1qFgq; _fbp=fb.1.1633252547357.969193503; _ym_d=1647806820; _identity-frontend-multi=b8395f53378baddfb32c692f92ecf8a290ce3a4d93cb9aaa1550928f3c5052d8a%3A2%3A%7Bi%3A0%3Bs%3A24%3A%22_identity-frontend-multi%22%3Bi%3A1%3Bs%3A51%3A%22%5B620844%2C%22yly3ZC37ZbTo-GFfTpAmLnVEXwpIC5Fb%22%2C2592000%5D%22%3B%7D; _tt_enable_cookie=1; _ttp=88ac1c95-bd2c-4742-a6c0-5a03b9169d17; _grid_page_size=46b471924569f0463604180145f83774071be5a6d926b2cfb69c3182db6fcc23a%3A2%3A%7Bi%3A0%3Bs%3A15%3A%22_grid_page_size%22%3Bi%3A1%3Bs%3A4%3A%221000%22%3B%7D; _grid_page_size_schedule=35d0980fa38e2255112d0c62698773cab8aa12a81c6735caf172064b5eb6ea47a%3A2%3A%7Bi%3A0%3Bs%3A24%3A%22_grid_page_size_schedule%22%3Bi%3A1%3Bs%3A3%3A%22200%22%3B%7D; _gid=GA1.2.1939740071.1659256451; sidebar-state=collapsed; _csrf=d250bbc00e04ebb7157a8ac024ddecc11b39631c137deba93f04d8444fbaf201a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22vIFb4FlTjgSzJJlBT8AkYNlzGypyr0kw%22%3B%7D; previousPage=%2Fdashboard%2Fdefault%2F%5Bobject%2520Object%5D; userId=23319; createdTimestamp=1659369938; accessToken=6ef212a48bd801fc866b1c69e82900917d843b080f8d3f2b16c45881f4fc312b; SERVERID=b250; _backendMainSessionId=7cb466b051397f2ccc6d8b4d353537b5; SERVERID=b80; intercom-session-ufjpx6k3=eTZJVGRDK095Yi81VjV3cGVaRFFaWTE5YlJNd2FVMS9mVHExeTdtT1I2S0Q3ejU1R0o5OWVYSEpKUEVoUFc5Ky0tR2RneVV1aVdVMG9Nb2M4Y0tnL2o5dz09--e179f3982943ed0139fc4ba8c3748948a9e338d7',
    'referer': f'https://lms.logikaschool.com/',
    'sec-ch-ua': '".Not/A)Brand";v="99", "Google Chrome";v="103", "Chromium";v="103"',
    'sec-ch-ua-mobile': '?1',
    'sec-ch-ua-platform': '"Android"',
    'sec-fetch-dest': 'empty',
    'sec-fetch-mode': 'cors',
    'sec-fetch-site': 'same-origin',
    'user-agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36',
}


def get_business_by_group_course(lms_course):
    lms_course = lms_course.lower().replace(" ", "_").replace("-", "_").replace('"', "'")
    if lms_course in COURSES["english"]:
        return "english"
    else:
        for key in COURSES["programming"]:
            if lms_course in COURSES["programming"][key]:
                return "programming"
    return "unknown"