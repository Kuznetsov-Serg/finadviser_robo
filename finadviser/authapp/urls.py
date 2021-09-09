from django.urls import path, re_path
from .views import login, logout, register, edit, password, verify, telegram_login

app_name = 'authapp'

urlpatterns = [
    path('login/', login, name='login'),
    path('logout/', logout, name='logout'),
    path('register/', register, name='register'),
    path('edit/', edit, name='edit'),
    path('verify/<str:email>/<str:activation_key>/', verify, name='verify'),
    path('telegram_login/', telegram_login, name='telegram_login'),
]
