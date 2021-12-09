from django.db import models
from django.utils.timezone import now
# from django.contrib.auth.models import User as USER

from django.contrib.postgres.fields import ArrayField
from django.conf import settings
from django.contrib.auth import get_user_model
from django.contrib.auth.models import AbstractUser

# Create your models here. settings.AUTH_USER_MODEL


def user_directory_path(instance, filename):
  
    # file will be uploaded to MEDIA_ROOT / user_<id>/<filename>
    return 'requests/{0}/{1}'.format(instance.user.name, filename)

def user_image_path(instance, filename):
  
    # file will be uploaded to MEDIA_ROOT / user_<id>/<filename>
    return 'profile/{0}/{1}'.format(instance.user.username, filename)


class User(AbstractUser):
    phone = models.CharField(max_length=20, blank=True)
    ip = models.CharField(max_length=20, blank=True)
    department = models.CharField(max_length=20,null=True, blank=True)



class Branch(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name


class Department(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name


class Category(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Categories'



class FingerPrint(models.Model):
    ip = models.CharField(max_length=15)
    switch_port = models.IntegerField(default=0)
    vlan = models.IntegerField(default=99)
    model = models.CharField(max_length=20)
    serial_num = models.CharField(max_length=17)
    location = models.CharField(max_length=30)
    branch=models.ForeignKey(
            Branch,
            verbose_name="Branch",
            on_delete = models.PROTECT)

    def __str__(self):
        return self.ip

    class Meta:
        ordering=['-ip']



class DVR(models.Model):
    host_name = models.CharField(max_length=15)
    ip = models.CharField(max_length=15)
    switch_port = models.IntegerField(default=0)
    cams = models.IntegerField(default=0)
    vlan = models.IntegerField(default=99)
    model = models.CharField(max_length=20)
    serial_num = models.CharField(max_length=17)
    location = models.CharField(max_length=30)
    
    branch=models.ForeignKey(
            Branch,
            verbose_name="Branch",
            on_delete = models.PROTECT)

    def __str__(self):
        return self.host_name

    class Meta:
        ordering=['-host_name']



class Firewall(models.Model):
    host_name = models.CharField(max_length=15)
    ip = models.CharField(max_length=15)
    port_numbers = models.IntegerField(default=12)
    gatewaies = models.CharField(max_length=255)
    model = models.CharField(max_length=20)
    serial_num = models.CharField(max_length=17)
    role = models.CharField(max_length=30)
    branch=models.ForeignKey(
            Branch,
            verbose_name="Branch",
            on_delete = models.PROTECT,null=True,blank=True)

    def __str__(self):
        return self.host_name

    class Meta:
        ordering=['-host_name']



class Switch(models.Model):
    host_name = models.CharField(max_length=15)
    ip = models.CharField(max_length=15) 
    port_number = models.IntegerField(default=24)
    vlan = ArrayField(ArrayField(models.IntegerField()))
    trunk_ports= ArrayField(ArrayField(models.IntegerField()))
    model = models.CharField(max_length=20) 
    serial_num = models.CharField(max_length=17)
    role = models.CharField(max_length=30) 
    branch=models.ForeignKey(
            Branch,
            verbose_name="Branch",
            on_delete = models.PROTECT,null=True,blank=True)

    def __str__(self):
        return self.host_name

    class Meta:
        ordering=['-host_name']
        


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
            verbose_name="Branch",
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
           settings.AUTH_USER_MODEL,
            related_name='userprofile',
            on_delete = models.PROTECT,null=True,blank=True)

    department=models.ForeignKey(
            Department,
            on_delete = models.PROTECT,null=True,blank=True)

    branch=models.ForeignKey(
            Branch,
            verbose_name="Branch",
            on_delete = models.PROTECT,null=True,blank=True)

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
#     department=models.CharField(max_length = 10,null=True,blank=True)
    branch=models.ForeignKey(
            Branch,
            verbose_name="Branch",
            on_delete = models.PROTECT)

    def __str__(self):
        return self.ip

    class Meta:
        ordering=['-ip']




class UserProfile(models.Model):
    user = models.OneToOneField(
            settings.AUTH_USER_MODEL,
            related_name='user',
            on_delete = models.CASCADE,null=True,blank=True)
    name = models.CharField(max_length = 50)
    email = models.EmailField(max_length = 200)
    department=models.CharField(max_length = 15,null=True,blank=True)
    phone =models.CharField(max_length = 15,null=True,blank=True)
    image = models.ImageField(upload_to = user_image_path,null=True,blank=True)
    # department = models.ForeignKey(
    #         Department,
    #         related_name='udepartment',
    #         on_delete = models.PROTECT,null=True,blank=True)
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
            settings.AUTH_USER_MODEL,
            related_name='admin',
            on_delete = models.CASCADE,null=True,blank=True)
    name = models.CharField(max_length = 50)
    email = models.EmailField(max_length = 50)
    phone =models.CharField(max_length = 15)
    position =models.CharField(max_length = 20)
    image = models.ImageField(upload_to = user_image_path,null=True,blank=True)
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

class AppPermission(models.Model):
    permission = models.CharField(max_length = 50)

    def __str__(self):
        return self.permission



class Request(models.Model):
    user = models.ForeignKey(
            UserProfile,
            related_name='userrequest',
            on_delete = models.CASCADE)
    valid = models.BooleanField(default=False)
    date = models.DateField(default=now)
    file_scan = models.FileField(upload_to =user_directory_path,null=True,blank=True)
    branch=models.ForeignKey(
            Branch,
            related_name='branchrequest',
            on_delete = models.PROTECT,null=True,blank=True)
    category = models.ForeignKey(Category,
                related_name='userrequest',
                on_delete = models.PROTECT,null=True,blank=True)

    
    def __str__(self):
        return self.user.name

    class Meta:
        ordering = ['-date']



class Permission(models.Model):
    apps = models.ManyToManyField(Category)
    name = models.CharField(max_length = 50)
    share = models.ManyToManyField(Share,related_name='usershare')
    user = models.ForeignKey(
            settings.AUTH_USER_MODEL,
            related_name='userpro',
            on_delete = models.CASCADE,null=True,blank=True)
    
    def __str__(self):
        return self.user.username



class Message(models.Model):
    sender = models.IntegerField(default = 1)
    name = models.CharField(default= " ",max_length = 50)
    text = models.TextField()
    date = models.DateField(default=now)
    
    def __str__(self):
        return self.text



class Ticket(models.Model):
    status = models.CharField(default= "open",max_length = 10)
    # priority =  models.IntegerField()
    messages = models.ManyToManyField(Message)
    open_date = models.DateTimeField(default=now)
    closed_date = models.DateTimeField(null=True,blank=True)
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

        ordering=['-status',]
