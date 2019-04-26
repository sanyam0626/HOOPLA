from django.shortcuts import render, redirect, HttpResponse
from manager.models import UserDetail
from user.forms import UserDetailForm
from email_sending import otpsend, email_send
import authorize, otpgeneration
import datetime as dt
import random
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password, check_password
# Create your views here.


def index(request):
    return render(request, 'index.html')


def user_home(request):
    return render(request, 'user_home.html')


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
                        return redirect("/user/userhome/")
                    elif dr == 3:
                        return redirect("/seller")
                else:
                    return redirect("/user/login")
            else:
                return redirect("/user/login")
        except:
            return render(request, "login.html", {'wrong_email': True})
    return render(request, "login.html", {'login': True})


def logout(request):
    request.session['Authenticated'] = False
    return redirect("/")


def signup(request):
    if request.method=="POST":
        user_image = None
        if request.FILES:
            myfile = request.FILES['user_image']
            fs = FileSystemStorage()
            filename = fs.save(myfile.name, myfile)
            fs.url(filename)
            user_image = myfile.name
        try:
            email = request.POST['user_email']
            data = UserDetail.objects.get(user_email=email)
            return render(request, "signup.html", {'invalid': True})
        except:
            pass
        form = UserDetailForm(request.POST)
        if form.is_valid():
            f1 = form.save(commit=False)
            f1.user_fname = (request.POST['user_fname']).capitalize()
            f1.user_lname = (request.POST['user_lname']).capitalize()
            f1.user_email = request.POST['user_email']
            f1.user_password = make_password(request.POST['user_password'])
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
                return redirect("/")
            else:
                return redirect("/user/login")
        else:
            return redirect("/user/login")
    except:
        return redirect("/signup")


def contact(request):
    return render(request, "contact.html")


def mens(request):
    return render(request, "mens.html")


def womens(request):
    return render(request, "womens.html")
