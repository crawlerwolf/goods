# Generated by Django 3.2.12 on 2022-03-21 13:15

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('application', '0012_alter_application_options'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='application',
            options={'permissions': [('csv', '导出csv格式数据'), ('json', '导出json格式数据'), ('notify', '物品达到')], 'verbose_name': '物品详情', 'verbose_name_plural': '物品详情'},
        ),
    ]
