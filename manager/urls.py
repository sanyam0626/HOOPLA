from django.conf.urls import url
from manager import views
app_name = "manager"

urlpatterns = [
    url(r'^$', views.manager_home, name="manager_home")
]
