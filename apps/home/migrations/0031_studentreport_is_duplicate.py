# Generated by Django 4.1.1 on 2022-09-27 22:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("home", "0030_studentreport"),
    ]

    operations = [
        migrations.AddField(
            model_name="studentreport",
            name="is_duplicate",
            field=models.IntegerField(default=None),
            preserve_default=False,
        ),
    ]
