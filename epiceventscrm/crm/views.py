from rest_framework.permissions import IsAuthenticated

from .models import Client, Contract, Event
from .serializers import (
    ClientSerializer,
    ContractSerializer,
    EventSerializer,
)
from .permissions import CanEditClientOrContract, CanAdd, CanEditEvent

from rest_framework import viewsets


class ClientViewSet(viewsets.ModelViewSet):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer
    permission_classes = [IsAuthenticated, CanAdd, CanEditClientOrContract]


class ContractViewSet(viewsets.ModelViewSet):
    queryset = Contract.objects.all()
    serializer_class = ContractSerializer
    permission_classes = [IsAuthenticated, CanAdd, CanEditClientOrContract]


class EventViewSet(viewsets.ModelViewSet):
    queryset = Event.objects.all()
    serializer_class = EventSerializer
    permission_classes = [IsAuthenticated, CanAdd, CanEditEvent]
