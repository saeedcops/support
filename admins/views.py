import datetime
import json

from django.contrib import messages
from django.shortcuts import render, redirect
from django.views import View
from django.utils.timezone import now
from core.models import Category, Ticket, UserProfile,AdminProfile
from django.core.paginator import Paginator
from django.views.generic.list import ListView


class TicketListView(ListView):

    model = Ticket
    template_name = 'admins/index.html'
    # permission_classes = (permissions.IsAuthenticated,permissions.IsAdminUser,)
    context_object_name = 'tickets'
    paginate_by = 5  # if pagination is desired

    # def get_context_data(self, **kwargs):
    #     context = super().get_context_data(**kwargs)
    #     context['now'] = now()
    #     return context

# Create your views here.
def index(request):
    print("User: ",str(request.user))
    print("META: ",str(request.META['HTTP_X_FORWARDED_FOR']))
    print("body: ",str(request.body))
  
    if request.user.is_staff:
        tickets = Ticket.objects.all()
        paginator = Paginator(tickets, 6)
        page_number = request.GET.get('page')
        page_obj = Paginator.get_page(paginator, page_number)
        return render(request, 'admin/index.html', {'tickets': tickets, 'page_obj': page_obj})

    return render(request, 'tickets/home.html')