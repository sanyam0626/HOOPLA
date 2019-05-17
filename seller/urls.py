from django.conf.urls import url
from seller import views
app_name = "seller"

urlpatterns = [
    url(r'^$', views.seller_home, name="seller_home"),

]
