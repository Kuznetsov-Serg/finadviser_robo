from django.db import models
from django.conf import settings
from mainapp.models import Product

# Create your models here.

class Portfolio(models.Model):
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name='basket',
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
        return f'{self.user.get_full_name()} ({self.product.name})'

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
