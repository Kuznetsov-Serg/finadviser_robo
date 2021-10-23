import datetime
import hashlib
from functools import reduce

import requests
from django.core.management.base import BaseCommand
import json
import os
from urllib.parse import urlunparse, urlencode, urlparse
from collections import OrderedDict
from django.shortcuts import render, get_object_or_404

import pandas as pd             # для работы с Excel
from openpyxl import Workbook   # для работы с Excel

from mainapp.models import Product
from modelapp.models import Prediction, Model, Signal
from authapp.models import InvestorUser


JSON_PATH = 'mainapp/import'
EXCEL_PATH = 'mainapp/import'

class Command(BaseCommand):
    def handle(self, *args, **options):
        # fill_new_bd_from_E/XCEL_file('prediction')   # Зальем новую БД с перечнем товаров и категорий (запускаем при изменении Excel-файла)
        fill_new_bd_from_EXCEL_file_by_api('prediction')   # Зальем новую БД с перечнем товаров и категорий (запускаем при изменении Excel-файла)
        # InvestorUser.objects.create_superuser('kuznetsov', 'ksn1974@mail.ru', '1', age=33)

def load_from_json(file_name):
    with open(os.path.join(JSON_PATH, file_name + '.json'), 'r') as infile:
        return json.load(infile)

################################################
# Вспомогательные функции для работы с файлами
################################################

# Функция загрузки БД из EXCEL-файла (его проще набивать) текущая БД удаляется
def fill_new_bd_from_EXCEL_file (file_name="catalog"):
    convert_EXCEL_file_to_JSON_file(file_name)      # Конвертируем перечень товаров из excel (легче набивать) в JSON
    catalog = read_json(file_name)                  # Считаем перечень из JSON

    # Prediction.objects.all().delete()               # Удалим все из предсказаний

    Model.objects.get_or_create(name='Превосходная модель')       # Создадим новую модель, если такой не было
    model = Model.objects.filter(name='Превосходная модель')
    for el in catalog:
        Product.objects.get_or_create(name=el['product'])       # Создадим новый продукт, если такого не было
        product = Product.objects.filter(name=el['product'])    # Найдем этот продукт для получения ID
        Signal.objects.get_or_create(name=el['signal'])
        signal = Signal.objects.filter(name=el['signal'])
        date = pd.to_datetime(el['date'])
        date_expires = pd.to_datetime(el['date_expires'])
        price = el['price']
        percent = el['percent']
        prediction = Prediction(
            model_id=model.values()[0]['id'],
            product_id=product.values()[0]['id'],
            signal_id=signal.values()[0]['id'],
            date=date,
            date_expires=date_expires,
            price=price,
            percent=percent
        )
        prediction.save()


# Функция загрузки БД из EXCEL-файла (его проще набивать) через встроенное API
def fill_new_bd_from_EXCEL_file_by_api (file_name="catalog"):
    convert_EXCEL_file_to_JSON_file(file_name)      # Конвертируем перечень товаров из excel (легче набивать) в JSON
    catalog = read_json(file_name)                  # Считаем перечень из JSON

    # Prediction.objects.all().delete()               # Удалим все из предсказаний

    Model.objects.get_or_create(name='Превосходная модель')       # Создадим новую модель, если такой не было
    model = get_object_or_404(Model, name='Превосходная модель')

    for el in catalog:
        api_dict = OrderedDict(
                                pub_key=model.pub_key,
                                product_name=el['product'],
                                signal_name=el['signal'],
                                date=pd.to_datetime(el['date']),
                                date_expires=pd.to_datetime(el['date_expires']),
                                price=el['price'],
                                percent=el['percent'],
                                )
        # Рассчитываем контрольную сумму на основании значений словаря
        param_str = reduce(lambda x, y: str(x) + str(y), api_dict.values())
        sign = hashlib.md5((param_str + model.secret_key).encode('utf8')).hexdigest()

        # Генерим API-запрос
        api_url = urlunparse(('http', '1362-212-176-232-203.ngrok.io', '/api/prediction.put/' + sign + '/', None,
                          urlencode(api_dict), None))
        print(api_url)
        resp = requests.get(api_url)
        if resp.status_code != 200:
            print(f'Ошибка записи предсказания на основном БЭКе Error: {resp.status_code}')


# Конвертируем перечень товаров из excel в JSON
def convert_EXCEL_file_to_JSON_file (file_name):
    data = pd.read_excel(os.path.join(EXCEL_PATH, file_name + '.xlsx'))
    path_JSON = os.path.join(JSON_PATH, file_name + '.json')
    data.to_json(path_or_buf=path_JSON, orient='records')
    return path_JSON

# считаем JSON из файла
def read_json(file_name):
    with open(os.path.join(JSON_PATH, file_name + '.json'), 'r') as infile:
        return json.load(infile)
    # return json.loads(read_file(file_name_with_path))


