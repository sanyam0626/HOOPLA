"""Hoopla URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.conf.urls import url, include
from user import views
from django.conf import settings
from django.conf.urls.static import static
from django.views.generic import TemplateView

urlpatterns = [
    url('admin/', admin.site.urls),
    url(r'^$', views.index),
    url(r'^signup/$', views.signup),
    url(r'^verify/', views.verify),
    url(r'^contact/$', views.contact),
    url(r'^mens/$', views.mens),
    url(r'^womens/$', views.womens),
    url(r'^user/', include("user.urls")),
    url(r'^addtocart', views.addto_cart),
    url(r'^manager/', include("manager.urls")),
    url(r'^seller/', include("seller.urls")),
    url(r'^forgotpassword/$', views.forgot_password),
    url(r'^deleteproduct/$', views.delete_from_cart),
    url(r'^increaseqty/$', views.increase_qty),
    url(r'^decreaseqty/$', views.decrease_qty),
    url(r'^checkout/$', views.checkout),
    url(r'^cod/$', views.cod),
    url(r'^my_orders/$', views.show_orders),
    url(r'^paypal/', include('paypal.standard.ipn.urls')),
    url(r'^payment_done/$', views.payment_done, name='payment_done'),
    url(r'^payment_canceled/$', TemplateView.as_view(template_name='payment_canceled.html'), name='payment_canceled')
]\
    + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
