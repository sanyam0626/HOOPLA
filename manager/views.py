from django.shortcuts import render, redirect
import authorize as au
from manager.models import UserDetail, ProdType, ProdCategories, ProdBrand
from manager.forms import ProdCategoriesForm, ProdBrandForm, ProdSizeForm, ProductForm, ProdTypeForm

# Create your views here.


def manager_home(request):
    try:
        email = request.session['emailid']
        userdata = UserDetail.objects.get(user_email=email)
        try:
            auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
        except:
            return redirect("/user/login")
        if auth==True:
            return render(request, "manager_master.html", {'su': userdata})
        else:
            auth, message = auth
            if message == "Not Login":
                return render(request, "login.html", {'pass': True})
            elif message == "Wrong Level":
                return render(request, "404.html", {'pass': True})
    except:
        return redirect("/user/login")


def add_prod_category(request):
    try:
        if request.session['Authenticated'] and request.session['role_id'] == 1:
            if request.method == "POST":
                form = ProdCategoriesForm(request.POST)
                f = form.save(commit=False)
                f.cat_name = request.POST['cat_name']
                f.save()
                return render(request, "add_prod_category.html", {'success': True})
            else:
                return render(request, "add_prod_category.html", {'failed': True})
        else:
            return redirect("/user/login")
    except:
        return redirect("/")


def add_prod_size(request):
    try:
        if request.session['Authenticated'] and request.session['role_id'] == 1:
            if request.method == "POST":
                form = ProdSizeForm(request.POST)
                f = form.save(commit=False)
                f.size_name = request.POST['size_name']
                f.save()
                return render(request, "add_prod_size.html", {'success': True})
            else:
                return render(request, "add_prod_size.html", {'failed': True})
        else:
            return redirect("/user/login")
    except:
        return redirect("/")


def add_prod_type(request):
    try:
        if request.sessio['Authenticated'] and request.session['role_id'] == 1:
            if request.method == "POST":
                form = ProdTypeForm(request.POST)
                f = form.save(commit=False)
                f.type_name = request.POST['type_name']
                f.save()
                return render(request, "add_prod_type.html", {'success': True})
            else:
                return render(request, "add_prod_type.html", {'failed': True})
        else:
            return redirect("/user/login")
    except:
        return redirect("/")


def add_product(request):
    if request.method == "POST":
        form = ProductForm(request.POST)
        f = form.save(commit=False)
        f.prod_name = request.POST['prod_name']
        f.save()
        return render(request, "add_product_category.html",{'success': True})
    else:
        return render(request, "add_product_category.html",{'failed': True})


def add_prod_brand(request):
    try:
        if request.session['Authenticated'] and request.session['role_id'] == 1:
            if request.method == "POST":
                form = ProdBrandForm(request.POST)
                f = form.save(commit=False)
                f.brand_name = request.POST['brand_name']
                f.save()
                return render(request, "add_prod_brand.html", {'success': True})
            else:
                return render(request, "add_prod_brand.html", {'failed': True})
        else:
            return redirect("/user/login")
    except:
        return redirect("/")


def view_brand(request):
    try:
        if request.session['Authenticated'] and request.session['role_id'] == 1:
            vb = ProdBrand.objects.all()
            return render(request, "view_brand.html", {'vb': vb})
        else:
            return redirect("/user/login")
    except:
        return redirect("/")


def view_type(request):
    try:
        if request.sessio['Authenticated'] and request.session['role_id'] == 1:
            vt = ProdType.objects.all()
            return render(request, "view_type.html", {'vt': vt})
        else:
            return redirect("/user/login")
    except:
        return redirect("/")


def view_category(request):
    try:
        if request.session['Authenticated'] and request.session['role_id'] == 1:
            vc = ProdCategories.objects.all()
            return render(request, "view_categories.html", {'vc': vc})
        else:
            return redirect("/user/login")
    except:
        return redirect("/")
