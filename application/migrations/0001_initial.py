# Generated by Django 3.2.12 on 2022-03-15 09:55

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Application',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('good_name', models.CharField(help_text='物品名称', max_length=255, verbose_name='物品名称')),
                ('good_type', models.CharField(help_text='物品规格', max_length=255, verbose_name='物品规格')),
                ('good_num', models.IntegerField(default=1, help_text='物品数量', verbose_name='物品数量')),
                ('good_use', models.CharField(help_text='物品用途', max_length=255, verbose_name='物品用途')),
                ('application_department', models.CharField(help_text='申请部门', max_length=255, verbose_name='申请部门')),
                ('application_date', models.DateField(help_text='申请日期', verbose_name='申请日期')),
                ('application_mark', models.CharField(help_text='申请备注', max_length=255, verbose_name='申请备注')),
                ('receive_department', models.CharField(help_text='领用部门', max_length=255, verbose_name='领用部门')),
                ('receive_date', models.DateField(help_text='领用日期', verbose_name='领用日期')),
                ('divide_mark', models.CharField(help_text='分发备注', max_length=255, verbose_name='分发备注')),
                ('application_user', models.ForeignKey(help_text='申请人', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='application_user', to=settings.AUTH_USER_MODEL, verbose_name='申请人')),
                ('divide_use', models.ForeignKey(help_text='分发人', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='divide_use', to=settings.AUTH_USER_MODEL, verbose_name='分发人')),
                ('receive_user', models.ForeignKey(help_text='领用人', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='receive_user', to=settings.AUTH_USER_MODEL, verbose_name='领用人')),
            ],
        ),
    ]
