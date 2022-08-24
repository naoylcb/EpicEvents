from django.contrib import admin

from .models import Client, Contract, Event

# Admin site for superuser (management team).
admin.site.register(Client)
admin.site.register(Contract)
admin.site.register(Event)


# Admin site for staff (sales team and support team).
class StaffAdminArea(admin.AdminSite):
    site_header = 'Epic Events CRM'
    index_title = 'Site d\'administration du staff d\'Epic Events'


staff_admin_site = StaffAdminArea(name='StaffAdminCrm')


@admin.register(Client, Contract, Event, site=staff_admin_site)
class StaffAdmin(admin.ModelAdmin):

    def has_add_permission(self, request):
        return request.user.groups.filter(name='sales_team').exists()

    def has_change_permission(self, request, obj=None):
        if type(obj) is Client and obj.sales_contact == request.user:
            return True
        elif type(obj) is Contract and obj.sales_contact == request.user:
            return True
        elif type(obj) is Event:
            if (obj.client.sales_contact == request.user
                    or obj.support_contact == request.user):
                return True

        return False
