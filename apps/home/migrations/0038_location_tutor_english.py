# Generated by Django 4.1.1 on 2022-09-30 07:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("home", "0037_globalgroup_full_course"),
    ]

    operations = [
        migrations.AddField(
            model_name="location",
            name="tutor_english",
            field=models.CharField(blank=True, max_length=256, null=True),
        ),
    ]
