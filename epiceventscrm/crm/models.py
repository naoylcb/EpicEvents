from django.db import models
from django.conf import settings

from .utils import validate_sales_contact, validate_support_contact


class Client(models.Model):
    first_name = models.CharField(max_length=25)
    last_name = models.CharField(max_length=25)
    email = models.EmailField(max_length=100)
    phone = models.CharField(max_length=20)
    mobile = models.CharField(max_length=20)
    company_name = models.CharField(max_length=250)
    sales_contact = models.ForeignKey(to=settings.AUTH_USER_MODEL, on_delete=models.DO_NOTHING,
                                      validators=[validate_sales_contact])
    existing = models.BooleanField(default=False)
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)


class Contract(models.Model):
    sales_contact = models.ForeignKey(to=settings.AUTH_USER_MODEL, on_delete=models.DO_NOTHING,
                                      validators=[validate_sales_contact])
    client = models.ForeignKey(to=Client, on_delete=models.DO_NOTHING)
    status = models.BooleanField(default=False)
    amount = models.FloatField()
    payment_due = models.DateTimeField()
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)


class Event(models.Model):
    client = models.ForeignKey(to=Client, on_delete=models.DO_NOTHING)
    support_contact = models.ForeignKey(to=settings.AUTH_USER_MODEL, on_delete=models.DO_NOTHING,
                                        validators=[validate_support_contact])
    event_completed = models.BooleanField(default=False)
    attendees = models.IntegerField()
    event_date = models.DateTimeField()
    notes = models.TextField()
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)
