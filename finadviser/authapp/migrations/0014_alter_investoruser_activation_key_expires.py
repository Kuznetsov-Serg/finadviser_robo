# Generated by Django 3.2.5 on 2021-08-25 22:05

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authapp', '0013_alter_investoruser_activation_key_expires'),
    ]

    operations = [
        migrations.AlterField(
            model_name='investoruser',
            name='activation_key_expires',
            field=models.DateTimeField(default=datetime.datetime(2021, 8, 27, 22, 5, 16, 479508)),
        ),
    ]
