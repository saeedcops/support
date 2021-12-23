from django.db import models
from django.utils.timezone import now
# from django.contrib.auth.models import User as USER

from django.contrib.postgres.fields import ArrayField
from django.conf import settings
from django.contrib.auth import get_user_model
from django.contrib.auth.models import AbstractUser

from django.utils.translation import gettext_lazy as _

# Create your models here. settings.AUTH_USER_MODEL


def user_directory_path(instance, filename):
  
    # file will be uploaded to MEDIA_ROOT / user_<id>/<filename>
    return 'requests/{0}/{1}'.format(instance.user.username, filename)

def user_image_path(instance, filename):
  
    # file will be uploaded to MEDIA_ROOT / user_<id>/<filename>
    return 'profile/{0}/{1}'.format(instance.username, filename)


class Branch(models.Model):
    name = models.CharField(max_length=20,verbose_name = _("Name"))

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = _("Branch")
        verbose_name_plural = _("Branchs")


class Department(models.Model):
    name = models.CharField(max_length=20,unique=True,verbose_name = _("Name"))

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = _("Department")
        verbose_name_plural = _("Departments")


class Category(models.Model):
    name = models.CharField(max_length=20,verbose_name = _("Name"))

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = _("Category")
        verbose_name_plural = _('Categories')



class FingerPrint(models.Model):
    ip = models.CharField(max_length=15)
    switch_port = models.IntegerField(default=0)
    vlan = models.IntegerField(default=99)
    model = models.CharField(max_length=30)
    serial_num = models.CharField(max_length=17,null=True,blank=True)
    location = models.CharField(max_length=30,null=True,blank=True)
    branch=models.ForeignKey(
            Branch,
            verbose_name="Branch",
            on_delete = models.PROTECT)

    def __str__(self):
        return self.model

    class Meta:
        ordering=['-ip']



class DVR(models.Model):
    host_name = models.CharField(max_length=15,null=True,blank=True)
    ip = models.CharField(max_length=20,unique=True)
    switch_port = models.IntegerField(default=0)
    cams = models.IntegerField(default=0)
    vlan = models.IntegerField(default=99)
    model = models.CharField(max_length=50)
    serial_num = models.CharField(max_length=20,null=True,blank=True)
    username = models.CharField(max_length=20,null=True,blank=True)
    password = models.CharField(max_length=20,null=True,blank=True)
    location = models.CharField(max_length=50)
    
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
    host_name = models.CharField(max_length=30,unique=True)
    ip = models.CharField(max_length=50) 
    switch_port = models.IntegerField(default=0)
    vlan = models.IntegerField(default=0)
    ram = models.CharField(max_length=50)
    cpu = models.CharField(max_length=50)
    hard_disk=models.CharField(max_length=50)
    os = models.CharField(max_length=50)
    mac = models.CharField(max_length=50) 
    model = models.CharField(max_length=50) 
    serial_num = models.CharField(max_length=50,null=True,blank=True)
    role = models.CharField(max_length=30) 
    branch=models.ForeignKey(
            Branch,
            verbose_name="Branch",
            on_delete = models.PROTECT,null=True,blank=True)

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
    host_name = models.CharField(max_length=50,unique=True)
    ip = models.CharField(max_length=50) 
    switch_port = models.IntegerField(default=0)
    vlan = models.IntegerField(default=0)
    ram = models.CharField(max_length=50,null=True,blank=True)
    cpu = models.CharField(max_length=50,null=True,blank=True)
    hard_disk=models.CharField(max_length=50,null=True,blank=True)
    os = models.CharField(max_length=50,null=True,blank=True)
    mac = models.CharField(max_length=50,null=True,blank=True) 
    model = models.CharField(max_length=50,null=True,blank=True) 
    serial_num = models.CharField(max_length=50,null=True,blank=True)     
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


class Network(models.Model):
    device = models.CharField(max_length=20)
    model = models.CharField(max_length=30,null=True,blank=True)
    ports =models.CharField(default="1",max_length=20)
    location = models.CharField(max_length=30,null=True,blank=True)
    ip =models.CharField(max_length=20,unique=True)
    username = models.CharField(max_length=20,null=True,blank=True)
    password = models.CharField(max_length=20,null=True,blank=True)
    serial_num = models.CharField(max_length=50,null=True,blank=True) 
    branch=models.ForeignKey(
            Branch,
            related_name='branchnetwork',
            on_delete = models.PROTECT,null=True,blank=True)
    
    def __str__(self):
        return self.device

    class Meta:
        ordering = ['-device']



class Backup(models.Model):
    data = models.CharField(max_length=100)
    descreption = models.CharField(max_length=50,null=True,blank=True)
    internal_path =models.CharField(max_length=70,null=True,blank=True)
    internal_schadule =models.CharField(max_length=50,null=True,blank=True)
    internal_agent =models.CharField(max_length=50,null=True,blank=True)
    external_path =models.CharField(max_length=70,null=True,blank=True)
    external_schadule =models.CharField(max_length=50,null=True,blank=True)
    external_agent =models.CharField(max_length=50,null=True,blank=True)
    server=models.ForeignKey(
            Server,
            related_name='bkb',
            on_delete = models.CASCADE)
    branch=models.ForeignKey(
            Branch,
            related_name='branchbkb',
            on_delete = models.PROTECT,null=True,blank=True)
    
    def __str__(self):
        return self.data

    class Meta:
        ordering = ['-data']


class Storage(models.Model):
    model = models.CharField(max_length=20)
    capacity = models.CharField(max_length=20)
    ip =models.CharField(max_length=50,unique=True)
    serial_num = models.CharField(max_length=50,null=True,blank=True) 
    branch=models.ForeignKey(
            Branch,
            related_name='branchstore',
            on_delete = models.PROTECT,null=True,blank=True)
    
    def __str__(self):
        return self.model

    class Meta:
        ordering = ['-ip']


class Stock(models.Model):
    status = models.CharField(default="Used",max_length=20)
    qty =models.CharField(default="1",max_length=20)
    item = models.CharField(max_length=100)
    branch=models.ForeignKey(
            Branch,
            related_name='branchstock',
            on_delete = models.PROTECT,null=True,blank=True)
    
    def __str__(self):
        return self.item

    class Meta:
        ordering = ['-status']



class Printer(models.Model):
    ip = models.CharField(max_length=30,unique=True) 
    switch_port = models.IntegerField(default=0)
    vlan = models.IntegerField(default=0)
    mac = models.CharField(max_length=30,null=True,blank=True) 
    model = models.CharField(max_length=50,null=True,blank=True) 
    serial_num = models.CharField(max_length=30,null=True,blank=True)
    office=models.CharField(max_length = 50,null=True,blank=True)
    scan_share=models.CharField(max_length = 150,null=True,blank=True)
    branch=models.ForeignKey(
            Branch,
            verbose_name="Branch",
            on_delete = models.PROTECT)

    def __str__(self):
        return self.ip

    class Meta:
        ordering=['-ip']


class User(AbstractUser):
    phone = models.CharField(max_length=20, blank=True,verbose_name = _("Phone"))
    ip = models.CharField(max_length=20, blank=True)
    image = models.ImageField(upload_to = user_image_path,null=True,blank=True,verbose_name = _("Image"))

    department=models.CharField(max_length = 15,null=True,blank=True,verbose_name = _("Department"))
    # department = models.ForeignKey(
    #         Department,
    #         related_name='udepartment',
    #         on_delete = models.PROTECT,null=True,blank=True)
    pc=models.ForeignKey(
            PC,
            related_name='userpc',
            on_delete = models.PROTECT,null=True,blank=True)
    branch=models.ForeignKey(
            Branch,
            verbose_name = _("Branch"),
            related_name='userbranch',
            on_delete = models.PROTECT,null=True,blank=True)


class UserProfile(models.Model):
    user = models.OneToOneField(
            settings.AUTH_USER_MODEL,
            related_name='userpr',
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
            related_name='adminpr',
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
            settings.AUTH_USER_MODEL,
            related_name='userrequest',
            verbose_name = _("User"),
            on_delete = models.CASCADE)
    valid = models.BooleanField(default=False,verbose_name = _("Valid"))
    date = models.DateField(default=now,verbose_name = _("Date"))
    file_scan = models.FileField(upload_to =user_directory_path,null=True,blank=True,verbose_name = _("File"))
    branch=models.ForeignKey(
            Branch,
            verbose_name = _("Branch"),
            related_name='branchrequest',
            on_delete = models.PROTECT,null=True,blank=True)
    category = models.ForeignKey(Category,
                related_name='userrequest',
                verbose_name = _("Category"),
                on_delete = models.PROTECT,null=True,blank=True)

    
    def __str__(self):
        return self.user.username

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
    name = models.CharField(default= " ",max_length = 50,verbose_name = _("Name"))
    text = models.TextField(verbose_name = _("Text"))
    date = models.DateField(default=now,verbose_name = _("Date"))
    
    def __str__(self):
        return self.text

    class Meta:
        verbose_name = _("Message")
        verbose_name_plural = _('Messages')



class Ticket(models.Model):
    status = models.CharField(default= "open",max_length = 10,verbose_name = _("Status"))
    # priority =  models.IntegerField()
    messages = models.ManyToManyField(Message,verbose_name = _("Messages"))
    open_date = models.DateTimeField(default=now,verbose_name = _("Open Date"))
    closed_date = models.DateTimeField(null=True,blank=True,verbose_name = _("Closed Date"))
    description = models.TextField(verbose_name = _("Description"))
    user = models.ForeignKey(
            settings.AUTH_USER_MODEL,
            related_name='userticket',
            verbose_name = _("User"),
            on_delete = models.CASCADE)
    admin = models.ForeignKey(
            settings.AUTH_USER_MODEL,
            related_name='admin',
            verbose_name = _("Admin"),
            on_delete = models.CASCADE,null=True,blank=True)
    pc=models.ForeignKey(
            PC,
            verbose_name = _("PC"),
            on_delete = models.PROTECT)
    branch=models.ForeignKey(
            Branch,
            verbose_name = _("Branch"),
            on_delete = models.PROTECT)
    category = models.ForeignKey(
            Category,
            verbose_name = _("Category"),
            on_delete = models.PROTECT)

    def __str__(self):
        return self.user.username

    class Meta:

        ordering=['-open_date',]
        verbose_name = _("Ticket")
        verbose_name_plural = _('Tickets')
