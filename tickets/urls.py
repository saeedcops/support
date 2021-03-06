
from django.urls import path,include
from . views import *
# ,add_expenses,edit_expenses,delete_expenses,search_expenses,expenses_summary,summary_status,expenses_csv
# ,add_expenses,edit_expenses,delete_expenses,search_expenses,expenses_summary,summary_status,expenses_csv
from django.views.decorators.csrf import csrf_exempt
urlpatterns = [
    path('<int:id>/', TicketDetailView.as_view(),name='view_ticket'),
    path('search/',csrf_exempt(TicketSearchView.as_view()),name='ticket_search'),
    path('', TicketListView.as_view(),name='admin-tickets'),
    #  path('add-message/', CreateMessage.as_view(),name='add-message'),
    # path('datasheet/', include('datasheet.urls')),
    # path('', index,name='admins'),
    # path('add-ticket/', add_ticket,name='add-ticket'),
    # path('edit-ticket/<int:id>', edit_ticket,name='edit-ticket'),
    # path('delete-expenses/<int:id>', delete_expenses,name='delete-expenses'),
    # path('search-expenses/',csrf_exempt( search_expenses),name='search-expenses'),
    # path('summary-expenses/', expenses_summary,name='summary-expenses'),
    # path('summary_status-expenses/',csrf_exempt( summary_status),name='summary_status'),
    # path('csv-tickets/', tickets_csv,name='csv-tickets'),
]