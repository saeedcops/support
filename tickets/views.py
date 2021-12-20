from django.shortcuts import render
from django.views import View
from core.models import *
from django.views.generic import DetailView,CreateView
from django.shortcuts import get_object_or_404
from django.contrib import messages
from django.utils.timezone import now
import datetime
import json
from django.http import JsonResponse, HttpResponse
from django.db.models import F
from django.views.generic.list import ListView
from notifications.signals import notify

from django.core.paginator import Paginator


class TicketListView(View):

    def get(self,request):
        
        if request.user.is_staff:
            # admin=AdminProfile.objects.get(user =self.request.user)

            ctx= Ticket.objects.all()
            branch= Branch.objects.all()
            category= Category.objects.all()
            paginator = Paginator(ctx, 10)
            page_number = request.GET.get('page')
            page_obj = Paginator.get_page(paginator, page_number)
            return render(request, 'admins/tickets.html', {'branch': branch,'category': category, 'page_obj': page_obj})




class TicketSearchView(View):

    def get(self,request):

        if request.user.is_staff:

            # category = self.request.GET.get('category', 'give-default-value')
            branch = self.request.GET.get('branch', 'give-default-value')
            print("Branch:",branch)
            ctx= Ticket.objects.filter(
                branch__name=branch).values(usern=F('user__username'),
                categoryn=F('category__name'),
                branchn=F('branch__name'),
                adminn=F('admin__username'))

            data=ctx.values()
           
            print("Data:",str(data))
            return JsonResponse(list(data),safe=False)
        else:
            print("Not admin")
            return JsonResponse()


    def post(self, request, *args, **kwargs):

        if request.user.is_staff:

            search_str = json.loads(request.body).get('searchText')
            ticket =Ticket.objects.filter(status__istartswith=search_str) | \
                    Ticket.objects.filter(user__username__istartswith=search_str) | \
                    Ticket.objects.filter(category__name__istartswith=search_str) | \
                    Ticket.objects.filter(branch__name__istartswith=search_str) | \
                    Ticket.objects.filter(description__icontains=search_str) | \
                    Ticket.objects.filter(open_date__istartswith=search_str)

            data = ticket.values(usern=F('user__username'),
                categoryn=F('category__name'),
                branchn=F('branch__name'),
                adminn=F('admin__username')).values()

            return JsonResponse(list(data), safe=False)



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
                    recipient = ticket.user
                    notify.send(request.user, recipient=recipient, target=ticket,data="/tickets/"+str(ticket.pk),
                                verb="تم حل المشكلة", description=request.user.image)

                    messages.success(self.request, "Ticket has been closed!")
                    return render(request, 'tickets/view_ticket_admin.html', {'ticket': ticket})

                msg=request.POST["message"]
                message=Message.objects.create(name=self.request.user.username,text=msg)
                ticket.messages.add(message)

                recipient = ticket.user
                notify.send(request.user, recipient=recipient, target=ticket,data="/tickets/"+str(ticket.pk),
                            verb=msg, description=request.user.image)

                messages.success(self.request, "Message Added Successfully")
                return render(request, 'tickets/view_ticket_admin.html', {'ticket': ticket})

            else:
                ticket.admin=self.request.user
                ticket.status="pending"
                ticket.save()
                messages.success(self.request, "Ticket Assigned to you!")
                return render(request, 'tickets/view_ticket_admin.html', {'ticket': ticket})

        else:
            if request.user==ticket.user:
                msg=request.POST["message"]
                message=Message.objects.create(sender=2,name=self.request.user.username,text=msg)
                ticket.messages.add(message)
                if ticket.admin:
                    recipient = ticket.admin
                    notify.send(request.user, recipient=recipient, target=ticket,data="/tickets/"+str(ticket.pk),
                                verb=msg, description=request.user.image)

                messages.success(self.request, "Message Added Successfully")
                return render(request, 'tickets/view_ticket.html', {'ticket': ticket})
                
            else:
                messages.error(self.request, "you dont have to comment in this ticket!")
                return render(request, 'tickets/view_ticket.html', {'ticket': ticket})


