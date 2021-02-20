from rest_framework.exceptions import AuthenticationFailed
from rest_framework_jwt.serializers import VerifyJSONWebTokenSerializer


class TokenAuth():
    def authenticate(self, request):
        token={"token":None}
        token["token"] = request.META.get('HTTP_TOKEN')
        valid_data = VerifyJSONWebTokenSerializer().validate(token)
        user = valid_data['user']
        if user:
            return
        else:
            raise AuthenticationFailed('认证失败')