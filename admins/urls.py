
from django.urls import path,include
from . views import *
from django.views.decorators.csrf import csrf_exempt
urlpatterns = [
    path('', Home.as_view(),name='admin'),
    # path('tickets/', TicketListView.as_view(),name='admin-tickets'),
    # path('tickets-json/', TicketJson.as_view(),name='tickets-json'),
    path('requests-json/', csrf_exempt(RequestJson.as_view()),name='requests-json'),
    path('admin-summary/', Summary.as_view(),name='admin-summary'),
    path('contacts/', ContactListView.as_view(),name='admins-contacts'),
    path('requests/', RequestListView.as_view(),name='admin-requests'),
    path('requests/<int:pk>/', RequestUpdateView.as_view(),name='edit-requests'),
    path('profile/', Profile.as_view(),name='profiles'),
    path('profile/<int:pk>/', ProfileUpdateView.as_view(),name='admin-profile'),
    path('datasheet/', include('datasheet.urls')),

]