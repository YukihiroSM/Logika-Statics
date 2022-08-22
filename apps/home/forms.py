from django import forms


class ReportDateForm(forms.Form):
    report_scale = forms.CharField(label='report_scale', max_length=100)
