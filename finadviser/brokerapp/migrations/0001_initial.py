# Generated by Django 3.2.5 on 2021-09-08 16:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('mainapp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Broker',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128, verbose_name='наименование')),
                ('short_desc', models.CharField(blank=True, max_length=256, verbose_name='краткое описание')),
                ('description', models.TextField(blank=True, verbose_name='описание')),
                ('link', models.URLField(blank=True, verbose_name='ссылка на сайт')),
                ('is_active', models.BooleanField(default=True, verbose_name='активна')),
            ],
            options={
                'verbose_name': 'брокер',
                'verbose_name_plural': 'брокеры',
            },
        ),
        migrations.CreateModel(
            name='BrokerProduct',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_active', models.BooleanField(default=True, verbose_name='активна')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('broker', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='brokerapp.broker')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mainapp.product')),
            ],
            options={
                'verbose_name': 'фин.продукт брокера',
                'verbose_name_plural': 'фин.продукты брокеров',
            },
        ),
    ]
