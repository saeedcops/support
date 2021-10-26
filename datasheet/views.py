from django.shortcuts import render
from django.views.generic.list import ListView
from core.models import *

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


class ServerListView(ListView):

    model = Server
    template_name = 'datasheet/index.html'
    # permission_classes = (permissions.IsAuthenticated,permissions.IsAdminUser,)
    context_object_name = 'pc'
    paginate_by = 5  # if pagination is desired


class PrinterListView(ListView):

    model = Printer
    template_name = 'datasheet/index.html'
    # permission_classes = (permissions.IsAuthenticated,permissions.IsAdminUser,)
    context_object_name = 'pc'
    paginate_by = 5  # if pagination is desired