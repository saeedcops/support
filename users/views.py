import datetime
import json
from django.contrib.auth.models import User
from django.contrib import messages
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render, redirect
from django.views import View
from django.utils.timezone import now
from django.contrib.auth.decorators import login_required
from core.models import *
from django.core.paginator import Paginator
from django.views.generic import DetailView,CreateView
from django.shortcuts import get_object_or_404
from .forms import TicketCreateForm
from django.views.generic.edit import UpdateView
from django.views.generic.list import ListView
from core.util import link_user_pc
from notifications.signals import notify
from django.utils import translation
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.mixins import PermissionRequiredMixin,LoginRequiredMixin
# from django.contrib.auth.mixins import LoginRequiredMixin
# from django.contrib.auth.decorators import login_required


# PermissionRequiredMixin,
class Home(LoginRequiredMixin,View):
    login_url = '/auth/login'

    # permission_required= 'branch_change_branch'
    
    def get(self, request, *args, **kwargs):

        link_user_pc(request.META['HTTP_X_FORWARDED_FOR'],request.user)
        translation.activate(request.user.language)

        if request.user.is_staff:
        
            return redirect('admin')

        else:

            tickets = Ticket.objects.filter(user=request.user)
            paginator = Paginator(tickets, 6)
            page_number = request.GET.get('page')
            page_obj = Paginator.get_page(paginator, page_number)
            return render(request, 'user/index.html', {'tickets': tickets, 'page_obj': page_obj})


class Language(View):
    
    def get(self, request, *args, **kwargs):

        user= request.user

        if user.language=="en":
            user.language="ar"
            user.save()
        else:
            user.language="en"
            user.save()
        
        return redirect('ticket')


class Profile(LoginRequiredMixin,View):
    login_url = '/auth/login'
    def get(self,request):


        return redirect('user-profile',request.user.pk)


class ProfileUpdateView(LoginRequiredMixin,UpdateView):
    login_url = '/auth/login'
    model = User
    context_object_name = 'profile'
    fields =  ['image','first_name','email','phone']
    template_name = 'user/edit_profile.html'

    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.save()
        messages.success(self.request, _("Profile updated successfully!"))
        return redirect('user-profile',self.object.pk)


class ContactListView(LoginRequiredMixin,View):
    login_url = '/auth/login'
    def post(self,request):

        search_str = json.loads(request.body).get('searchText')
        department = json.loads(request.body).get('department')
        contact = User.objects.filter(first_name__istartswith=search_str) | \
                  User.objects.filter(department__istartswith=search_str)| \
                  User.objects.filter(phone__istartswith=search_str)


        data = contact.values()
        return JsonResponse(list(data), safe=False)


    def get(self,request):

        department = self.request.GET.get('department', "")

        if department != "":
            print("department",department)
            ctx= User.objects.filter(department=department).values()


            print("Data:",str(ctx.values()))
            data=ctx.values()
            return JsonResponse(list(data),safe=False)

        else:
            ctx= User.objects.all()
            dep= Department.objects.all()
            paginator = Paginator(ctx, 6)
            page_number = request.GET.get('page')
            page_obj = Paginator.get_page(paginator, page_number)
            return render(request, 'user/contacts.html', {'contacts': dep, 'page_obj': page_obj})




class TicketCreateView(LoginRequiredMixin,CreateView):
    login_url = '/auth/login'
    template_name = 'tickets/add.html'
    form_class = TicketCreateForm

    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.user = self.request.user
        self.object.pc=self.request.user.pc
        self.object.branch=self.request.user.branch
        self.object.save()
        messages.success(self.request, _("Ticket Added Successfully"))

        recipient = User.objects.filter(is_staff=True)
        notify.send(self.object.user, recipient=recipient, target=self.object,data="/tickets/"+str(self.object.pk),
                    verb=self.object.description, description=self.object.user.image)
        return redirect('ticket')

    def get_initial(self, *args, **kwargs):
        initial = super(TicketCreateView, self).get_initial(**kwargs)
        initial['description'] = ''
        return initial

    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(TicketCreateView, self).get_form_kwargs(*args, **kwargs)
        kwargs['user'] = self.request.user
        return kwargs


class RequestListView(LoginRequiredMixin,View):
    login_url = '/auth/login'
    def get(self, request, *args, **kwargs):

        requests=Request.objects.filter(user=self.request.user)
        paginator = Paginator(requests, 6)
        page_number = request.GET.get('page')
        page_obj = Paginator.get_page(paginator, page_number)
        return render(request, 'user/user_requests.html', {'requests': requests, 'page_obj': page_obj})


class RequestUpdateView(LoginRequiredMixin,UpdateView):
    login_url = '/auth/login'
    model = Request
    context_object_name = 'request'
    fields =  ['file_scan','category','branch']
    template_name = 'user/edit_request.html'

    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.save()
        messages.success(self.request, _("Request updated successfully!"))
        return redirect('requests')


class RequestCreateView(LoginRequiredMixin,CreateView):
    login_url = '/auth/login'
    model = Request
    context_object_name = 'request'
    fields =  ['file_scan','category','branch']
    template_name = 'user/create_request.html'

    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.user=self.request.user
        self.object.save()
        recipient = User.objects.filter(is_staff=True)
        notify.send(self.object.user, recipient=recipient, target=self.object,data="/admins/requests/"+str(self.object.pk),
                    verb=self.object.category, description=self.object.user.image)
        messages.success(self.request, _("Request created successfully!"))
        return redirect('requests')
