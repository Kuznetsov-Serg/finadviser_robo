from django.contrib import admin

# Register your models here.
from .models import ProductCategory, Product

# admin.site.register(ProductCategory)
# admin.site.register(Product)

@admin.register(ProductCategory)
class ProductCategoryAdmin(admin.ModelAdmin):
    list_display = ("name", "short_desc", "is_active",)
    list_filter = ('is_active',)

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ("category", "name", "short_desc", "is_active")
    list_filter = ('category', 'is_active')
