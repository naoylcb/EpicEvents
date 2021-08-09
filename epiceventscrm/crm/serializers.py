from django.contrib.auth.models import User

from rest_framework import serializers

from .models import Client, Contract, Event


class ClientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Client
        fields = ['first_name', 'last_name', 'email', 'phone', 'mobile',
                  'company_name', 'sales_contact', 'existing']


class ContractSerializer(serializers.ModelSerializer):
    class Meta:
        model = Contract
        fields = ['sales_contact', 'client', 'status', 'amount', 'payment_due']


class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = ['client', 'support_contact', 'event_status', 'attendees', 'event_date', 'notes']
