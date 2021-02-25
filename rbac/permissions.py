from functools import wraps

from rest_framework.response import Response


def permission_required(permissionName):
    def outer(func):
        @wraps(func)
        def inner(self, request, *args, **kwargs):
            print(request.session["permission"])
            if permissionName in request.session["permission"]:
                return func(self,request,*args, **kwargs)
            else:
                return Response({"code":"10005","msg":"没有权限"})
        return inner
    return outer