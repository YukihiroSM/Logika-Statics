# Generated by Django 3.2.13 on 2022-07-31 17:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0004_remove_payment_group_location'),
    ]

    operations = [
        migrations.AddField(
            model_name='location',
            name='territorial_manager',
            field=models.CharField(blank=True, max_length=256, null=True),
        ),
    ]