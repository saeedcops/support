"""django_docker URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from django.urls import path,include
from django.conf import settings
from django.conf.urls.static import static
import notifications.urls
from django.conf.urls.i18n import i18n_patterns
# from userticket import urls

urlpatterns = [
    path('root/', admin.site.urls),
    path('oauth2/', include('django_auth_adfs.urls')),
    path('admins/', include('admins.urls')),
    path('auth/', include('authentication.urls')),
    path('', include('users.urls')),
    path('tickets/', include('tickets.urls')),
    url('^inbox/notifications/', include(notifications.urls, namespace='notifications')),
    
    

]+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

urlpatterns += i18n_patterns(
    path('root/', admin.site.urls),
    path('admins/', include('admins.urls')),
    path('', include('users.urls')),
    path('tickets/', include('tickets.urls')),
)