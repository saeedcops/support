import wmi_client_wrapper as wmi
from core.models import PC
from django.core.exceptions import ObjectDoesNotExist

def link_user_pc(ip,user):
    
    if ip =="192.168.10.143":
        return
    hostname=""
    try:
        wmic = wmi.WmiClientWrapper(username="administrator",password="P@ssw0rd",host=ip,)
        # output = wmic.query('Select * FROM MSFC_FibrePortNPIVAttributes')
        output = wmic.query("SELECT SystemName FROM Win32_Processor")
        hostname=output[0]['SystemName']
        print("\nData SystemName: ",hostname)
    except:
        pass

    
    try:
        pc= PC.objects.get(host_name=hostname)
        pc.user=user
        pc.ip=ip
        pc.save()
        user.pc=pc
        user.ip=ip
        user.save()
        print("\nPC exist ")

    except ObjectDoesNotExist:
        if hostname != "":

            pc=PC.objects.create(host_name=hostname,ip=ip,user=user)
            user.pc=pc
            user.ip=ip
            user.save()
            print("\nPC not exist ")
        # else:
        #     pc=PC.objects.create(host_name=ip,ip=ip,user=user)
        #     user.pc=pc
        #     user.ip=ip
        #     user.save()
        #     print("\nPC not exist ip name")