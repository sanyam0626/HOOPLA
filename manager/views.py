from django.shortcuts import render

# Create your views here.


def manager_home(request):
    return render(request, "masterpage_manager.html")
