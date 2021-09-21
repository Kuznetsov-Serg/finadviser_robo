from django.db import models
from django.conf import settings
from mainapp.models import ProductCategory, Product

# Create your models here.
from tgbot.models import User


class Portfolio(models.Model):
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
    )
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
    )
    quantity = models.PositiveIntegerField(
        verbose_name='количество',
        default=0,
    )
    is_active = models.BooleanField(
        verbose_name='активна',
        default=True,
    )

    def __str__(self):
        return f'{self.user} ({self.product.name})'

    class Meta:
        verbose_name = 'портфель'
        verbose_name_plural = 'портфель'

    @property
    def category(self):
        return f'{self.product.category}'

    @property
    def total_quantity(self):
        items = Portfolio.objects.filter(user=self.user, is_active=True)
        totalquantity = sum(list(map(lambda x: x.quantity, items)))
        return totalquantity

    # @property
    # def total_cost(self):
    #     items = Basket.objects.filter(user=self.user)
    #     totalcost = sum(list(map(lambda x: x.product_cost, items)))
    #     return totalcost
