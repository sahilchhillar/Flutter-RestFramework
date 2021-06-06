from rest_framework import serializers
from rest_proj.models import InfoModel

class InfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = InfoModel
        fields = ['id', 'firstName', 'lastName']