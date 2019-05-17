from django.shortcuts import render, redirect, HttpResponse
from manager.models import UserDetail,Product, TempProduct, SaleTable, PaymentToken
from manager.forms import TempProductForm, SaleTableForm, PaymentTokenForm
from user.forms import UserDetailForm
from email_sending import otpsend, email_send, password_send
import authorize as au
import datetime as dt
import random
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password, check_password
from django.conf import settings
from django.urls import reverse
from django.db.models import Sum
from django.shortcuts import render, get_object_or_404
from paypal.standard.forms import PayPalPaymentsForm
# Create your views here.


def index(request):
    clear_session(request)
    prod = Product.objects.all()
    return render(request, 'index.html', {'prod': prod})


def login(request):
    if request.method == "POST":
        try:
            email = request.POST['email']
            password = request.POST['password']
            user_data = UserDetail.objects.get(user_email=email)
            verified = user_data.user_isverified
            dp = user_data.user_password
            dr = user_data.role_id_id
            if check_password(password, dp):
                if verified is True:
                    request.session['Authenticated'] = True
                    request.session['emailid'] = email
                    request.session['role_id'] = dr
                    if dr == 1:
                        return redirect("/manager")
                    elif dr == 2:
                        request.session["name"] = user_data.user_fname
                        return redirect("/")
                    elif dr == 3:
                        return redirect("/seller")
                else:
                    return render(request, "login.html", {'nverified': True})
            else:
                return render(request, "login.html", {'wrong_pass': True})
        except:
            return render(request, "login.html", {'wrong_email': True})
    return render(request, "login.html", {'login': True})


def logout(request):
    request.session['Authenticated'] = False
    request.session['role_id'] = ""
    request.session['emailid'] = ""
    return redirect("/user/login")


def signup(request):
    if request.method=="POST":
        user_image = None
        if request.FILES:
            myfile = request.FILES['user_image']
            fs = FileSystemStorage()
            filename = fs.save(myfile.name, myfile)
            fs.url(filename)
            user_image = myfile.name

        form = UserDetailForm(request.POST)
        if form.is_valid():
            f1 = form.save(commit=False)
            f1.user_fname = (request.POST['user_fname']).capitalize()
            f1.user_lname = (request.POST['user_lname']).capitalize()
            f1.user_email = request.POST['user_email']
            f1.user_password = make_password(request.POST['user_password'])
            f1.user_address = request.POST['user_address']
            f1.user_pincode = request.POST['user_pincode']
            f1.user_landmark = request.POST['user_landmark']
            f1.user_mobile = request.POST['user_mobile']
            f1.user_dob = request.POST['user_dob']
            f1.user_image = user_image
            f1.user_gender = request.POST['user_gender']
            f1.role_id_id = request.POST['role_id']
            f1.date_reg = dt.datetime.now().date()
            rn = random.randint(100000, 1000000)
            token = request.POST['user_email'][0:5]+str(rn)+str(request.POST['user_mobile'][5:10])
            f1.user_token = token
            verify = "http://127.0.0.1:8000/verify?email="+request.POST['user_email']+"&token="+token
            email_send(f1.user_email, request.POST['user_password'], verify)
            f1.save()
            return redirect("/user/login")
        else:
            return render(request, "signup.html", {'invalid': True})
    return render(request, "signup.html")


def forgot_password(request):
    if request.method=="POST":
        try:
            email = request.POST['email']
            otp = random.randint(100000, 1000000)
            user_data = UserDetail.objects.get(user_email=email)
            try:
                otp1 = request.POST['otp']
                do = user_data.otp
                if do == otp1:
                    rn = random.randint(100000, 1000000)
                    password = email[0:3] + str(rn) + otp1[3:6]
                    password_send(password, email, "New Password", "Greetings from Hoopla!")
                    np = make_password(password)
                    update = UserDetail(user_email=email, user_password=np, otp="", otp_time_gen="")
                    update.save(update_fields=["user_password", "otp", "otp_time_gen"])
                    return redirect("/user/login")
                else:
                    return render(request, "login.html", {'wrong_otp': True})
            except:
                pass
        except:
            return render(request, "login.html", {'wrong_email': True})
        if user_data:
            otpsend(otp, email, "Forgot Password", "Greetings from Hoopla!")
            otptime = dt.datetime.now().time()
            update = UserDetail(user_email=email, otp=otp, otp_time_gen=otptime)
            update.save(update_fields=["otp", "otp_time_gen"])
            return render(request, "login.html", {'otp': True, 'email': email})
        else:
            return render(request, "login.html", {'wrong_email': True})
    return render(request, "login.html", {'fp': True})


def profile_update(request):
    email = request.session['emailid']
    su = UserDetail.objects.get(user_email=email)
    if request.method == "POST":
        user_image = su.user_image
        if request.FILES:
            myfile = request.FILES['user_image']
            fs = FileSystemStorage()
            filename = fs.save(myfile.name, myfile)
            fs.url(filename)
            user_image = myfile.name
        fname = request.POST['user_fname']
        lname = request.POST['user_lname']
        dob = request.POST['user_dob']
        update = UserDetail(user_email=email, user_fname=fname, user_lname=lname, user_dob=dob, user_image=user_image)
        update.save(update_fields=["user_fname", "user_lname", "user_dob", "user_image"])
        return redirect("/user/update_profile")
    return render(request, "profile_update.html", {'su': su})


def change_password(request):
    email = request.session['emailid']
    ud = UserDetail.objects.get(user_email=email)
    dbpwd = ud.user_password

    if request.method=="POST":
        if check_password(request.POST['user_password'], dbpwd):
            npwd = make_password(request.POST['new_password'])
            update = UserDetail(user_email=email, user_password=npwd)
            update.save(update_fields=["user_password"])

            return redirect("/user/logout")
            #return render(request, "profile_update.html", {'success': True})
        else:
            return render(request, "profile_update.html", {'success': False, 'cp': True})
    return render(request, "profile_update.html", {'cp': True})


def verify(request):
    try:
        email = request.GET['email']
        token = request.GET['token']
        userdata = UserDetail.objects.get(user_email=email)
        verified = userdata.user_isverified

        if verified is False:
            dbtoken = userdata.user_token
            if dbtoken == token:
                verified=True
                update = UserDetail(user_email= email, user_isverified=verified, user_token="")
                update.save(update_fields=["user_isverified", "user_token"])
                return render(request, "verify.html", {'verified':True})
            else:
                return render(request, "verify.html", {'tokenexp': True})
        else:
            return render(request, "verify.html", {'averified':True})
    except:
        return redirect("/user/login")


def contact(request):
    return render(request, "contact.html")


def mens(request):
    return render(request, "mens.html")


def womens(request):
    return render(request, "womens.html")


def addtocart_user(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 2)
    except:
        return render(request, "login.html", {'pass': True})
    if auth==True:
        email = request.session['emailid']
        pid = request.GET['pid']
        prod_data = Product.objects.get(prod_id=pid)
        prod_name = prod_data.prod_name
        prod_price = prod_data.prod_price
        prod_type = prod_data.type_id_id
        prod_cat = prod_data.cat_id_id
        prod_img = prod_data.prod_img1
        data = TempProduct.objects.filter(user_email=email, product_id=pid)
        if request.method=="POST":
            request.session['size'] = request.POST['size_id']
        if data:
            return redirect("/addtocart")
        else:
            temp = TempProductForm()
            t = temp.save(commit=False)
            t.product_id = pid
            t.user_email = email
            t.product_name = prod_name
            t.prod_price = prod_price
            t.prod_type = prod_type
            t.prod_cat = prod_cat
            t.prod_image = prod_img
            t.add_date = dt.datetime.now().date()
            t.prod_qty = 1
            t.subtotal = prod_price
            t.save()
            return redirect("/")
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})


def addto_cart(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 2)
    except:
        return redirect("/user/login")
    if auth == True:
        email = request.session['emailid']
        ud = UserDetail.objects.get(user_email=email)
        rn = random.randint(10000, 100000)
        invoice = ud.user_mobile[0:4] + str(rn)
        request.session['invoice'] = invoice
        request.session['token'] = str(random.randint(1000, 10000)) + str(invoice)
        data = TempProduct.objects.filter(user_email=email)
        total = TempProduct.objects.filter(user_email=email).aggregate(Sum('subtotal'))
        return render(request, "add_to_cart.html", {'prod': data, 'total': total})
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})


def delete_from_cart(request):
    prod_id = request.GET['id']
    try:
        email = request.session['emailid']
        deleteprod = TempProduct.objects.get(product_id=prod_id, user_email=email)
        deleteprod.delete()
        return redirect("/addtocart")
    except:
        return redirect("/addtocart")


def increase_qty(request):
    prod_id = request.GET['id']
    email = request.session['emailid']
    prod = TempProduct.objects.get(product_id=prod_id, user_email=email)
    a = prod.prod_qty+1
    price = a*prod.prod_price
    update = TempProduct(tempproduct_id=prod.tempproduct_id, prod_qty=a, subtotal=price )
    update.save(update_fields=['prod_qty', 'subtotal'])
    return redirect("/addtocart")


def decrease_qty(request):
    prod_id = request.GET['id']
    email = request.session['emailid']
    prod = TempProduct.objects.get(product_id=prod_id, user_email=email)
    if prod.prod_qty == 1:
        delete_from_cart(request)
    else:
        a = prod.prod_qty - 1
        price = a * prod.prod_price
        update = TempProduct(tempproduct_id=prod.tempproduct_id, prod_qty=a, subtotal=price)
        update.save(update_fields=['prod_qty', 'subtotal'])
        return redirect("/addtocart")
    return redirect("/addtocart")


def checkout(request):
    try:
        auth = au.authorize_user(request.session['Authenticated'], request.session['role_id'], 2)
    except:
        return redirect("/user/login")
    if auth == True:
        email = request.session['emailid']
        ud = UserDetail.objects.get(user_email=email)
        invoice = request.session['invoice']
        total = request.GET['total']
        pay_token = PaymentToken.objects.all()
        exist=False
        for i in pay_token:
            if i.invoice == invoice:
                exist=True
                break
        if exist==False:
            form1 = PaymentTokenForm()
            f2 = form1.save(commit=False)
            f2.user_email = email
            f2.invoice = invoice
            f2.token = request.session['token']
            f2.save()

        host = request.get_host()
        paypal_dict = {
            'business': settings.PAYPAL_RECEIVER_EMAIL,
            'amount': total,
            'item_name': email,
            'invoice': invoice,
            'currency_code': 'INR',
            'notify_url': 'http://{}{}'.format(host, reverse('paypal-ipn')),
            'return_url': 'http://{}{}?token={}'.format(host, reverse('payment_done'), request.session['token']),
        }

        form = PayPalPaymentsForm(initial=paypal_dict)

        if request.method == "POST":
            request.session['invoice'] = request.POST['invoice']
            request.session['total'] = request.POST['total']
            request.session['address'] = request.POST['address']
            request.session['landmark'] = request.POST['landmark']
            request.session['pin'] = request.POST['pin']
            request.session['mode'] = request.POST['payment_mode']
            if request.POST['payment_mode'] == "COD":
                return redirect("/cod")
            if request.POST['payment_mode'] == "PayPal":
                return render(request, "checkout.html", {'ud': ud, 'total': total, 'invoice': invoice, 'form': form})


        return render(request, "checkout.html", {'ud': ud, 'total': total, 'invoice': invoice})
    else:
        auth, message = auth
        if message == "Not Login":
            return redirect("/user/login")
        elif message == "Wrong Level":
            return render(request, "404.html", {'pass': True})


def cod(request):
    email = request.session['emailid']
    mode = request.session['mode']
    address = request.session['address']
    landmark = request.session['landmark']
    pin = request.session['pin']
    invoice = request.session['invoice']
    total = request.session['total']
    ud = UserDetail.objects.get(user_email=email)
    fname = ud.user_fname
    lname = ud.user_lname
    mob = ud.user_mobile
    name = fname+lname
    cart = TempProduct.objects.filter(user_email=email)
    for i in cart:
        sale = SaleTableForm()
        s = sale.save(commit=False)
        s.invoice = invoice
        s.product_id = i.product_id
        s.product_name = i.product_name
        s.prod_qty = i.prod_qty
        s.prod_price = i.prod_price
        s.user_email = email
        s.user_name = name
        s.prod_size = i.prod_size
        s.prod_type = i.prod_type
        s.prod_cat = i.prod_cat
        s.total = i.subtotal
        s.payment_mode = mode
        s.sale_date = dt.datetime.now().date()
        s.user_address = address
        s.user_landmark = landmark
        s.user_mobile = mob
        s.user_pincode = pin
        s.save()
        clear_session(request)
    for i in cart:
        pd = Product.objects.get(prod_id=i.product_id)
        qty = pd.prod_qty
        nqty = int(qty) - i.prod_qty
        update = Product(prod_id=i.product_id, prod_qty=nqty)
        update.save(update_fields=['prod_qty'])
    cart.delete()
    sd = SaleTable.objects.filter(user_email=email, invoice=invoice)
    return render(request, "cash_on_delivery.html", {'success': True, 'sd': sd})


def payment_done(request):
    try:
        tok=request.GET['token']
        dbtoken=PaymentToken.objects.get(token=str(tok))

        auth = dbtoken.token
        if auth == tok:
            email = request.session['emailid']
            mode = request.session['mode']
            address = request.session['address']
            landmark = request.session['landmark']
            pin = request.session['pin']
            invoice = request.session['invoice']
            total = request.session['total']
            ud = UserDetail.objects.get(user_email=email)
            fname = ud.user_fname
            lname = ud.user_lname
            mob = ud.user_mobile
            name = fname + lname
            cart = TempProduct.objects.filter(user_email=email)
            for i in cart:
                sale = SaleTableForm()
                s = sale.save(commit=False)
                s.invoice = invoice
                s.product_id = i.product_id
                s.product_name = i.product_name
                s.prod_qty = i.prod_qty
                s.prod_price = i.prod_price
                s.user_email = email
                s.user_name = name
                s.prod_size = i.prod_size
                s.prod_type = i.prod_type
                s.prod_cat = i.prod_cat
                s.total = i.subtotal
                s.payment_mode = mode
                s.sale_date = dt.datetime.now().date()
                s.user_address = address
                s.user_landmark = landmark
                s.user_mobile = mob
                s.user_pincode = pin
                s.save()
                clear_session(request)

            for i in cart:
                pd = Product.objects.get(prod_id=i.product_id)
                qty = pd.prod_qty
                nqty = int(qty) - i.prod_qty
                update = Product(prod_id=i.product_id, prod_qty=nqty)
                update.save(update_fields=['prod_qty'])
            cart.delete()
            sd = SaleTable.objects.filter(user_email=email, invoice=invoice)
            return render(request, "payment_done.html", {'success': True, 'sd': sd})
        else:
            return redirect('/')
    except:
        return redirect('/mens')


def show_orders(request):
    email = request.session['emailid']
    sd = SaleTable.objects.filter(user_email=email).order_by("-sale_id")
    product=[]
    num=""
    for i in sd:
        num=i.invoice
        print(num)
        break
    return render(request, "my_orders.html", {'sd': sd})


def clear_session(request):
    request.session['address'] = ""
    request.session['landmark'] = ""
    request.session['pin'] = ""
    request.session['invoice'] = ""
    request.session['total'] = ""
    request.session['token'] = ""
    request.session['size'] = ""