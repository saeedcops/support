
from django.urls import path
from . views import *

from django.views.decorators.csrf import csrf_exempt
urlpatterns = [
    path('', PCListView.as_view(),name='pc'),
    path('PC/<int:pk>/', PCUpdateView.as_view(),name='update_pc'),
    path('Servers/<int:pk>/', ServerUpdateView.as_view(),name='update_server'),
    path('Printers/<int:pk>/', PrinterUpdateView.as_view(),name='update_printer'),
    path('Network/<int:pk>/', NetworkUpdateView.as_view(),name='update_network'),
    # path('Switches/<int:pk>/', SwitchUpdateView.as_view(),name='update_switch'),
    # path('Firewall/<int:pk>/', FirewallUpdateView.as_view(),name='update_firewall'),
    # path('DVR/<int:pk>/', DVRUpdateView.as_view(),name='update_dvr'),
    # path('Fingerprint/<int:pk>/', FingerPrintUpdateView.as_view(),name='update_fingerprint'),

    
    path('upload/', UploadView.as_view(),name='upload'),
    path('devices/', csrf_exempt(DeviceListView.as_view()),name='servers'),
    path('printers/', PrinterListView.as_view(),name='printers'),
]