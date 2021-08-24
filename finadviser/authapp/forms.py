import hashlib

from django import forms
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm, UserChangeForm, PasswordChangeForm
import random

from .models import InvestorUser, InvestorUserProfile


class InvestorUserLoginForm(AuthenticationForm):
    class Meta:
        model = InvestorUser
        fields = ('username', 'password')

    def __init__(self, *args, **kwargs):
        super(InvestorUserLoginForm, self).__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'


class InvestorUserRegisterForm(UserCreationForm):
    class Meta:
        model = InvestorUser
        fields = ('username', 'first_name', 'last_name', 'password1', 'password2', 'email', 'birthday', 'avatar')

    def __init__(self, *args, **kwargs):
        super(InvestorUserRegisterForm, self).__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'

    def clean_age(self):
        data = self.cleaned_data['age']
        if data < 18:
            raise forms.ValidationError("Вы слишком молоды!")
        return data

    def save(self):
        user = super(InvestorUserRegisterForm, self).save()
        user.is_active = False
        salt = hashlib.sha1(str(random.random()).encode('utf8')).hexdigest()[:6]
        user.activation_key = hashlib.sha1((user.email + salt).encode('utf8')).hexdigest()
        user.save()
        return user


class InvestorUserCreateForm(UserCreationForm):
    class Meta:
        model = InvestorUser
        fields = ('username', 'first_name', 'last_name', 'password1', 'password2', 'email', 'birthday', 'avatar', 'is_staff')

    def __init__(self, *args, **kwargs):
        super(InvestorUserCreateForm, self).__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'

    def clean_age(self):
        data = self.cleaned_data['age']
        if data < 18:
            raise forms.ValidationError("Вы слишком молоды!")
        return data


class InvestorUserEditForm(UserChangeForm):
    class Meta:
        model = InvestorUser
        fields = ('username', 'first_name', 'last_name', 'email', 'birthday', 'avatar', 'password')

    def __init__(self, *args, **kwargs):
        super(InvestorUserEditForm, self).__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'

    def clean_age(self):
        data = self.cleaned_data['age']
        if data < 18:
            raise forms.ValidationError("Вы слишком молоды!")
        return data


class InvestorUserProfileEditForm(forms.ModelForm):
    class Meta:
        model = InvestorUserProfile
        fields = ('tagline', 'about_me', 'gender', 'type_user')

    def __init__(self, *args, **kwargs):
        super(InvestorUserProfileEditForm, self).__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'


class InvestorUserChangePasswordForm(UserCreationForm):
# class InvestorUserChangePasswordForm(PasswordChangeForm):
    class Meta:
        model = InvestorUser
        fields = ('password1', 'password2')

    def __init__(self, *args, **kwargs):
        super(InvestorUserChangePasswordForm, self).__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
