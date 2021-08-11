from django.contrib.auth.models import User
from django.core.exceptions import ValidationError

from rest_framework import status
from rest_framework.response import Response
from rest_framework.generics import get_object_or_404


def serialize(serializer, data, obj=None):
    """Serialize in the database."""
    serializer = serializer(obj, data=data) if obj else serializer(data=data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


def validate_sales_contact(value):
    contact = get_object_or_404(User, username=value)
    if contact.groups.filter(name='support_team').exists():
        raise ValidationError((f'{contact} n\'est pas dans l\'équipe de vente.'),
                              params={'value': value})
    

def validate_support_contact(value):
    contact = get_object_or_404(User, username=value)
    if contact.groups.filter(name='sales_team').exists():
        raise ValidationError((f'{contact} n\'est pas dans l\'équipe de support.'),
                              params={'value': value})
