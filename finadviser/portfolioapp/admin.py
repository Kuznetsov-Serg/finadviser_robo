from django.contrib import admin

# Register your models here.
from .models import Portfolio


@admin.register(Portfolio)
class ProductCategoryAdmin(admin.ModelAdmin):
    list_display = ("user", "product", "quantity", "is_active",)
    list_filter = ('user', 'is_active',)
