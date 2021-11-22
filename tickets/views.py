from django.shortcuts import render
from django.views import View
from core.models import *
from django.views.generic import DetailView,CreateView
from django.shortcuts import get_object_or_404
from django.contrib import messages
from django.utils.timezone import now
import datetime

class TicketDetailView(View):
    
    def get(self, request, *args, **kwargs):

        ticket =Ticket.objects.get(pk=self.kwargs.get("id"))

        if request.user.is_staff:
        
            return render(request, 'tickets/view_ticket_admin.html', {'ticket': ticket})

        else:

            return render(request, 'tickets/view_ticket.html', {'ticket': ticket})



    def post(self, request, *args, **kwargs):
        ticket =Ticket.objects.get(pk=self.kwargs.get("id"))

        print(str(self.request.user.username))

        if request.user.is_staff:
            if ticket.admin:

                if 'message' not in request.POST:
                    ticket.status="closed"
                    ticket.closed_date=datetime.datetime.now()
                    ticket.save()
                    messages.success(self.request, "Ticket has been closed!")
                    return render(request, 'tickets/view_ticket_admin.html', {'ticket': ticket})

                msg=request.POST["message"]
                message=Message.objects.create(name=self.request.user.username,text=msg)
                ticket.messages.add(message)
                messages.success(self.request, "Message Added Successfully")
                return render(request, 'tickets/view_ticket_admin.html', {'ticket': ticket})

            else:
                ticket.admin=AdminProfile.objects.get(user=self.request.user)
                ticket.status="pending"
                ticket.save()
                messages.success(self.request, "Ticket Assigned to you!")
                return render(request, 'tickets/view_ticket_admin.html', {'ticket': ticket})

        else:
            if request.user==ticket.user.user:
                msg=request.POST["message"]
                message=Message.objects.create(sender=2,name=self.request.user.username,text=msg)
                ticket.messages.add(message)
                messages.success(self.request, "Message Added Successfully")
                return render(request, 'tickets/view_ticket.html', {'ticket': ticket})
                
            else:
                messages.error(self.request, "you dont have to comment in this ticket!")
                return render(request, 'tickets/view_ticket.html', {'ticket': ticket})


