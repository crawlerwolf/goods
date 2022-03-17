# -*- coding: utf-8 -*-

default_fieldsets = [
    (None, {'fields': [('good_name', 'good_type'), ('good_use', 'good_num')]}),
    (u'物品申请', {'fields': [('application_department', 'application_user'), 'application_date', 'application_mark']}),
    (u'物品采购', {'fields': [('is_purchase', 'is_reach')]}),
    (u'物品领取', {'fields': [('receive_department', 'receive_user'), ('receive_date', 'is_receive'),
                          'divide_use', 'divide_mark']})
             ]

application_fieldsets = [
    (None, {'fields': [('good_name', 'good_type'), ('good_num', 'good_use')]}),
    (u'物品申请', {'fields': ['application_department', 'application_mark']})
             ]

purchase_fieldsets = [
    (None, {'fields': [('good_name', 'good_type'), ('good_num', 'good_use')]}),
    (u'物品申请', {'fields': [('application_department', 'application_user'), 'application_date', 'application_mark']}),
    (u'物品采购', {'fields': [('is_purchase', 'is_reach')]})
             ]

receive_fieldsets = [
    (None, {'fields': [('good_name', 'good_type'), ('good_num', 'good_use')]}),
    (u'物品申请', {'fields': [('application_department', 'application_user'), 'application_date', 'application_mark']}),
    (u'物品采购', {'fields': [('is_purchase', 'is_reach')]}),
    (u'物品领取', {'fields': [('receive_department', 'receive_user'), 'is_receive', 'divide_mark']})
             ]

purchase_readonly_fields = ('good_name', 'good_type', 'good_num', 'good_use', 'application_department',
                           'application_user', 'application_date', 'application_mark')

receive_readonly_fields = ('good_name', 'good_type', 'good_num', 'good_use', 'application_department',
                           'application_user', 'application_date', 'application_mark','is_purchase', 'is_reach')

export_table_fields_csv = ('good_name', 'good_type', 'good_num', 'good_use', 'application_department',
                           'application_user', 'application_date', 'application_mark', 'receive_department',
                           'receive_user', 'receive_date', 'divide_use', 'divide_mark')

export_table_fields_json = ('good_name', 'good_type', 'good_num', 'good_use', 'application_department',
                            'application_user', 'application_date', 'application_mark', 'receive_department',
                            'receive_user', 'receive_date', 'divide_use', 'divide_mark')

