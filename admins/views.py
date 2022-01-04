import datetime
import json
from django.contrib import messages
from django.shortcuts import render, redirect
from django.views import View
from django.utils.timezone import now
from core.models import *
from django.core.paginator import Paginator
from django.views.generic.list import ListView
from django.views.generic.edit import UpdateView
from django.http import JsonResponse
from django.db.models import F
from django.conf import settings
from notifications.signals import notify
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.mixins import PermissionRequiredMixin,LoginRequiredMixin


class Home(LoginRequiredMixin,View):
    login_url = '/auth/login'

    def get(self,request):

        if request.user.is_staff:


            return render(request, 'admins/index.html')


class Profile(LoginRequiredMixin,View):
    login_url = '/auth/login'

    def get(self,request):

        if request.user.is_staff:

            return redirect('admin-profile',request.user.pk)


class ProfileUpdateView(LoginRequiredMixin,UpdateView):
    login_url = '/auth/login'

    model = User
    context_object_name = 'profile'
    fields =  fields =  ['image','first_name','email','phone']
    template_name = 'admins/edit_profile.html'

    def form_valid(self, form):
        if self.request.user.pk == self.object.pk:
            self.object = form.save(commit=False)
            self.object.save()
            messages.success(self.request, _("Profile updated successfully!"))
            return redirect('admin-profile',self.object.pk)
        else:
            messages.error(self.request, self.request.user.username+_(" You dont have permission to do this!"))
            return redirect('user-profile',self.object.pk)



class RequestJson(LoginRequiredMixin,View):
    login_url = '/auth/login'

    def post(self,request):

        if request.user.is_staff:

            search_str = json.loads(request.body).get('searchText')
            ctx =Request.objects.filter(branch__name__istartswith=search_str) | \
                    Request.objects.filter(user__first_name__istartswith=search_str) | \
                    Request.objects.filter(category__name__istartswith=search_str)

            data=ctx.values(usern=F('user__first_name'),
                            categoryn=F('category__name'),
                            branchn=F('branch__name')).values()

            return JsonResponse(list(data),safe=False)
        else:
            print("Not admin")
            return JsonResponse()


    def get(self,request):
        print("ot admin")

        if request.user.is_staff:
            print(" admin")

            branch = self.request.GET.get('branch', 'give-default-value')
            
            ctx= Request.objects.filter(
                branch__name=branch).values(usern=F('user__first_name'),
                                            categoryn=F('category__name'),
                                            branchn=F('branch__name'))

            data=ctx.values()

            return JsonResponse(list(data),safe=False)
        else:
            print("Not admin")
            return JsonResponse()


class ContactListView(LoginRequiredMixin,View):
    login_url = '/auth/login'


    def get(self,request):        

        ctx= User.objects.all()
        dep= Department.objects.all()
        paginator = Paginator(ctx, 6)
        page_number = request.GET.get('page')
        page_obj = Paginator.get_page(paginator, page_number)
        return render(request, 'admins/contacts.html', {'contacts': dep, 'page_obj': page_obj})


class Summary(LoginRequiredMixin,View):
    login_url = '/auth/login'

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
            admin_json[admin.username] = len(filter_tickets)

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




class RequestListView(LoginRequiredMixin,View):
    login_url = '/auth/login'


    def get(self,request):

        ctx= Request.objects.all()
        branch= Branch.objects.all()
        paginator = Paginator(ctx, 6)
        page_number = request.GET.get('page')
        page_obj = Paginator.get_page(paginator, page_number)
        return render(request, 'admins/user_requests.html', {'branch': branch, 'page_obj': page_obj})


class RequestUpdateView(LoginRequiredMixin,UpdateView):
    login_url = '/auth/login'

    model = Request
    context_object_name = 'requests'
    fields =  '__all__'
    template_name = 'admins/edit_request.html'

    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.save()

        if self.object.valid:

            recipient = self.object.user
            notify.send(self.request.user, recipient=recipient, target=self.object,data="/img/"+str(self.object.file_scan),
                        verb="تم تفعيل الصلاحيات", description=self.request.user.image)

        messages.success(self.request, _("Request updated successfully!"))
        return redirect('admin-requests')

