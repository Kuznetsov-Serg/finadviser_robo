# Generated by Django 3.2.5 on 2021-09-09 15:38

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('modelapp', '0002_auto_20210909_1537'),
    ]

    operations = [
        migrations.AlterField(
            model_name='prediction',
            name='date_expires',
            field=models.DateTimeField(default=datetime.datetime(2021, 9, 9, 21, 38, 28, 488575)),
        ),
    ]
