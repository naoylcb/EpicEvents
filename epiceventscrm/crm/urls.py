from django.urls import path, include

from rest_framework.routers import DefaultRouter

from rest_framework_simplejwt.views import TokenObtainPairView

from . import views

app_name = 'crm'

router = DefaultRouter()
router.register(r'clients', views.ClientViewSet)
router.register(r'contracts', views.ContractViewSet)
router.register(r'events', views.EventViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('login/', TokenObtainPairView.as_view()),
]
