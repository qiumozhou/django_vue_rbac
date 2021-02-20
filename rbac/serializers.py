
from rest_framework import serializers

from rbac import models


class MenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Menu
        fields = "__all__"


class PermissionSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Permission
        exclude = ["menu"]


class MenuPermissionSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    title = serializers.CharField()
    permissions = serializers.SerializerMethodField()

    def get_permissions(self,obj):
        return PermissionSerializer(instance=obj.permissions.all(),many=True).data
