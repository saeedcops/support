from django.db.models.signals import post_save
# from .models import User
# from django.contrib.auth.models import User

from django.conf import settings
from django.dispatch import receiver
from django.core.files.base import ContentFile

@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def post_save_create_profile(sender, update_fields,instance, created, **kwargs):

    if not instance.image:
        instance.image = "/profile.png"
        instance.save()
        with open('static/img/profile.png') as f:
            data = f.read()

        # obj.image is the ImageField
        instance.image.save('profile.png', ContentFile(data))
        print("\n\n\n\n Created? \n",str(instance.image))
    