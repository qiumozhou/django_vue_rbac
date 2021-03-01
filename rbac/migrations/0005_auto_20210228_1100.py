# Generated by Django 3.1.4 on 2021-02-28 03:00

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rbac', '0004_auto_20210227_1723'),
    ]

    operations = [
        migrations.AlterField(
            model_name='role',
            name='menus',
            field=models.ManyToManyField(blank=True, null=True, related_name='roles', to='rbac.Menu'),
        ),
        migrations.AlterField(
            model_name='role',
            name='permissions',
            field=models.ManyToManyField(blank=True, null=True, related_name='roles', to='rbac.Permission'),
        ),
        migrations.AlterField(
            model_name='role',
            name='users',
            field=models.ManyToManyField(blank=True, null=True, related_name='roles', to=settings.AUTH_USER_MODEL),
        ),
    ]
