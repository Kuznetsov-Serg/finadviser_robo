# Generated by Django 3.2.5 on 2021-09-09 15:37

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authapp', '0007_alter_investoruser_activation_key_expires'),
    ]

    operations = [
        migrations.AlterField(
            model_name='investoruser',
            name='activation_key_expires',
            field=models.DateTimeField(default=datetime.datetime(2021, 9, 11, 15, 36, 21, 864713)),
        ),
    ]