from django.db import models
from django.utils.timezone import now
from django.contrib.auth.models import User

from django.contrib.postgres.fields import ArrayField
from django.conf import settings
from django.contrib.auth import get_user_model

# Create your models here. settings.AUTH_USER_MODEL


class Branch(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name



class Category(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Categories'



class Server(models.Model):
    host_name = models.CharField(max_length=15)
    ip = models.CharField(max_length=15) 
    switch_port = models.IntegerField(default=0)
    vlan = models.IntegerField(default=0)
    ram = models.IntegerField(default=0)
    cpu = models.CharField(max_length=10)
    hard_disk=models.CharField(max_length=10)
    os = models.CharField(max_length=50)
    mac = models.CharField(max_length=17) 
    model = models.CharField(max_length=20) 
    serial_num = models.CharField(max_length=17)
    role = models.CharField(max_length=30) 
    branch=models.ForeignKey(
            Branch,
            on_delete = models.PROTECT,null=True,blank=True)
    # category = models.CharField(max_length=20, default="Support")

    def __str__(self):
        return self.host_name

    class Meta:
        ordering=['-host_name']


class Share(models.Model):
    path = models.CharField(max_length=100)
    branch=models.ForeignKey(
            Branch,
            on_delete = models.CASCADE,null=True,blank=True)
    server=models.ForeignKey(
            Server,
            on_delete = models.CASCADE)

    def __str__(self):
        return self.path


class PC(models.Model):
    host_name = models.CharField(max_length=15)
    ip = models.CharField(max_length=15) 
    switch_port = models.IntegerField(default=0)
    vlan = models.IntegerField(default=0)
    ram = models.IntegerField(default=0)
    cpu = models.CharField(max_length=10)
    hard_disk=models.CharField(max_length=10)
    os = models.CharField(max_length=10)
    mac = models.CharField(max_length=17) 
    model = models.CharField(max_length=20) 
    serial_num = models.CharField(max_length=17)     
    user = models.ForeignKey(
            User,
            related_name='userprofile',
            on_delete = models.PROTECT,null=True,blank=True)

    branch=models.ForeignKey(
            Branch,
            on_delete = models.PROTECT,null=True,blank=True)
    # category = models.CharField(max_length=20, default="Support")

    def __str__(self):
        return self.host_name

    class Meta:
        ordering=['-host_name']


class Printer(models.Model):
    kind = models.CharField(max_length=15)
    ip = models.CharField(max_length=15) 
    switch_port = models.IntegerField(default=0)
    vlan = models.IntegerField(default=0)
    mac = models.CharField(max_length=17) 
    model = models.CharField(max_length=20) 
    serial_num = models.CharField(max_length=17)
    role = models.CharField(max_length=30) 
    connected_pc = models.ManyToManyField(PC)
    branch=models.ForeignKey(
            Branch,
            on_delete = models.PROTECT)

    def __str__(self):
        return self.ip

    class Meta:
        ordering=['-ip']




class UserProfile(models.Model):
    user = models.OneToOneField(
            User,
            related_name='user',
            on_delete = models.CASCADE,null=True,blank=True)
    name = models.CharField(max_length = 50)
    email = models.EmailField(max_length = 200)
    department=models.CharField(max_length = 10)
    pc=models.ForeignKey(
            PC,
            on_delete = models.PROTECT,null=True,blank=True)
    branch=models.ForeignKey(
            Branch,
            on_delete = models.PROTECT,null=True,blank=True)
#     last_login = models.DateTimeField(auto_now=True,null=True,blank=True)
    
    def __str__(self):
        return self.name

    class Meta:
        ordering = ['-department']




class AdminProfile(models.Model):
    user = models.OneToOneField(
            User,
            related_name='admin',
            on_delete = models.CASCADE,null=True,blank=True)
    name = models.CharField(max_length = 50)
    email = models.EmailField(max_length = 50)
    phone =models.CharField(max_length = 15)
    position =models.CharField(max_length = 20)
    pc=models.ForeignKey(
            PC,
            on_delete = models.PROTECT,null=True,blank=True)
    branch=models.ForeignKey(
            Branch,
            on_delete = models.PROTECT,null=True,blank=True)
#     last_login = models.DateTimeField(auto_now=True,null=True,blank=True)
    
    def __str__(self):
        return self.name

    class Meta:
        ordering = ['-name']


class Permission(models.Model):
    apps = models.ManyToManyField(Category)
    name = models.CharField(max_length = 50)
    share = models.ManyToManyField(Share,related_name='usershare')
    user = models.ForeignKey(
            User,
            related_name='userpro',
            on_delete = models.CASCADE,null=True,blank=True)
    
    def __str__(self):
        return self.user.username



class Ticket(models.Model):
    priority =  models.IntegerField()
    open_date = models.DateField(default=now)
    closed_date = models.DateField(null=True,blank=True)
    description = models.TextField()
    user = models.ForeignKey(
            UserProfile,
            related_name='userticket',
            on_delete = models.CASCADE)
    admin = models.ForeignKey(
            AdminProfile,
            related_name='admin',
            on_delete = models.CASCADE,null=True,blank=True)
    pc=models.ForeignKey(
            PC,
            on_delete = models.PROTECT)
    branch=models.ForeignKey(
            Branch,
            on_delete = models.PROTECT)
    category = models.ForeignKey(
            Category,
            on_delete = models.PROTECT)

    def __str__(self):
        return self.user.name

    class Meta:
        ordering=['-open_date']
