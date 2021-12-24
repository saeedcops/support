
from django.urls import path
from . views import *
from django.views.decorators.csrf import csrf_exempt
urlpatterns = [
    # path('', index,name='ticket'),
    path('', Home.as_view(),name='ticket'),
    # path('add-ticket/', add_ticket,name='add-ticket'),
    path('language/', Language.as_view(),name='language'),
    path('add-ticket/', TicketCreateView.as_view(),name='add-ticket'),
    path('contacts/',csrf_exempt( ContactListView.as_view()),name='contacts'),
    path('requests/', RequestListView.as_view(),name='requests'),
    path('requests/<int:pk>/', RequestUpdateView.as_view(),name='user-requests'),
    path('requests/create/', RequestCreateView.as_view(),name='create-request'),
    path('profile/', Profile.as_view(),name='profile'),
    path('profile/<int:pk>/', ProfileUpdateView.as_view(),name='user-profile'),
    
]