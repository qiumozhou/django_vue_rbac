from django.contrib import admin

# Register your models here.
from rbac.models import User, Menu, Role, Permission

admin.site.register(User)
admin.site.register(Menu)
admin.site.register(Role)
admin.site.register(Permission)