# Generated by Django 3.2.5 on 2021-09-08 16:23

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('mainapp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Model',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128, verbose_name='наименование')),
                ('short_desc', models.CharField(blank=True, max_length=256, verbose_name='краткое описание')),
                ('description', models.TextField(blank=True, verbose_name='описание')),
                ('pub_key', models.CharField(blank=True, max_length=128)),
                ('secret_key', models.CharField(blank=True, max_length=128)),
                ('is_active', models.BooleanField(default=True, verbose_name='активна')),
            ],
            options={
                'verbose_name': 'модель предсказаний',
                'verbose_name_plural': 'модели предсказаний',
            },
        ),
        migrations.CreateModel(
            name='Signal',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=64, verbose_name='наименование')),
                ('is_active', models.BooleanField(default=True, verbose_name='активный')),
            ],
            options={
                'verbose_name': 'сигнал',
                'verbose_name_plural': 'сигналы',
            },
        ),
        migrations.CreateModel(
            name='Prediction',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(verbose_name='дата')),
                ('date_expires', models.DateTimeField(default=datetime.datetime(2021, 9, 8, 22, 23, 53, 309701))),
                ('price', models.DecimalField(decimal_places=5, default=0, max_digits=12, verbose_name='цена')),
                ('percent', models.DecimalField(decimal_places=2, default=0, max_digits=5, verbose_name='процент (доля)')),
                ('model', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='modelapp.model')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mainapp.product')),
                ('signal', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='modelapp.signal')),
            ],
            options={
                'verbose_name': 'предсказание модели для фин.продукта',
                'verbose_name_plural': 'предсказания для фин.продукта(ов)',
            },
        ),
    ]
