from django.contrib import admin
from .models import Model, Prediction, Signal


# Register your models here.

@admin.register(Model)
class ModelAdmin(admin.ModelAdmin):
    list_display = ('name', 'short_desc', 'is_active',)
    list_filter = ('is_active',)

@admin.register(Signal)
class SignalAdmin(admin.ModelAdmin):
    list_display = ('name', 'is_active',)
    list_filter = ('is_active',)
    ordering = ('-is_active', 'name',)

@admin.register(Prediction)
class PredictionAdmin(admin.ModelAdmin):
    list_display = ('model', 'product', 'date', 'signal', 'percent')
    list_filter = ('model', 'product',)
    ordering = ('-date', 'model', 'product',)