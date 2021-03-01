from django.conf.urls import url
from rest_framework_jwt.views import obtain_jwt_token

from rbac import views

urlpatterns=[
    url(r'token/',views.TokenView.as_view()),
    # url(r'menu/',views.MenuView.as_view()),
    # url(r'^get_permission/$',views.PermissionView.as_view()),
    url(r"login/", obtain_jwt_token),
    url(r"userinfo/", views.UserInfoView.as_view()),
    url(r"^user/$", views.UserListView.as_view()),
    url(r"^user/(?P<uid>\d+)/$", views.UserView.as_view()),
    url(r"^permission/$", views.PermissionListView.as_view()),
    url(r"^permission/(?P<uid>\d+)/$", views.PermissionView.as_view()),
    url(r"^role/$",views.RoleListView.as_view()),
    url(r"^role/(?P<uid>\d+)/$",views.RoleView.as_view()),
    url(r"^menu/$",views.MenuListView.as_view()),
    url(r"^treemenu/$",views.TreemenuView.as_view())
]