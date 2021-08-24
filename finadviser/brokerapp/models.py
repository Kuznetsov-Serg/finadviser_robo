from django.db import models
from django.conf import settings
from mainapp.models import Product

# Create your models here.

class Broker(models.Model):
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
    link = models.URLField(
        verbose_name='ссылка на сайт',
        blank=True,
    )
    is_active = models.BooleanField(
        verbose_name='активна',
        default=True,
    )

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'брокер'
        verbose_name_plural = 'брокеры'


class BrokerProduct(models.Model):
    broker = models.ForeignKey(
        Broker,
        on_delete=models.CASCADE,
    )
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
    )
    is_active = models.BooleanField(
        verbose_name='активна',
        default=True,
    )
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.broker.name} ({self.product.name})'

    class Meta:
        verbose_name = 'фин.продукт брокера'
        verbose_name_plural = 'фин.продукты брокеров'

