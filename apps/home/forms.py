from django import forms


class ReportDateForm(forms.Form):
    report_scale = forms.CharField(label='report_scale', max_length=100)


class CreateAmoRef(forms.Form):
    lms_id = forms.CharField(label='lms_id', max_length=100)
    amo_id = forms.CharField(label='amo_id', max_length=100)


class CreateLocation(forms.Form):
    lms_name = forms.CharField(label='lms_name', max_length=100)
    km = forms.CharField(label='km', max_length=100)
    tm = forms.CharField(label='tm', max_length=100)
    rm = forms.CharField(label='rm', max_length=100)
    tutor = forms.CharField(label='tutor', max_length=100)
