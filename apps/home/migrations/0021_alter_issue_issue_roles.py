# Generated by Django 3.2.13 on 2022-08-28 23:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0020_auto_20220828_2248'),
    ]

    operations = [
        migrations.AlterField(
            model_name='issue',
            name='issue_roles',
            field=models.CharField(max_length=1024, null=True),
        ),
    ]
