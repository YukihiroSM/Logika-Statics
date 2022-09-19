from django import forms


class ReportDateForm(forms.Form):
    report_scale = forms.CharField(label='report_scale', max_length=100)


class CreateAmoRef(forms.Form):
    amo_id = forms.CharField(label='ID учня в АМО', max_length=100, required=True)


class ReasonForCloseForm(forms.Form):
    reason = forms.CharField(label='Причина закриття незбіжності', max_length=1024, required=True)


class CreateLocation(forms.Form):
    lms_name = forms.CharField(label='lms_name', max_length=100)
    km = forms.CharField(label='km', max_length=100)
    tm = forms.CharField(label='tm', max_length=100)
    rm = forms.CharField(label='rm', max_length=100)
    tutor = forms.CharField(label='tutor', max_length=100)
