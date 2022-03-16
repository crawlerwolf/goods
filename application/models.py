# _*_ coding: utf-8 _*_
from datetime import datetime

from django.db import models
from django.contrib.auth.models import User

# Create your models here.


class Application(models.Model):
    # 物品申请
    good_name = models.CharField(verbose_name=u'物品名称', help_text=u'物品名称', max_length=255)
    good_type = models.CharField(verbose_name=u'物品规格', help_text=u'物品规格', max_length=255)
    good_num = models.IntegerField(verbose_name=u'物品数量', help_text=u'物品数量', default=1)
    good_use = models.CharField(verbose_name=u'物品用途', help_text=u'物品用途', max_length=255)
    application_department = models.CharField(verbose_name=u'申请部门', help_text=u'申请部门', max_length=255)
    application_user = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='application_user',
                                         verbose_name=u'申请人', help_text=u'申请人', null=True)
    application_date = models.DateField(verbose_name=u'申请日期', help_text=u'申请日期', default=datetime.now)
    application_mark = models.CharField(verbose_name=u'申请备注', help_text=u'申请备注', max_length=255,
                                        null=True, blank=True)

    # 物品领取
    receive_department = models.CharField(verbose_name=u'领用部门', help_text=u'领用部门', max_length=255)
    receive_user = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='receive_user',
                                     verbose_name=u'领用人', help_text=u'领用人', null=True)
    receive_date = models.DateField(verbose_name=u'领用日期', help_text=u'领用日期', null=True)
    divide_use = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='divide_use',
                                   verbose_name=u'分发人', help_text=u'分发人', null=True)
    divide_mark = models.CharField(verbose_name=u'分发备注', help_text=u'分发备注', max_length=255,
                                   null=True, blank=True)

    def __str__(self):
        return self.good_name

    class Meta:
        verbose_name = u'物品详情'
        verbose_name_plural = verbose_name
        permissions = [('csv', u'导出csv格式数据'),
                       ('json', u'导出json格式数据')
                       ]
