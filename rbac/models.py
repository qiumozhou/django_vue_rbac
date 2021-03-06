import datetime

from django.contrib.auth.models import AbstractUser
from django.db import models

# Create your models here.



class User(AbstractUser):
    GENDER_TYPE = (
        (1, "男"),
        (2, "女")
    )
    username = models.CharField(max_length=30,unique=True)
    password = models.TextField()
    email = models.CharField(max_length=30)
    gender = models.IntegerField(choices=GENDER_TYPE,default=1)
    is_active = models.IntegerField(default=1)
    is_admin = models.IntegerField(default=0)
    last_login = models.DateTimeField(auto_now=True)

    @property
    def roles(self):
        return self.roles.values("id").all()

    def __str__(self):
        return self.username

    class Meta:
        db_table = 'tb_user'
        verbose_name_plural = "用户"


class Menu(models.Model):
    name = models.CharField(max_length=50,null=True,blank=True)
    title = models.CharField(max_length=50,null=True,blank=True)
    path = models.CharField(max_length=50,null=True,blank=True)
    icon = models.CharField(max_length=50)
    component = models.CharField(max_length=50,null=True,blank=True)
    parent_id = models.ForeignKey('self',null=True,blank=True,on_delete=models.CASCADE)



    def __str__(self):
        return self.title

    class Meta:
        db_table = 'tb_menu'
        verbose_name_plural = "菜单"


class Permission(models.Model):
    name = models.CharField(max_length=20)
    is_root =  models.IntegerField(default=1)
    code = models.CharField(max_length=30,default=1)
    menu = models.ForeignKey("Menu",on_delete=models.CASCADE,related_name="permissions")

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'tb_permission'
        verbose_name_plural = "权限"


class Role(models.Model):
    name = models.CharField(max_length=20)
    users = models.ManyToManyField("User",related_name="roles",blank=True,null=True)
    menus = models.ManyToManyField("Menu",related_name="roles",blank=True,null=True)
    permissions = models.ManyToManyField("permission",related_name="roles",blank=True,null=True)

    @property
    def menu(self):
        return self.menus.values("title","id").filter(parent_id__isnull = False).all()

    @property
    def permission(self):
        return self.permissions.values("name","id").all()



    def __str__(self):
        return self.name

    class Meta:
        db_table = 'tb_role'
        verbose_name_plural = "角色"