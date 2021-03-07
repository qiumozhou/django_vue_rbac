from functools import wraps

from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

# Create your views here.
from django.utils.decorators import method_decorator
from django.views import View
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_jwt.serializers import VerifyJSONWebTokenSerializer

from rbac import models, serializers
from rbac.auth import TokenAuth
from rbac.permissions import permission_required
from rbac.utils import initMenu





class UserInfoView(APIView):
    authentication_classes = [TokenAuth]

    # 获取用户信息
    def get(self,request):
        token = {"token": None}
        token["token"] = request.META.get('HTTP_TOKEN')
        valid_data = VerifyJSONWebTokenSerializer().validate(token)
        user = valid_data['user']
        roleList = models.User.objects.filter(username = user).first()
        menuse = serializers.UserRoleSerializer(instance=roleList)
        request.session['permission'] = menuse.data['permissions']
        result = {
            "code":200,
            "msg":"ok",
            "data":{"username":roleList.username,
                    "menu":menuse.data['menu'],
                    "permission":menuse.data['permissions'],
                    "router":menuse.data['router']}
        }
        return Response(result)



class UserListView(APIView):
    authentication_classes = [TokenAuth]
    #获取用户列表
    def get(self, request):

        obj = models.User.objects.all()
        se = serializers.UserSerializer(instance=obj, many=True)
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)

    @permission_required("user_add")
    #新增用户
    def post(self,request):
        data = request.data
        se = serializers.UserSerializer(data=data)
        se.is_valid(raise_exception=True)
        se.save()
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)





class UserView(APIView):
    authentication_classes = [TokenAuth]

   #查看用户详情
    @permission_required("user_view")
    def get(self, request, uid):
        obj = models.User.objects.all()
        se = serializers.UserSerializer(instance=obj,many=True)
        result={
            "code":10001,
            "data":se.data,
            "msg":"ok"
        }
        return Response(result)

   #修改用户信息
    @permission_required("user_reset")
    def put(self,request,uid):
        data = request.data
        userbj = models.User.objects.filter(id = uid).first()
        se = serializers.UserSerializer(instance=userbj,data = data)
        se.is_valid(raise_exception=True)
        se.save()
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)



class RoleListView(APIView):
    authentication_classes = [TokenAuth]
    #获取角色列表
    def get(self, request):
        roledata = models.Role.objects.all()
        se = serializers.RoleListSerializer(instance=roledata,many=True)
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)

    #添加新角色
    def post(self,request):
        data = request.data
        se = serializers.RoleSerializer(data=data)
        se.is_valid(raise_exception = True)
        se.save()
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)


class RoleView(APIView):
    authentication_classes = [TokenAuth]

    #查看角色详情
    @permission_required("role_view")
    def get(self, request,uid):
        roledata = models.Role.objects.filter(id=uid).first()
        se = serializers.RoleSerializer(instance=roledata)
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)

    #修改角色信息
    @permission_required("role_reset")
    def put(self,request,uid):
        per_obj = models.Role.objects.filter(id=uid).first()
        per_data = request.data
        se = serializers.RoleSerializer(instance=per_obj, data=per_data)
        se.is_valid(raise_exception=True)
        se.save()
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)

    #删除角色
    @permission_required("role_delete")
    def delete(self,request,uid):
        obj = models.Role.objects.filter(id = uid).first()
        obj.delete()
        result = {
            "code": 10001,
            "msg": "ok"
        }
        return Response(result)



class PermissionListView(APIView):
    authentication_classes = [TokenAuth]

    #查看权限列表
    def get(self, request):
        permissiondata = models.Permission.objects.all()
        se = serializers.PermissionListSerializer(instance=permissiondata, many=True)
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)

    #新增权限
    @permission_required("permission_add")
    def post(self,request):
        data = request.data
        se = serializers.PermissionSerializer(data=data)
        se.is_valid(raise_exception=True)
        se.save()
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)


class PermissionView(APIView):
    authentication_classes = [TokenAuth]

    #修改权限
    @permission_required("permission_reset")
    def put(self,request,uid):
        per_obj = models.Permission.objects.filter(id = uid).first()
        per_data = request.data
        se = serializers.PermissionSerializer(instance=per_obj,data=per_data)
        se.is_valid(raise_exception=True)
        se.save()
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)

    #删除权限
    @permission_required("permission_delete")
    def delete(self,request,uid):
        obj = models.Permission.objects.filter(id = uid).first()
        obj.delete()
        result = {
            "code": 10001,
            "msg": "ok"
        }
        return Response(result)



class MenuListView(APIView):

    #获取菜单列表
    def get(self,request):
        queryset = models.Menu.objects.filter(parent_id__isnull = False)
        se = serializers.MenuSerializer(instance=queryset,many=True)
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)
    
    #新增菜单
    def post(self,request):
        data = request.data
        se = serializers.MenuSerializer(data = data)
        se.is_valid(raise_exception=True)
        se.save()
        result = {
                    "code": 10001,
                    "data": se.data,
                    "msg": "ok"
                }
        return Response(result)



class MenuView(APIView):
    authentication_classes = [TokenAuth]
    #修改菜单
    def put(self,request,uid):
        obj = models.Menu.objects.filter(id = uid).first()
        data = request.data
        se = serializers.MenuSerializer(instance=obj,data = data)
        se.is_valid(raise_exception=True)
        se.save()
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)

    #删除菜单
    def delete(self,request,uid):
        obj = models.Menu.objects.filter(id = uid).first()
        obj.delete()
        result = {
            "code": 10001,
            "msg": "ok"
        }
        return Response(result)



class TreemenuView(APIView):

    #获取结构化菜单列表
    def get(self,request):
        queryset = models.Menu.objects.all()
        se = serializers.MenuSerializer(instance=queryset,many=True)
        result = {
            "code": 10001,
            "data": initMenu(se.data),
            "msg": "ok"
        }
        return Response(result)

class RootMenuView(APIView):

    # 获取根菜单课表
    def get(self,request):
        queryset = models.Menu.objects.filter(parent_id__isnull=True)
        se = serializers.MenuSerializer(instance=queryset, many=True)
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)