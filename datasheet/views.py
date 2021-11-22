from django.shortcuts import render,redirect
from django.views.generic.list import ListView
from django.http import JsonResponse
from core.models import *
from django.views import View
from django.db.models import F
from django.views.generic.edit import UpdateView
from django.contrib import messages

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


class PCListView(ListView):
    model = PC
    template_name = 'datasheet/index.html'
    # permission_classes = (permissions.IsAuthenticated,permissions.IsAdminUser,)
    context_object_name = 'pc'
    paginate_by = 5  # if pagination is desired

    def get_queryset(self):
        admin=AdminProfile.objects.get(user =self.request.user)
        new_context = PC.objects.filter(
            branch=admin.branch,
        )
        return new_context


class DeviceListView(View):

    # model = Server
    # template_name = 'datasheet/index.html'
    # # permission_classes = (permissions.IsAuthenticated,permissions.IsAdminUser,)
    # context_object_name = 'pc'
    # paginate_by = 5  # if pagination is desired

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