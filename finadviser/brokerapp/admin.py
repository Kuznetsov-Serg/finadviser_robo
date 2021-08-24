from django.contrib import admin

# Register your models here.
from .models import Broker, BrokerProduct


@admin.register(Broker)
class BrokerAdmin(admin.ModelAdmin):
    list_display = ("name", "short_desc", "is_active",)
    list_filter = ('is_active',)

# admin.site.register(BrokerProduct)
@admin.register(BrokerProduct)
class BrokerProductAdmin(admin.ModelAdmin):
    list_display = ("broker", "product", "is_active",)
    list_filter = ('broker', 'is_active',)