from django.shortcuts import render, redirect
from django.shortcuts import render, redirect
import authorize as au
import datetime as dt
from manager.models import UserDetail, ProdType, ProdCategories, ProdBrand, ProdSize, Product
from manager.forms import ProdCategoriesForm, ProdBrandForm, ProdSizeForm, ProductForm, ProdTypeForm
from django.core.files.storage import FileSystemStorage

# Create your views here.

def seller_home(request):
    try:
        email = request.session['emailid']
        userdata = UserDetail.objects.get(user_email=email)
        try:
            auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 3)
        except:
            return redirect("/user/login")
        if auth==True:
            request.session['name'] = userdata.user_fname
            request.session['image'] = userdata.user_image
            return render(request, "seller_dashboard.html", {'su': userdata})
        else:
            auth, message = auth
            if message == "Not Login":
                return render(request, "login.html", {'pass': True})
            elif message == "Wrong Level":
                return render(request, "404.html", {'pass': True})
    except:
        return redirect("/user/login")