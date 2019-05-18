from django.shortcuts import render, redirect
import authorize as au
import datetime as dt
from manager.models import UserDetail, ProdType, ProdCategories, ProdBrand, ProdSize, Product, SaleTable
from manager.forms import ProdCategoriesForm, ProdBrandForm, ProdSizeForm, ProductForm, ProdTypeForm
from django.core.files.storage import FileSystemStorage
from django.db.models import Sum
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
            request.session['name'] = userdata.user_fname
            request.session['image'] = userdata.user_image
            user = UserDetail.objects.filter(role_id_id=2).count()
            seller = UserDetail.objects.filter(role_id_id=3).count()
            prod = Product.objects.all().count()

            return render(request, "manager_dashboard.html", {'su': userdata, 'user': user, 'seller': seller, 'prod': prod})
        else:
            auth, message = auth
            if message == "Not Login":
                return render(request, "login.html", {'pass': True})
            elif message == "Wrong Level":
                return render(request, "404.html", {'pass': True})
    except:
        return redirect("/user/login")


def something_wrong(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
    except:
        return redirect("/user/login")
    if auth == True:
        return render(request, "500.html")
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})


def page_nfound(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
    except:
        return redirect("/user/login")
    if auth == True:
        return render(request, "404.html")
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})


def add_prod_category(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
    except:
        return redirect("/user/login")
    if auth==True:
        try:
            if request.method == "POST":
                form = ProdCategoriesForm(request.POST)
                f = form.save(commit=False)
                f.cat_name = request.POST['cat_name']
                f.save()
                return render(request, "add_prod_category.html", {'success': True})
            else:
                return render(request, "add_prod_category.html", {'failed': True})
        except:
            return redirect("/manager/500")
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})


def add_prod_size(request):
    try:
        vt = ProdType.objects.all()
        try:
            auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
        except:
            return redirect("/user/login")
        if auth == True:
            try:
                if request.method == "POST":
                    form = ProdSizeForm(request.POST)
                    f = form.save(commit=False)
                    f.size_name = request.POST['size_name']
                    f.type_id_id = request.POST['type_name']
                    f.save()
                    return render(request, "add_prod_size.html", {'success': True,'obj':vt})
                else:
                    return render(request, "add_prod_size.html", {'obj':vt})
            except:
                return redirect("/manager/500")
        else:
            auth, message = auth
            if message == "Not Login":
                return redirect("/user/login")
            elif message == "Wrong Level":
                return render(request, "404.html", {'pass': True})
    except:
        return redirect("user/login")


def add_prod_type(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
    except:
        return redirect("/user/login")
    if auth == True:
        try:
            if request.method == "POST":
                form = ProdTypeForm(request.POST)
                f = form.save(commit=False)
                f.type_name = request.POST['type_name']
                f.save()
                return render(request, "add_prod_type.html", {'success': True})
            else:
                return render(request, "add_prod_type.html", {'failed': True})
        except:
            return redirect("/manager/500")
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})


def add_product(request):
    try:
        vt = ProdType.objects.all()
        vc = ProdCategories.objects.all()
        vb = ProdBrand.objects.all()
        vs = ProdSize.objects.all()
        try:
            auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
        except:
            return redirect("/user/login")
        if auth == True:
            try:
                if request.method == "POST":
                    prod_image = None
                    if request.FILES:
                        myfile = request.FILES['prod_img1']
                        fs = FileSystemStorage()
                        filename = fs.save(myfile.name, myfile)
                        fs.url(filename)
                        prod_image = myfile.name
                    form = ProductForm(request.POST)
                    if form.is_valid():
                        f1 = form.save(commit=False)
                        f1.prod_name = (request.POST['prod_name']).capitalize()
                        f1.prod_price = request.POST['prod_price']
                        f1.user_email_id = request.session['emailid']
                        f1.prod_description = request.POST['prod_desc']
                        f1.prod_qty = request.POST['prod_qty']
                        f1.prod_img1 = prod_image
                        f1.cat_id_id = request.POST['cat_name']
                        f1.type_id_id = request.POST['type_name']
                        f1.size_id_id = request.POST['size_name']
                        f1.brand_id_id = request.POST['brand_name']
                        f1.prod_creationdate = dt.datetime.now().date()
                        f1.save()
                        return render(request, "add_product.html", {'success':True, 'vt': vt, 'vc': vc, 'vb': vb, 'vs': vs})
                    else:
                        return render(request, "add_product.html", {'vt': vt, 'vc': vc, 'vb': vb, 'vs': vs})
                return render(request, "add_product.html", {'vt': vt, 'vc': vc, 'vb': vb, 'vs': vs})
            except:
                return redirect("/manager/500")
        else:
            auth, message = auth
            if message == "Not Login":
                return redirect("/user/login")
            elif message == "Wrong Level":
                return render(request, "404.html", {'pass': True})
    except:
        return redirect("user/login")


def add_prod_brand(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
    except:
        return redirect("/user/login")
    if auth == True:
        try:
            if request.method == "POST":
                form = ProdBrandForm(request.POST)
                f = form.save(commit=False)
                f.brand_name = request.POST['brand_name']
                f.save()
                return render(request, "add_prod_brand.html", {'success': True})
            else:
                return render(request, "add_prod_brand.html", {'failed': True})
        except:
            return redirect("/manager/500")
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})


def view_products(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
    except:
        return redirect("/user/login")
    if auth == True:
            product = Product.objects.all()
            return render(request, "view_product.html", {'product': product})
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})


def view_brand(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
    except:
        return redirect("/user/login")
    if auth == True:
        vb = ProdBrand.objects.all()
        return render(request, "view_brand.html", {'vb': vb})
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})


def view_type(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
    except:
        return redirect("/user/login")
    if auth == True:
            vt = ProdType.objects.all()
            return render(request, "view_type.html", {'vt': vt})
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})


def view_category(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
    except:
        return redirect("/user/login")
    if auth == True:
        vc = ProdCategories.objects.all()
        return render(request, "view_categories.html", {'vc': vc})
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})


def view_size(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
    except:
        return redirect("/user/login")
    if auth == True:
        vs = ProdSize.objects.all()
        return render(request, "view_size.html", {'vs': vs})
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})


def view_user(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
    except:
        return redirect("/user/login")
    if auth == True:
        vs = UserDetail.objects.filter(role_id_id=2)
        return render(request, "view_users.html", {'user': vs})
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})


def view_seller(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 1)
    except:
        return redirect("/user/login")
    if auth == True:
        vs = UserDetail.objects.filter(role_id_id=3)
        return render(request, "view_sellers.html", {'seller': vs})
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})
