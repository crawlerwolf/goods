# Generated by Django 3.2.12 on 2022-03-17 10:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('application', '0007_alter_application_options'),
    ]

    operations = [
        migrations.AddField(
            model_name='application',
            name='is_receive',
            field=models.BooleanField(blank=True, default=False, help_text='是否已领取', null=True, verbose_name='是否已领取'),
        ),
    ]
