
from django.urls import path
from . views import *

from django.views.decorators.csrf import csrf_exempt
urlpatterns = [
    path('', PCListView.as_view(),name='pc'),
    path('PC/<int:pk>/', PCUpdateView.as_view(),name='update_pc'),
    path('Servers/<int:pk>/', ServerUpdateView.as_view(),name='update_server'),
    path('Printers/<int:pk>/', PrinterUpdateView.as_view(),name='update_printer'),
    path('devices/', DeviceListView.as_view(),name='servers'),
    path('printers/', PrinterListView.as_view(),name='printers'),
]