import initial_create_report
import analyse_payments
import read_lms_mk
import read_1c
import update_report
import library

with open("report_scales.txt", "r") as report_scales_fileobj:
    scales = [sc.replace("\n", "") for sc in report_scales_fileobj.readlines()]
new_scale = f"{library.month}:{library.report_start}_{library.report_end}"
if new_scale not in scales:
    with open("report_scales.txt", "a") as report_scales_fileobj:
        report_scales_fileobj.write(f'\n{new_scale}')

read_lms_mk.main()
read_1c.main()
initial_create_report.main()
analyse_payments.main()
update_report.main()


