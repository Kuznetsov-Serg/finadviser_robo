from django.urls import path
from .views import prediction_put, error_prediction_put

app_name = 'modelapp'

urlpatterns = [
    # path('api/prediction.put/<str:param_api>', prediction_put, name='prediction_put'),
    path('api/prediction.put/<str:sign>/', prediction_put, name='prediction_put'),
    path('error', error_prediction_put, name='error_prediction_put'),
]
