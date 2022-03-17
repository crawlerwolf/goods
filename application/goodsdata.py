# -*- coding: utf-8 -*-

default_list_display = ('good_name', 'good_type', 'good_num', 'good_use', 'application_department', 'application_user',
                        'application_date', 'is_purchase', 'is_reach', 'receive_department', 'receive_user',
                        'receive_date', 'divide_use', 'is_receive')

purchase_list_display = ('good_name', 'good_type', 'good_num', 'good_use', 'application_department', 'application_user',
                         'application_date', 'is_purchase', 'purchase_date', 'is_reach', 'reach_date', 'purchase_user',
                         'receive_department', 'receive_user', 'receive_date', 'divide_use', 'is_receive')

default_fieldsets = [
    (None, {'fields': [('good_name', 'good_type'), ('good_use', 'good_num')]}),
    (u'物品申请', {'fields': [('application_department', 'application_user'), 'application_date', 'application_mark']}),
    (u'物品采购', {'fields': [('is_purchase', 'purchase_date'), ('is_reach', 'reach_date'), 'purchase_user']}),
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
    (u'物品采购', {'fields': [('is_purchase', 'purchase_date'), ('is_reach', 'reach_date')]})
             ]

receive_fieldsets = [
    (None, {'fields': [('good_name', 'good_type'), ('good_num', 'good_use')]}),
    (u'物品申请', {'fields': [('application_department', 'application_user'), 'application_date', 'application_mark']}),
    (u'物品采购', {'fields': [('is_purchase', 'purchase_date'), ('is_reach', 'reach_date'), 'purchase_user']}),
    (u'物品领取', {'fields': [('receive_department', 'receive_user'), 'is_receive', 'divide_mark']})
             ]

purchase_readonly_fields = ('good_name', 'good_type', 'good_num', 'good_use', 'application_department',
                            'application_user', 'application_date', 'application_mark')

receive_readonly_fields = ('good_name', 'good_type', 'good_num', 'good_use', 'application_department',
                           'application_user', 'application_date', 'application_mark', 'is_purchase', 'is_reach',
                           'purchase_user', 'purchase_date', 'reach_date')

export_table_fields_csv = ('good_name', 'good_type', 'good_num', 'good_use', 'application_department',
                           'application_user', 'application_date', 'application_mark', 'receive_department',
                           'receive_user', 'receive_date', 'divide_use', 'divide_mark', 'is_receive')

purchase_export_table_fields_csv = ('good_name', 'good_type', 'good_num', 'good_use', 'application_department',
                                    'application_user', 'application_date', 'application_mark',
                                    'is_purchase', 'purchase_date', 'is_reach', 'reach_date', 'purchase_user')

admin_export_table_fields_csv = ('good_name', 'good_type', 'good_num', 'good_use', 'application_department',
                                 'application_user', 'application_date', 'is_purchase', 'purchase_date', 'is_reach',
                                 'reach_date', 'purchase_user', 'receive_department', 'receive_user', 'receive_date',
                                 'divide_use', 'is_receive')

export_table_fields_json = export_table_fields_csv

purchase_export_table_fields_json = purchase_export_table_fields_csv

admin_export_table_fields_json = admin_export_table_fields_csv

