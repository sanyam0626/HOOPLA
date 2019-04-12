from django.shortcuts import render, redirect
from manager.models import UserDetail
# Create your views here.


def home(request):
    return render(request, 'index.html')


def login(request):
    if request.method == "POST":
        email = request.POST['email']
        password = request.POST['password']
        try:
            user_data = UserDetail.objects.get(user_email=email)
            dp = user_data.user_password
            dr = user_data.role_id_id
            if dp == password:
                if dr == 1:
                    return redirect("/manager")
                elif dr == 2:
                    return redirect("/user")
                elif dr == 3:
                    return redirect("/seller")
        except:
            return render(request, "masterpage_manager.html", {'wrong_email': True})
    return render(request, "masterpage_manager.html")


