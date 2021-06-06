from django.db import models

# Create your models here.
class InfoModel(models.Model):
    firstName = models.CharField(max_length=10)
    lastName = models.CharField(max_length=20)