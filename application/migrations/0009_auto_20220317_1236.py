# Generated by Django 3.2.12 on 2022-03-17 12:36

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('application', '0008_auto_20220317_1220'),
    ]

    operations = [
        migrations.AlterField(
            model_name='application',
            name='receive_department',
            field=models.CharField(blank=True, help_text='领用部门', max_length=255, verbose_name='领用部门'),
        ),
        migrations.AlterField(
            model_name='application',
            name='receive_user',
            field=models.ForeignKey(blank=True, help_text='领用人', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='receive_user', to=settings.AUTH_USER_MODEL, verbose_name='领用人'),
        ),
    ]