# Generated by Django 3.1.4 on 2021-02-27 09:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rbac', '0003_remove_permission_model'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='permission',
            name='method',
        ),
        migrations.AddField(
            model_name='permission',
            name='is_root',
            field=models.IntegerField(default=1),
        ),
    ]