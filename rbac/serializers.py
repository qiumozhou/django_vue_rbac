
from rest_framework import serializers
from rest_framework.response import Response

from rbac import models
from rbac.utils import initMenu


class MenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Menu
        fields = "__all__"


class PermissionSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Permission
        fields = "__all__"



class RoleListSerializer(serializers.ModelSerializer):
    menus = serializers.ListField(source="menu")
    permissions = serializers.ListField(source="permission")
    class Meta:
        model = models.Role
        fields = "__all__"

class RoleSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Role
        fields = "__all__"


# class RoleSerializer(serializers.ModelSerializer):
#     menus = serializers.ListField(source="menuDetail")
#     class Meta:
#         model = models.Role
#         fields = "__all__"


class MenuPermissionSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    title = serializers.CharField()
    permissions = serializers.SerializerMethodField()

    def get_permissions(self,obj):
        return PermissionSerializer(instance=obj.permissions.all(),many=True).data


class UserRoleSerializer(serializers.Serializer):
    menu = serializers.SerializerMethodField()
    permissions = serializers.SerializerMethodField()
    router = serializers.SerializerMethodField()

    def get_menu(self,obj):
        rolesList = obj.roles.all()
        menuList = []
        for role in rolesList:
            singleRoleMenuList = role.menus.all()
            menuList.extend(singleRoleMenuList)
        menuListLast = []
        total = len(menuList)
        for i in range(0,total):
            for j in range(i+1,total):
                if menuList[i].id == menuList[j].id:
                    break
                if j == total-1 and menuList[i].id != menuList[j].id:
                    menuListLast.append(menuList[i])
        menuListLast.append(menuList[-1])
        se = MenuSerializer(instance=menuListLast,many=True)
        return initMenu(se.data)

    def get_permissions(self,obj):
        rolesList = obj.roles.all()
        permissionList = []
        for role in rolesList:
            rolepermission = role.permissions.all()
            permissionList.extend(rolepermission)
        permissionList = list(set(permissionList))
        return [ item['code'] for item in PermissionSerializer(instance=permissionList,many=True).data]

    def get_router(selfobj,obj):
        rolesList = obj.roles.all()
        routerList = []
        for role in rolesList:
            rolerouter = role.menus.filter(parent_id__isnull=False).all()
            routerList.extend(rolerouter)
        routerList = list(set(routerList))
        return  MenuSerializer(instance=routerList,many=True).data





class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.User
        fields = ["id","username","password","gender","date_joined","email","is_active","roles"]




class PermissionListSerializer(serializers.ModelSerializer):
    menu = serializers.CharField(source='menu.title')
    class Meta:
        model = models.Permission
        fields = ["id","name","code","is_root","menu"]

