# Generated by Django 3.2.12 on 2022-03-21 13:31

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('application', '0013_alter_application_options'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='application',
            options={'permissions': [('csv', '导出csv格式数据'), ('json', '导出json格式数据'), ('notify', '物品达到'), ('receive', '物品领取')], 'verbose_name': '物品详情', 'verbose_name_plural': '物品详情'},
        ),
    ]
