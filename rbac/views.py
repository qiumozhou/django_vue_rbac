from django.shortcuts import render

# Create your views here.
from django.views import View


class TokenView(View):
    def get(self,request):
        return "ok"