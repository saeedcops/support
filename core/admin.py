from django.contrib import admin
from .models import *
# Category,Profile,Ticket

# Register your models here.

admin.site.register(Category)

admin.site.register(UserProfile)
admin.site.register(PC)
admin.site.register(Branch)
admin.site.register(Ticket)
admin.site.register(AdminProfile)
admin.site.register(Server)
admin.site.register(Permission)
admin.site.register(Share)
admin.site.register(Printer)
# admin.site.register(Department)
