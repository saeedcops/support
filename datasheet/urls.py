
from django.urls import path
from . views import *

from django.views.decorators.csrf import csrf_exempt
urlpatterns = [
    path('', PCListView.as_view(),name='pc'),
    path('servers/', ServerListView.as_view(),name='servers'),
    path('printers/', PrinterListView.as_view(),name='printers'),
]