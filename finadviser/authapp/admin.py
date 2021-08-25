from django.contrib import admin
from .models import InvestorUser, InvestorUserProfile

# admin.site.register(ShopUser)
@admin.register(InvestorUser)
class InvestorUserAdmin(admin.ModelAdmin):
    list_display = ("username", "first_name", "last_name",)
    list_filter = ('is_active', 'is_staff', 'is_superuser')

@admin.register(InvestorUserProfile)
class InvestorUserProfileAdmin(admin.ModelAdmin):
    list_display = ("user", "type_user")
    # list_filter = ('is_active', 'is_staff', 'is_superuser')
