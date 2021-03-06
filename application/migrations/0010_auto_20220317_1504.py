# Generated by Django 3.2.12 on 2022-03-17 15:04

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('application', '0009_auto_20220317_1236'),
    ]

    operations = [
        migrations.AddField(
            model_name='application',
            name='purchase_date',
            field=models.DateField(help_text='采购日期', null=True, verbose_name='采购日期'),
        ),
        migrations.AddField(
            model_name='application',
            name='purchase_user',
            field=models.ForeignKey(blank=True, help_text='采购人', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='purchase_user', to=settings.AUTH_USER_MODEL, verbose_name='采购人'),
        ),
        migrations.AddField(
            model_name='application',
            name='reach_date',
            field=models.DateField(help_text='到货日期', null=True, verbose_name='到货日期'),
        ),
    ]
