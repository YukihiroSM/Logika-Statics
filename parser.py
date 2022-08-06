import selenium.common.exceptions
from selenium import webdriver
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.common import exceptions
import time
import pickle
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.keys import Keys
import time
import os
import pandas as pd
import datetime
from library import region, report_start, report_end, month, download_path
from concurrent.futures import ThreadPoolExecutor


def new_driver(download, profile="Default"):
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument('--no-proxy-server')
    chrome_options.add_argument(f"--user-data-dir=~/.config/google-chrome/{profile}")
    chrome_options.add_argument("--disable-extensions")
    chrome_options.add_argument("--disable-gpu")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--headless")

    prefs = {
        'download.default_directory': download}
    chrome_options.add_experimental_option('prefs', prefs)
    driver = webdriver.Chrome("./chromedriver", chrome_options=chrome_options)
    return driver


def download_wait(path_to_downloads):
    seconds = 0
    dl_wait = True
    while dl_wait and seconds < 20:
        time.sleep(1)
        dl_wait = False
        for fname in os.listdir(path_to_downloads):
            if fname.endswith('.crdownload'):
                dl_wait = True
        seconds += 1
    return seconds


username = "statistics"
password = "statistics"


# opens Google
def parse_groups():
    driver = new_driver(download_path)
    driver.get(f'https://lms.logikaschool.com/group/default/schedule?GroupWithLessonSearch%5BnextLessonTime%5D={report_start}%20-%20{report_end}&GroupWithLessonSearch%5Bid%5D=&GroupWithLessonSearch%5Btitle%5D=&GroupWithLessonSearch%5Bvenue%5D=&GroupWithLessonSearch%5Bactive_student_count%5D=&GroupWithLessonSearch%5Bweekday%5D=&GroupWithLessonSearch%5Bteacher%5D=&GroupWithLessonSearch%5Bcurator%5D=&GroupWithLessonSearch%5Btype%5D=&GroupWithLessonSearch%5Btype%5D%5B%5D=masterclass&GroupWithLessonSearch%5Bcourse%5D=')
    time.sleep(0.5)
    driver.find_element(By.NAME, "login").send_keys(username)
    driver.find_element(By.XPATH, '//*[@id="app"]/div/div/div[2]/form/div[2]/button').click()
    time.sleep(0.5)
    driver.find_element(By.NAME, "password").send_keys(password)
    driver.find_element(By.CLASS_NAME, "b-button").click()
    time.sleep(3)
    export_button = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.XPATH, '//*[@id="exportDropdownMenu"]')))
    export_button.click()
    csv_href = WebDriverWait(driver, 1).until(EC.presence_of_element_located((By.XPATH, '//*[@id="group-with-lesson-grid"]/div[1]/div[2]/div[2]/ul/li[1]')))
    csv_href.click()
    time.sleep(2)
    res = download_wait(download_path)
    driver.close()


results = []
skipped_groups = []

def parse_students_in_group_threads(group_ids):
    global results
    num_of_threads = len(group_ids) // 100
    if num_of_threads == 0:
        num_of_threads = 1
    threads = []
    # driver = new_driver(download_path)

    # driver.close()
    profiles = ["Profile 7", "Profile 8", "Profile 9", "Profile 10", "Profile 11"]
    drivers = [new_driver(download_path, profiles[i]) for i in range(num_of_threads)]
    for driver in drivers:
        driver.get("https://lms.logikaschool.com/")
        time.sleep(0.5)
        try:
            driver.find_element(By.NAME, "login").send_keys(username)
        except:
            continue
        driver.find_element(By.XPATH, '//*[@id="app"]/div/div/div[2]/form/div[2]/button').click()
        time.sleep(0.5)
        driver.find_element(By.NAME, "password").send_keys(password)
        driver.find_element(By.CLASS_NAME, "b-button").click()
        time.sleep(2)
    args = []
    for i in range(0, num_of_threads):
        if i == num_of_threads - 1:
            arg = group_ids[i * 100:]
        else:
            arg = group_ids[i * 100:(i + 1) * 100]
        args.append(arg)
    with ThreadPoolExecutor(max_workers=num_of_threads) as executor:
        executor.map(parse_students_in_group, args, drivers)

    for driver in drivers:
        driver.quit()
    # print(results)
    students = results[::]
    results = []
    print(f'Skipped groups due to nobody is in there: {skipped_groups}')
    return students


def parse_students_in_group(group_ids, driver):
    global results
    global skipped_groups
    for group_id in group_ids:
        print(f"parsing group {group_id} ({group_ids.index(group_id)}/{len(group_ids)})")
        path_to_group = f"https://lms.logikaschool.com/group/view/{group_id}"
        driver.get(path_to_group)
        try:
            WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.XPATH, '//*[@id="group-student-grid"]/div[2]/div[2]/div')))
        except selenium.common.exceptions.TimeoutException:
            skipped_groups.append(group_id)
            continue
        # students_body = driver.find_element(By.XPATH, '//*[@id="group-student-grid"]/div[2]/div[2]')
        div_num = 2
        birthday_test = driver.find_element(By.XPATH, '//*[@id="group-student-grid"]/div[2]/div[1]').get_attribute("class")
        if birthday_test == "birthday-reminder":
            div_num = 3
        containers = driver.find_elements(By.XPATH, f'//*[@id="group-student-grid"]/div[2]/div[{div_num}]/div')
        # '//*[@id="group-student-grid"]/div[2]/div[3]'
        students = []
        print(len(containers))
        for i in range(1, len(containers)+1):
            try:
                amo_badge = driver.find_element(By.XPATH, f'//*[@id="group-student-grid"]/div[2]/div[{div_num}]/div[{i}]/div[1]/div[1]/div[1]/div/div[1]/a').get_attribute("href")
            except:
                amo_badge = None
            student = driver.find_element(By.XPATH, f'//*[@id="group-student-grid"]/div[2]/div[{div_num}]/div[{i}]/div[1]/div[1]/div[1]/div/span[1]/a').get_attribute("href")
            status = driver.find_element(By.XPATH, f'//*[@id="group-student-grid"]/div[2]/div[{div_num}]/div[{i}]/div[1]/div[1]/div[4]/div/div/span/span/span').get_attribute("class")

            students.append((amo_badge, student, status))
        for student in students:
            amo = student[0].split("/")[-1] if student[0] else None
            lms = student[1].split("/")[-1]
            state = student[2]
            if "present" in state:
                status = True
            else:
                status = False
            results.append({"group_id": group_id, "amo_id": amo, "lms_id": lms, "attended_mc": status})
    return results


def download_1c_report():
    download = f"{os.getcwd()}/1c_reports/{month}/{report_start}_{report_end}/"
    os.makedirs(download, exist_ok=True)
    driver = new_driver(download)
    driver.get("https://school.cloud24.com.ua:22443/SCHOOL/en_US/")
    WebDriverWait(driver, 5).until(EC.alert_is_present(), 'Waiting for alert timed out')

    alert = driver.switch_to.alert
    alert.accept()

    WebDriverWait(driver, 3).until(
                EC.presence_of_element_located((By.XPATH, '//*[@id="userName"]')))
    usr_name = WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, '//*[@id="userName"]')))
    usr_name.send_keys("Андрей")
    passw = driver.find_element(By.XPATH, '//*[@id="userPassword"]')
    passw.send_keys("genius")
    driver.find_element(By.XPATH, '//*[@id="okButton"]').click()
    report = WebDriverWait(driver, 20).until(
        EC.presence_of_element_located((By.XPATH, '//*[@id="favsCell_cmd_0"]')))
    if report:
        report.click()

    start = WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, '//*[@id="form0_Период1ДатаНачала_i0"]')))
    actions = ActionChains(driver)
    actions.move_to_element(start)
    actions.click(start)  # select the element where to paste text
    actions.send_keys('02/01/2022')
    actions.perform()

    end = WebDriverWait(driver, 20).until(
        EC.element_to_be_clickable((By.XPATH, '//*[@id="form0_Период1ДатаОкончания_i0"]')))
    actions = ActionChains(driver)
    actions.move_to_element(end)
    actions.click(end)  # select the element where to paste text
    actions.send_keys('02/06/2022')
    actions.perform()

    driver.find_element(By.XPATH, '//*[@id="form0_СформироватьОтчет"]').click()
    time.sleep(2)
    driver.find_element(By.XPATH, '//*[@id="form0_Сохранить"]').click()
    filename = WebDriverWait(driver, 20).until(
        EC.element_to_be_clickable((By.XPATH, '//*[@id="form1_FileName_i0"]')))
    filetype = WebDriverWait(driver, 20).until(
        EC.element_to_be_clickable((By.XPATH, '//*[@id="form1_FileType_i0"]')))
    actions = ActionChains(driver)
    actions.move_to_element(filename)
    actions.click(filename)  # select the element where to paste text
    for i in range(7):
        actions.send_keys(Keys.BACKSPACE)
    actions.send_keys("payments_report.xlsx")
    actions.move_to_element(filetype)
    actions.click(filetype)  # select the element where to paste text
    actions.send_keys("Excel 2007-... sheet (*.xlsx)")
    actions.perform()
    WebDriverWait(driver, 3).until(
        EC.presence_of_element_located((By.XPATH, '//*[@id="editDropDown"]/div/ol/li/div/b/span'))).click()
    driver.find_element(By.XPATH, '//*[@id="form1_OK"]').click()

    download_wait(f"{download}")
    driver.close()


# def parse_payments()

# parse_students_in_group(grp_ids)
# amount_selector = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.XPATH, '//*[@id="venue-grid"]/div[1]/div[2]/div/select')))
# for option in amount_selector.find_elements(By.TAG_NAME, "option"):
#     if option.text == '200':
#         option.click()
#         break
# time.sleep(1)
# location_names = []
# i = 1
# time.sleep(10)
# table = driver.find_element(By.XPATH, '//*[@id="venue-grid-container"]/table/tbody')
# rows = table.find_elements(By.TAG_NAME, "tr")
# for row in rows:
#     location_names.append(row.find_element(By.TAG_NAME, 'td').find_element(By.TAG_NAME, 'a').text)
#
# print(location_names)

