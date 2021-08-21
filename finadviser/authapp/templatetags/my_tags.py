from django import template
from django.conf import settings

register = template.Library()

@register.filter(name='media_folder_users')
def media_folder_users(string):
    """
    Автоматически добавляет относительный URL-путь к медиафайлам пользователей
    users_avatars/user1.jpg --> /media/users_avatars/user1.jpg
    если это не является ссылкой в интернете http:// https:// и т.д.
    """
    if not string:
        string = 'users_avatars/default.jpg'
    elif string.name.find(':') != -1:
        return string
    return f'{settings.MEDIA_URL}{string}'


