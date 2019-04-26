from django.conf.urls import url
from user import views

app_name = "user"

urlpatterns = [
    url(r'^$', views.index, name="index"),
    url(r'^userhome/$', views.user_home, name="user_home"),
    url(r'^login/$', views.login, name="login"),
    url(r'^logout/$', views.logout, name="logout")
]
