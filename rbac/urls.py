from django.conf.urls import url
from rest_framework_jwt.views import obtain_jwt_token

from rbac import views

urlpatterns=[
    url(r'token/',views.TokenView.as_view()),
    url(r'menu/',views.MenuView.as_view()),
    url(r'permission/',views.PermissionView.as_view()),
    url(r"login/", obtain_jwt_token),
    url(r"userinfo/", views.UserInfoView.as_view()),
]