# Generated by Django 4.1.1 on 2022-09-27 22:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("home", "0032_rename_enrolled_md_studentreport_enrolled_mc"),
    ]

    operations = [
        migrations.AddField(
            model_name="studentreport",
            name="amo_id",
            field=models.CharField(default=None, max_length=16),
            preserve_default=False,
        ),
    ]
