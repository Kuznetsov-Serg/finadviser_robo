# Generated by Django 3.2.5 on 2021-09-17 11:13

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('modelapp', '0008_alter_prediction_date_expires'),
    ]

    operations = [
        migrations.AlterField(
            model_name='prediction',
            name='date_expires',
            field=models.DateTimeField(default=datetime.datetime(2021, 9, 17, 17, 12, 59, 618273)),
        ),
    ]
