
from django.urls import path
from . views import *
from django.views.decorators.csrf import csrf_exempt
urlpatterns = [
    # path('', index,name='ticket'),
    path('', Home.as_view(),name='ticket'),
    # path('add-ticket/', add_ticket,name='add-ticket'),
    path('add-ticket/', TicketCreateView.as_view(),name='add-ticket'),
    path('contacts/', ContactListView.as_view(),name='contacts'),
     path('requests/', RequestCreateView.as_view(),name='requests'),
    path('permission/<int:id>', PermissionDetailView.as_view(),name='permission'),
    
]