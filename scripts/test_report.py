from apps.home.models import StudentReport
def run():
    total_students = StudentReport.objects.filter(amo_id__isnull=False, is_duplicate=0).all()
    enrolled_students = StudentReport.objects.filter(amo_id__isnull=False, is_duplicate=0, enrolled_mc=1).all()
    attended_students = StudentReport.objects.filter(amo_id__isnull=False, is_duplicate=0, attended_mc=1).all()
    payments = StudentReport.objects.filter(payment=1).all()
    print()