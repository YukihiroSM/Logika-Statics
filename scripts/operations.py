from django.core import management
import os
import logging
import datetime

def run():
    logger = logging.getLogger(__name__)
    timelines = [("2022-09-01", "2022-09-04"), ("2022-09-05", "2022-09-11"), ("2022-09-12", "2022-09-18"), ("2022-09-19", "2022-09-25")]
    # for timeline in timelines:
    #     logger.debug(f"STARTING GETTING REPORT FOR {str(timeline)}" + str(datetime.datetime.now()))
    #     os.environ["start_date"] = timeline[0]
    #     os.environ["end_date"] = timeline[1]
    #     os.environ["month"] = "Вересень"
    #     management.call_command("process_mk")
    #     management.call_command("payments_process", course="programming")
    #     management.call_command("payments_process", course="english")
    management.call_command("no_amo_id_issue_analyse")

