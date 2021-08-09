from django.urls import path

from rest_framework_simplejwt.views import TokenObtainPairView

from . import views

app_name = 'crm'

urlpatterns = [
    path('login/', TokenObtainPairView.as_view()),
    path('clients/', views.ClientView.as_view(), name='clients'),
    path('contracts/', views.ContractView.as_view(), name='contracts'),
    path('events/', views.EventView.as_view(), name='events'),
]
