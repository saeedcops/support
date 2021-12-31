from django.shortcuts import render,redirect
from django.views import View
import json
from  django.http import JsonResponse
from core.models import *
# from validate_email import validate_email
from django.contrib import messages,auth


class UsernameValidationView(View):
    def post(self,request):
        data=json.loads(request.body)
        username=data['username']
        if not str(username).isalnum():
            return JsonResponse({'username_error':'username should only contain alphanumeric digits'})

        if User.objects.filter(username=username).exists():
            return JsonResponse({'username_error':'username is already exist'})

        # request.META.get('REMOTE_HOST')
        return JsonResponse({'username_valid':request.META.get('REMOTE_ADDR')})



class RegistrationView(View):
    def get(self,request):
        dep= Department.objects.all()
        branch =Branch.objects.all()
        return render(request,"auth/register.html",{'dep':dep,'branch':branch})

    def post(self,request):
        deps= Department.objects.all()
        branchs =Branch.objects.all()

        username=request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        name=request.POST['name']
        phone = request.POST['phone']
        branch = request.POST['branch']
        dep=request.POST['dep']

        print("Branch:",str(branch))
        print("dep:",str(dep))
        context={
            'username':username,
            'email':email,
            'name':name,
            'phone':phone,
            'dep':deps,
            'branch':branchs,
        }

        if not User.objects.filter(username=username).exists():

            if len(password)<4:
                messages.error(request, "كلمة المرور قصيرة جدا")
                return render(request, "auth/register.html", context)

            user=User.objects.create_user(username=username,email=email)
            user.set_password(password)
            user.phone=phone
            user.first_name=name
            user.branch=Branch.objects.get(name=branch)
            user.department=dep
            user.save()
            messages.success(request, "تم انشاء الحساب")
            return redirect('login')

        else:
            messages.error(request, "اسم الدخول موجود بالفعل")
            return render(request,"auth/register.html",context)


class LoginView(View):

    def get(self,request):
        return render(request,"auth/login.html")

    def post(self,request):
        username = request.POST['username']
        password = request.POST['password']
        if username and password:
            user = auth.authenticate(username=username,password=password)
            if user:
                auth.login(request,user)
                messages.success(request, "Hello "+username)
                return redirect('ticket')

            messages.error(request, "بيانات الدخول غير صحيحة")
            return render(request, "auth/login.html")

        messages.error(request,"املاء جميع الحقول")
        return render(request, "auth/login.html")

        # return render(request, "auth/login.html")

class LogoutView(View):
    def post(self,request):
        auth.logout(request)
        messages.success(request,"تم تسجل الخروج")
        return redirect('login')