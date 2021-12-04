from django.shortcuts import render,redirect
from django.views.generic.list import ListView
from django.http import JsonResponse
from core.models import *
from django.views import View
from django.db.models import F
from django.views.generic.edit import UpdateView
from django.contrib import messages
import json
from django.core.paginator import Paginator

class PCUpdateView(UpdateView):
    model = PC
    context_object_name = 'pc'
    fields =  '__all__'
    template_name = 'datasheet/edit_pc.html'

    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.save()
        messages.success(self.request, "PC updated successfully!")
        return redirect('pc')



class ServerUpdateView(UpdateView):
    model = Server
    context_object_name = 'server'
    fields =  '__all__'
    template_name = 'datasheet/edit_server.html'

    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.save()
        messages.success(self.request, "Server updated successfully!")
        return redirect('pc')


class PrinterUpdateView(UpdateView):
    model = Printer
    context_object_name = 'printer'
    fields =  '__all__'
    template_name = 'datasheet/edit_printer.html'

    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.save()
        messages.success(self.request, "Printer updated successfully!")
        return redirect('pc')


class SwitchUpdateView(UpdateView):
    model = Switch
    context_object_name = 'switch'
    fields =  '__all__'
    template_name = 'datasheet/edit_switch.html'

    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.save()
        messages.success(self.request, "Switch updated successfully!")
        return redirect('pc')



class FirewallUpdateView(UpdateView):
    model = Firewall
    context_object_name = 'firewall'
    fields =  '__all__'
    template_name = 'datasheet/edit_firewall.html'

    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.save()
        messages.success(self.request, "Firewall updated successfully!")
        return redirect('pc')


class DVRUpdateView(UpdateView):
    model = DVR
    context_object_name = 'dvr'
    fields =  '__all__'
    template_name = 'datasheet/edit_dvr.html'

    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.save()
        messages.success(self.request, "DVR updated successfully!")
        return redirect('pc')


class FingerPrintUpdateView(UpdateView):
    model = FingerPrint
    context_object_name = 'fingerprint'
    fields =  '__all__'
    template_name = 'datasheet/edit_fingerprint.html'

    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.save()
        messages.success(self.request, "FingerPrint updated successfully!")
        return redirect('pc')


class PCListView(View):

    def get(self,request):

        if request.user.is_staff:
             
            admin=AdminProfile.objects.get(user =self.request.user)
            ctx= PC.objects.filter(branch=admin.branch)
            branch= Branch.objects.all()
            paginator = Paginator(ctx, 6)
            page_number = request.GET.get('page')
            page_obj = Paginator.get_page(paginator, page_number)
            return render(request, 'datasheet/index.html', {'branch': branch, 'page_obj': page_obj})


class DeviceListView(View):


    def post(self,request):

        if request.user.is_staff:

            search_str = json.loads(request.body).get('searchText')
            device = json.loads(request.body).get('device')

            if device == "PC":
                ctx= PC.objects.filter(host_name__istartswith=search_str) | \
                     PC.objects.filter(ip__istartswith=search_str) | \
                     PC.objects.filter(user__username__istartswith=search_str) | \
                     PC.objects.filter(branch__name__istartswith=search_str)

                data=ctx.values(name=F('branch__name'),username=F('user__username')).values()

            elif device == "Servers":
                ctx= Server.objects.filter(host_name__istartswith=search_str) | \
                     Server.objects.filter(ip__istartswith=search_str) | \
                     Server.objects.filter(role__istartswith=search_str) | \
                     Server.objects.filter(branch__name__istartswith=search_str)

                data=ctx.values(name=F('branch__name')).values()

            elif device == "Printers":
                ctx= Printer.objects.filter(model__istartswith=search_str) | \
                     Printer.objects.filter(ip__istartswith=search_str) | \
                     Printer.objects.filter(role__istartswith=search_str) | \
                     Printer.objects.filter(branch__name__istartswith=search_str)

                data=ctx.values(name=F('branch__name')).values()

            elif device == "Switches":
                ctx= Switch.objects.filter(model__istartswith=search_str) | \
                     Switch.objects.filter(ip__istartswith=search_str) | \
                     Switch.objects.filter(host_name__istartswith=search_str) | \
                     Switch.objects.filter(branch__name__istartswith=search_str)

                data=ctx.values(name=F('branch__name')).values()

            elif device == "Firewall":
                ctx= Firewall.objects.filter(model__istartswith=search_str) | \
                     Firewall.objects.filter(ip__istartswith=search_str) | \
                     Firewall.objects.filter(host_name__istartswith=search_str) | \
                     Firewall.objects.filter(branch__name__istartswith=search_str)

                data=ctx.values(name=F('branch__name')).values()

            elif device == "DVR":
                ctx= DVR.objects.filter(model__istartswith=search_str) | \
                     DVR.objects.filter(ip__istartswith=search_str) | \
                     DVR.objects.filter(host_name__istartswith=search_str) | \
                     DVR.objects.filter(branch__name__istartswith=search_str)

                data=ctx.values(name=F('branch__name')).values()

            elif device == "Fingerprint":
                ctx= FingerPrint.objects.filter(model__istartswith=search_str) | \
                     FingerPrint.objects.filter(ip__istartswith=search_str) | \
                     FingerPrint.objects.filter(location__istartswith=search_str) | \
                     FingerPrint.objects.filter(branch__name__istartswith=search_str)

                data=ctx.values(name=F('branch__name')).values()

            print("Data:",str(ctx.values()))
            # data=ctx.values(name=F('branch__name')).values()
            return JsonResponse(list(data),safe=False)
        else:
            return JsonResponse()




    def get(self,request):

        if request.user.is_staff:

            device = self.request.GET.get('device', 'give-default-value')
            branch = self.request.GET.get('branch', 'give-default-value')
            print("device",device)
            print("branch",branch)
            ctx= Server.objects.filter(branch__name=branch).values(name=F('branch__name'))

            if device == "PC":
                ctx= PC.objects.filter(branch__name=branch).values(name=F('branch__name'),username=F('user__username'))

            elif device == "Servers":

                ctx= Server.objects.filter(branch__name=branch).values(name=F('branch__name'))
            elif device == "Printers":

                ctx= Printer.objects.filter(branch__name=branch).values(name=F('branch__name'))

            elif device == "Switches":
                ctx= Switch.objects.filter(branch__name=branch).values(name=F('branch__name'))

            elif device == "Firewall":
                ctx= Firewall.objects.filter(branch__name=branch).values(name=F('branch__name'))

            elif device == "DVR":
                ctx= DVR.objects.filter(branch__name=branch).values(name=F('branch__name'))

            elif device == "Fingerprint":
                ctx= FingerPrint.objects.filter(branch__name=branch).values(name=F('branch__name'))

            print("Data:",str(ctx.values()))
            # print("Branch:",str(ctx[0].branch))
            # print("branch",str(ctx[0].branch_id))
            data=ctx.values()
            return JsonResponse(list(data),safe=False)
        else:
            return JsonResponse()


class PrinterListView(ListView):

    model = Printer
    template_name = 'datasheet/index.html'
    # permission_classes = (permissions.IsAuthenticated,permissions.IsAdminUser,)
    context_object_name = 'pc'
    paginate_by = 5  # if pagination is desired