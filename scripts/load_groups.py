import os
from pathlib import Path
import csv

import library
from apps.home.models import GlobalGroup, Location

BASE_DIR = os.path.dirname(os.path.dirname(__file__))
groups_file_path = Path(BASE_DIR, "lms_reports", "Группы.csv")


def run():
    with open(groups_file_path, 'r', encoding="UTF-8") as file:
        reader = csv.reader(file, delimiter=';')
        next(reader)

        for row in reader:
            print(row)
            try:
                location = Location.objects.get(lms_location_name=row[2])
            except Location.DoesNotExist:
                print(f"This location does not exists in a list: {row[2]}")
                location = None
            course = library.get_business_by_group_course(row[7])
            global_group = GlobalGroup(lms_id=row[0],
                                       group_name=row[1],
                                       location=location,
                                       teacher=row[3],
                                       client_manager=row[4],
                                       group_type=row[5],
                                       status=row[6],
                                       region=row[8],
                                       course=course)
            global_group.save()
