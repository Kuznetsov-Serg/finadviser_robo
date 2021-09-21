from datetime import timedelta
from django.utils.timezone import now

from django.db import models
from django.utils.translation import gettext_lazy as _
from django.conf import settings
from mainapp.models import Product

# Create your models here.

class Model(models.Model):
    name = models.CharField(
        verbose_name='наименование',
        max_length=128,
    )
    short_desc = models.CharField(
        max_length=256,
        blank=True,
        verbose_name='краткое описание',
    )
    description = models.TextField(
        verbose_name='описание',
        blank=True,
    )
    pub_key = models.CharField(
        max_length=128,
        blank=True,
    )
    secret_key = models.CharField(
        max_length=128,
        blank=True,
    )
    is_active = models.BooleanField(
        verbose_name='активна',
        default=True,
    )

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'модель предсказаний'
        verbose_name_plural = 'модели предсказаний'


class Signal(models.Model):
    name = models.CharField(
        verbose_name='наименование',
        max_length=64,
    )
    description = models.CharField(
        max_length=256,
        blank=True,
        verbose_name='краткое описание',
    )
    is_active = models.BooleanField(
        verbose_name='активный',
        default=True,
    )

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'сигнал'
        verbose_name_plural = 'сигналы'


class Prediction(models.Model):
    model = models.ForeignKey(
        Model,
        on_delete=models.CASCADE,
    )
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
    )
    signal = models.ForeignKey(
        Signal,
        on_delete=models.CASCADE,
    )
    created = models.DateTimeField(
        auto_now_add=True,
    )
    date = models.DateTimeField(
        verbose_name='дата',
    )
    date_expires = models.DateTimeField(
        default=(now() + timedelta(hours=6)),
    )
    price = models.DecimalField(
        verbose_name='цена',
        max_digits=12,
        decimal_places=5,
        default=0,
    )
    percent = models.DecimalField(
        verbose_name='процент (доля)',
        max_digits=5,
        decimal_places=2,
        default=0,
    )
    optional_information = models.TextField(
        verbose_name='дополнительная информация',
        blank=True,
    )

    def __str__(self):
        return f'{self.model.name} ({self.product.name})'

    class Meta:
        verbose_name = 'предсказание модели для фин.продукта'
        verbose_name_plural = 'предсказания для фин.продукта(ов)'



# время жизни сигнала
# процент от общего портфеля рекомендаций