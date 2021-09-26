import hashlib
from functools import reduce

from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from django.urls import reverse

from .models import Model, Prediction, Signal
from mainapp.models import Product
from portfolioapp.models import Portfolio
from tgbot.models import User

import pandas as pd
from tgbot.tasks import broadcast_message


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

        prediction = Prediction()
        prediction.model = model
        prediction.optional_information = ''
        for key, value in api_dict.items():
            if key == 'product_name':
                prediction.product = get_object_or_404(Product, name=value)
            elif key == 'signal_name':
                prediction.signal = get_object_or_404(Signal, name=value)
            elif key == 'date':
                prediction.date = pd.to_datetime(value)
            elif key == 'date_expires':
                prediction.date_expires = pd.to_datetime(value)
            elif key == 'price':
                prediction.price = value
            elif key == 'percent':
                prediction.percent = value
            elif key != 'pub_key1':              # сохраним все остальные переданные поля со значениями
                prediction.optional_information += f'{key} = {value}\n'

        # Проверка на дублирование записи в предсказаниях (модель, дата, фин.продукт)
        old_prediction = Prediction.objects.filter(model=prediction.model, product=prediction.product,
                                                   date=prediction.date)
        if len(old_prediction):
            print(f'Попытка дублирования предсказания: \n{api_dict}')
            # error_prediction_put(request)
            return

        prediction.save()
        send_broadcast_message(prediction)          # широковещательно отправим предсказание всем пользователям
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

# широковещательно отправим предсказание всем пользователям
def send_broadcast_message(prediction):
    text = f'От модели  <b>{prediction.model}</b> получено предсказание:\nДата: {prediction.date}\n' \
           f'Продукт: <b>{prediction.product}</b>\nСигнал: <b>{prediction.signal}</b>\n<i>({prediction.signal.description})</i>\n' \
           f'Цена: <u>{prediction.price}</u>\n' \
           f'Процент: {prediction.percent}\nСрок жизни: {prediction.date_expires}'

    user_ids = get_users_by_product(prediction.product)
    # user_ids = list(User.objects.filter(is_blocked_bot=0, is_banned=0).values_list('user_id', flat=True))
    # user_ids = ['178698488']
    broadcast_message(user_ids=user_ids, message=text, parse_mode='HTML')

# Перечень ИД Клиентов, имеющих продукт в Портфолио
def get_users_by_product(product):
    return set(map(lambda x: x.user_id, Portfolio.objects.filter(is_active=True,
                                                                 product=product,
                                                                 user__is_blocked_bot=0,
                                                                 user__is_banned=0
                                                                 )))
