from rest_framework import permissions


class CanAdd(permissions.BasePermission):
    """
    Permission to only allow sales team and admins to add an object.
    """
    def has_permission(self, request, view):        
        if request.method == 'POST':
            if request.user.groups.filter(name='support_team').exists():
                return False
        
        return True


class CanEditClientOrContract(permissions.BasePermission):
    """
    Permission to only allow sales contact and admins to edit a client or a contract.
    Permission to only allow admins to delete a client or a contract.
    """
    def has_object_permission(self, request, view, obj):        
        if request.method in ['PUT', 'PATCH']:
            return obj.sales_contact == request.user or request.user.is_superuser
        
        if request.method == 'DELETE':
            return request.user.is_superuser
        
        return True


class CanEditEvent(permissions.BasePermission):
    """
    Permission to only allow support contact/sales contact of client/admins to edit an event.
    Permission to only allow admins to delete an event.
    """
    def has_object_permission(self, request, view, obj):        
        if request.method in ['PUT', 'PATCH']:
            return obj.support_contact == request.user or obj.client.sales_contact == request.user or request.user.is_superuser
        
        if request.method == 'DELETE':
            return request.user.is_superuser
        
        return True