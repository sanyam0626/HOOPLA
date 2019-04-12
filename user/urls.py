from django.conf.urls import url
from user import views

app_name = "user"

urlpatterns = [
    url(r'^$', views.home, name="home"),
    url(r'^login/$', views.login, name="login")
]
