from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.reverse import reverse

from .models import Client, Contract, Event
from .serializers import (
    ClientSerializer,
    ContractSerializer,
    EventSerializer,
)


class ClientView(APIView):
    permission_classes = [IsAuthenticated]
    
    def get(self, request, format=None):
        clients = Client.objects.all()
        serializer = ClientSerializer(clients, many=True)
        return Response(serializer.data)


class ContractView(APIView):
    permission_classes = [IsAuthenticated]
    
    def get(self, request, format=None):
        contracts = Contract.objects.all()
        serializer = ContractSerializer(contracts, many=True)
        return Response(serializer.data)


class EventView(APIView):
    permission_classes = [IsAuthenticated]
    
    def get(self, request, format=None):
        events = Event.objects.all()
        serializer = EventSerializer(events, many=True)
        return Response(serializer.data)
