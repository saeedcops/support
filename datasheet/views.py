from django.shortcuts import render
from django.views.generic.list import ListView
from django.http import JsonResponse
from core.models import *
from django.views import View
from django.db.models import F

class PCListView(ListView):

    model = PC
    template_name = 'datasheet/index.html'
    # permission_classes = (permissions.IsAuthenticated,permissions.IsAdminUser,)
    context_object_name = 'pc'
    paginate_by = 5  # if pagination is desired

    # def get_queryset(self):
    #     filter_val = self.request.GET.get('filter', 'give-default-value')
    #     order = self.request.GET.get('orderby', 'give-default-value')
    #     new_context = Update.objects.filter(
    #         state=filter_val,
    #     ).order_by(order)
    #     return new_context


class DeviceListView(View):

    # model = Server
    # template_name = 'datasheet/index.html'
    # # permission_classes = (permissions.IsAuthenticated,permissions.IsAdminUser,)
    # context_object_name = 'pc'
    # paginate_by = 5  # if pagination is desired

    def get(self,request):

        if True or request.user.is_staff:

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
                pass

            elif device == "Firewall":
                pass

            elif device == "DVR":
                pass

            elif device == "Fingerprint":
                pass

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