
from rest_framework import serializers

from rbac import models
from rbac.utils import initMenu


class MenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Menu
        fields = "__all__"


class PermissionSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Permission
        exclude = ["menu"]


class RoleSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Role
        exclude = ["users","menus","permissions"]


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
        return [ item['name'] for item in PermissionSerializer(instance=permissionList,many=True).data]

    def get_router(selfobj,obj):
        rolesList = obj.roles.all()
        routerList = []
        for role in rolesList:
            rolerouter = role.menus.filter(parent_id__isnull=False).all()
            routerList.extend(rolerouter)
        routerList = list(set(routerList))
        return  MenuSerializer(instance=routerList,many=True).data


class UserSerializer(serializers.ModelSerializer):
    roles = serializers.SerializerMethodField()

    class Meta:
        model = models.User
        exclude = ["password","is_superuser","first_name","last_name","is_staff","is_admin","last_login","groups","user_permissions"]

    def get_roles(self,obj):
        return RoleSerializer(instance=obj.roles.all(),many=True).data