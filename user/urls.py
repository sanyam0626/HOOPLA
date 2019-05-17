from django.conf.urls import url
from user import views

app_name = "user"

urlpatterns = [
    url(r'^$', views.index, name="index"),
    url(r'^login/$', views.login, name="login"),
    url(r'^logout/$', views.logout, name="logout"),
    url(r'^addtocart/$', views.addtocart_user, name="cart"),
    url(r'^update_profile/$', views.profile_update, name="profile_update"),
    url(r'^change_password/$', views.change_password, name="change_password")
]
