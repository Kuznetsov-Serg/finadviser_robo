import hashlib
from functools import reduce

from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from django.urls import reverse

from .models import Model, Prediction, Signal
from mainapp.models import Product

import pandas as pd


def prediction_put(request, sign):
    try:
        api_dict = request.GET

        model = Model.objects.get(is_active=True, pub_key=api_dict['pub_key'])
        if not model:
            print('Ошибка поиска модели по pub_key')
            return

        # Рассчитываем контрольную сумму на основании значений словаря
        param_str = reduce(lambda x, y: str(x) + str(y), api_dict.values())
        if sign != hashlib.md5((param_str + model.secret_key).encode('utf8')).hexdigest():
            print('Ошибка в контрольной сумме')
            return

        prediction = Prediction(
            model=model,
            product=get_object_or_404(Product, name=api_dict['product_name']),
            signal=get_object_or_404(Signal, name=api_dict['signal_name']),
            date=pd.to_datetime(api_dict['date']),
            date_expires=pd.to_datetime(api_dict['date_expires']),
            price=api_dict['price'],
            percent=api_dict['percent'],
        )

        # Проверка на дублирование записи в предсказаниях (модель, дата, фин.продукт)
        old_prediction = Prediction.objects.filter(model=prediction.model, product=prediction.product, date=prediction.date)
        if len(old_prediction):
            print('Попытка дублирования предсказания: \n', api_dict)
            # error_prediction_put(request)
            return

        prediction.save()
        return HttpResponseRedirect(reverse('index'))
    except Exception as err:
        print(f'error put prediction : {err.args}')
        return HttpResponseRedirect(reverse('index'))

def error_prediction_put(request):
    title = 'Ошибка загрузки предсказания'
    context = {
        'title': title,
    }
    return render(request, 'modelapp/error.html', context)