from datetime import timedelta

from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.timezone import now

from django.db.models.signals import post_save
from django.dispatch import receiver


class InvestorUser(AbstractUser):
    avatar = models.ImageField(upload_to='users_avatars', blank=True, max_length=256)
    birthday = models.DateField(verbose_name='дата рождения', blank=True, null=True)
    activation_key = models.CharField(
        max_length=128,
        blank=True,
    )
    activation_key_expires = models.DateTimeField(
        default=(now() + timedelta(hours=48)),
    )

    def is_activation_key_expired(self):
        if now() <= self.activation_key_expires:
            return False
        else:
            return True

    class Meta:
        verbose_name = 'пользователь'
        verbose_name_plural = 'пользователи'

# ALTER DATABASE `finadviser`
# DEFAULT CHARACTER SET utf8mb4
# DEFAULT COLLATE utf8mb4_unicode_ci;
# ALTER TABLE finadviser.authapp_investoruserprofile MODIFY COLUMN about_me longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL;

class InvestorUserProfile(models.Model):
    MALE = 'M'
    FEMALE = 'W'
    GENDER_CHOICES = (
        (MALE, 'М'),
        (FEMALE, 'Ж'),
    )

    INVESTOR = 'I'
    TRADER = 'T'
    TYPE_USER_CHOICES = (
        (INVESTOR, 'ИНВЕСТОР'),
        (TRADER, 'ТРЕЙДЕР'),
    )

    user = models.OneToOneField(InvestorUser, unique=True, null=False, db_index=True, on_delete=models.CASCADE)
    tagline = models.CharField(verbose_name='теги', max_length=128, blank=True)
    about_me = models.TextField(verbose_name='о себе', max_length=512, blank=True)
    gender = models.CharField(verbose_name='пол', max_length=1, choices=GENDER_CHOICES, blank=True)
    type_user = models.CharField(verbose_name='тип пользователя', max_length=1, choices=TYPE_USER_CHOICES, blank=True)

    @receiver(post_save, sender=InvestorUser)
    def create_user_profile(sender, instance, created, **kwargs):
        if created:
            InvestorUserProfile.objects.create(user=instance)


    @receiver(post_save, sender=InvestorUser)
    def save_user_profile(sender, instance, **kwargs):
        instance.investoruserprofile.save()


# прогноз
# - наименование
# - цена
# - прогноз (0 +1 -1)
# - % для суммы капитала

# портфель
