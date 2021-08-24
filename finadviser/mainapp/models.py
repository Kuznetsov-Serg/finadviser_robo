from django.db import models

# Create your models here.
class ProductCategory(models.Model):
    name = models.CharField(
        verbose_name='наименование',
        unique=True,
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
    is_active = models.BooleanField(
        verbose_name='активна',
        default=True
    )
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'категория'
        verbose_name_plural = 'категории'

class Product(models.Model):
    category = models.ForeignKey(
        ProductCategory,
        on_delete=models.CASCADE,
        verbose_name='категория',
    )
    name = models.CharField(
        verbose_name='наименование фин.продукта',
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
    is_active = models.BooleanField(
        verbose_name='активный',
        default=True
    )

    def __str__(self):
        return f'{self.name} ({self.category.name})'

    class Meta:
        verbose_name = 'фин.продукт'
        verbose_name_plural = 'фин.продукты'



