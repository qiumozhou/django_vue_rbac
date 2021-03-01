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


class TokenView(APIView):
    authentication_classes = [TokenAuth]
    def get(self,request):
        print(request.user)
        return HttpResponse("ok")


class MenuView(APIView):
    def get(self,request):
        queryset = models.Menu.objects.all()
        se = serializers.MenuSerializer(instance=queryset,many=True)
        data = initMenu(se.data)
        return Response(data)


# class PermissionView(APIView):
#     def get(self,request):
#         queryset = models.Menu.objects.filter(parent_id__isnull=False)
#         se = serializers.MenuPermissionSerializer(instance=queryset, many=True)
#         return Response(se.data)





class UserInfoView(APIView):
    authentication_classes = [TokenAuth]
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

    def get(self, request):
        roledata = models.Role.objects.all()
        se = serializers.RoleListSerializer(instance=roledata,many=True)
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)


class RoleView(APIView):
    authentication_classes = [TokenAuth]

    def get(self, request,uid):
        roledata = models.Role.objects.filter(id=uid).first()
        se = serializers.RoleSerializer(instance=roledata)
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)

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


class PermissionListView(APIView):
    authentication_classes = [TokenAuth]

    def get(self, request):
        permissiondata = models.Permission.objects.all()
        se = serializers.PermissionListSerializer(instance=permissiondata, many=True)
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)

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

    def delete(self,request,uid):
        obj = models.Permission.objects.filter(id = uid).first()
        obj.delete()
        result = {
            "code": 10001,
            "msg": "ok"
        }
        return Response(result)



class MenuListView(APIView):
    def get(self,request):
        queryset = models.Menu.objects.filter(parent_id__isnull = False)
        se = serializers.MenuSerializer(instance=queryset,many=True)
        result = {
            "code": 10001,
            "data": se.data,
            "msg": "ok"
        }
        return Response(result)


class TreemenuView(APIView):

    def get(self,request):
        queryset = models.Menu.objects.all()
        se = serializers.MenuSerializer(instance=queryset,many=True)
        result = {
            "code": 10001,
            "data": initMenu(se.data),
            "msg": "ok"
        }
        return Response(result)
