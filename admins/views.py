import datetime
import json
from django.contrib import messages
from django.shortcuts import render, redirect
from django.views import View
from django.utils.timezone import now
from core.models import *
from django.core.paginator import Paginator
from django.views.generic.list import ListView
from django.http import JsonResponse
from django.db.models import F


class Home(View):

    def get(self,request):

        if request.user.is_staff:

            return render(request, 'admins/index.html')




class TicketListView(ListView):

    model = Ticket
    template_name = 'admins/tickets.html'
    # permission_classes = (permissions.IsAuthenticated,permissions.IsAdminUser,)
    context_object_name = 'tickets'
    paginate_by = 5  # if pagination is desired

    # def get_context_data(self, **kwargs):
    #     context = super().get_context_data(**kwargs)
    #     context['now'] = now()
    #     return context

# Create your views here.


class TicketJson(View):

    def get(self,request):


        if request.user.is_staff:

            category = self.request.GET.get('category', 'give-default-value')
            branch = self.request.GET.get('branch', 'give-default-value')
            print("Branch:",branch)
            ctx= Ticket.objects.filter(
                branch__name=branch,category__name=category).values(usern=F('user__name'),
                categoryn=F('category__name'),
                branchn=F('branch__name'),
                adminn=F('admin__name'))

            data=ctx.values()
            # paginator = Paginator(ctx.values(), 3)
            # page_number = request.GET.get('page')
            # page_obj = Paginator.get_page(paginator, page_number)
           
            print("Data:",str(data))
            return JsonResponse(list(data),safe=False)
        else:
            print("Not admin")
            return JsonResponse()


class ContactListView(View):


    def get(self,request):

        ctx= AdminProfile.objects.all()
        paginator = Paginator(ctx, 6)
        page_number = request.GET.get('page')
        page_obj = Paginator.get_page(paginator, page_number)
        return render(request, 'admins/contacts.html', {'contacts': ctx, 'page_obj': page_obj})


class Summary(View):

     def get(self,request):

         month_ago = now() - datetime.timedelta(days=30)
         data = {}
         admin_json={}
         category_json={}
         branch_json={}
         atickets = Ticket.objects.filter(closed_date__gte=month_ago, closed_date__lte=now())
         tickets = Ticket.objects.filter(open_date__gte=month_ago, open_date__lte=now())

         def get_admin(ticket):

             return ticket.admin

         def get_category(ticket):

             return ticket.category

         def get_branch(ticket):

             return ticket.branch

         admin_list = list(set(map(get_admin, atickets)))
         category_list = list(set(map(get_category, tickets)))
         branch_list = list(set(map(get_branch, tickets)))

         for admin in admin_list:

             filter_tickets = atickets.filter(admin=admin)
             admin_json[admin.name] = len(filter_tickets)

         for category in category_list:

             filter_tickets = tickets.filter(category=category)
             category_json[category.name] = len(filter_tickets)

         for branch in branch_list:

             filter_tickets = tickets.filter(branch=branch)
             branch_json[branch.name] = len(filter_tickets)

         data['admin']=admin_json
         data['category']=category_json
         data['branch']=branch_json

         return JsonResponse(data, safe=False)




class RequestListView(ListView):

    model = Request
    template_name = 'admins/user_requests.html'
    # permission_classes = (permissions.IsAuthenticated,permissions.IsAdminUser,)
    context_object_name = 'requests'
    paginate_by = 5  # if pagination is desired