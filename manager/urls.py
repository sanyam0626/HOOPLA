from django.conf.urls import url
from manager import views
app_name = "manager"

urlpatterns = [
    url(r'^$', views.manager_home, name="manager_home"),
    url(r'^add_category/$', views.add_prod_category, name="add_category"),
    url(r'^add_size/$', views.add_prod_size, name="add_size"),
    url(r'^add_type/$', views.add_prod_type, name="add_type"),
    url(r'^add_brand/$', views.add_prod_brand, name="add_brand"),
    url(r'^view_brand/$', views.view_brand, name="view_brand"),
    url(r'^view_type/$', views.view_type, name="view_type"),
    url(r'^view_category/$', views.view_category, name="view_category")
]
