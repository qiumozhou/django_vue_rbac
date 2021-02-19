from django.conf.urls import url

from rbac import views

urlpatterns=[
    url(r'token/',views.TokenView.as_view)
]