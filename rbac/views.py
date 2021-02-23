
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


class PermissionView(APIView):
    def get(self,request):
        queryset = models.Menu.objects.filter(parent_id__isnull=False )
        se = serializers.MenuPermissionSerializer(instance=queryset, many=True)
        return Response(se.data)



def permission_required(func):
    def wrapper(request, *args, **kwargs):
        print('自定义装饰器被调用了')
    return wrapper

class UserInfoView(APIView):
    authentication_classes = [TokenAuth]


    def get(self,request):
        token = {"token": None}
        token["token"] = request.META.get('HTTP_TOKEN')
        valid_data = VerifyJSONWebTokenSerializer().validate(token)
        user = valid_data['user']
        roleList = models.User.objects.filter(username = user).first()
        menuse = serializers.UserRoleSerializer(instance=roleList)
        result = {
            "code":200,
            "msg":"ok",
            "data":{"username":roleList.username,
                    "menu":menuse.data['menu'],
                    "permission":menuse.data['permissions'],
                    "router":menuse.data['router']}
        }
        return Response(result)