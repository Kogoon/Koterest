from django.db import models

# Create your models here.

class HelloWorld(models.Model):
    text = models.CharField(max_length=255, null=False)
    # python manage.py makemigrateions -> Create model HelloWorld
    # python manage.py migrate -> Apply