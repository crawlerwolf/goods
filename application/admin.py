import csv
import io
import json
import datetime
import logging

from django.contrib import admin
from django.http import HttpResponse
from django.contrib.auth.models import User

from .models import Application

from application import goodsdata as gd
# Register your models here.

logger = logging.getLogger(__name__)


class DateUserBoolEnconding(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, datetime.date):
            return o.strftime('%Y-%m-%d')
        if isinstance(o, User):
            return o.username
        if isinstance(o, bool):
            if o:
                return u'是'
            return u'否'


class UserAdmin(admin.ModelAdmin):
    search_fields = ('username',)
    ordering = ('username',)


class ApplicationAdmin(admin.ModelAdmin):

    list_filter = ('application_user', 'application_date', 'receive_department', 'is_purchase', 'is_reach',
                   'receive_user', 'receive_date', 'divide_use')

    search_fields = ('good_name', 'application_user__username', 'application_date', 'receive_department',
                     'receive_user__username', 'receive_date', 'divide_use__username')

    autocomplete_fields = ('receive_user', 'divide_use')

    ordering = ('is_purchase', 'is_reach', 'is_receive')

    actions = ['export_model_as_csv', 'export_model_as_json']

    @admin.action(permissions=['csv'], description=u'导出为csv')
    def export_model_as_csv(self, request, queryset):
        group_names = self.get_group_names(request.user)
        response = HttpResponse(content_type='text/csv')
        response.charset = 'utf-8-sig' if "Windows" in request.headers.get('User-Agent') else 'utf-8'
        if request.user.is_superuser:
            filed_list = gd.admin_export_table_fields_csv
        elif 'purchase' in group_names:
            filed_list = gd.purchase_export_table_fields_csv
        else:
            filed_list = gd.export_table_fields_csv
        response['Content-Disposition'] = "attachment; filename=goods-dates-list-%s.csv" % (
            datetime.datetime.now().strftime("%Y-%m-%d %H/%M/%S")
        )

        # 写入表头
        writer = csv.writer(response)
        writer.writerow(
            [queryset.model._meta._forward_fields_map.get(f).verbose_name for f in filed_list]
        )

        for obj in queryset:
            csv_line_values = []
            for filed in filed_list:
                filed_value = getattr(obj, filed)
                csv_line_values.append(filed_value)
            writer.writerow(csv_line_values)
        logger.info('账户{user}导出{nums}条物品记录-csv'.format(user=request.user, nums=len(queryset)))

        return response

    def has_csv_permission(self, request):
        """Does the user have the csv permission?"""
        opts = self.opts
        return request.user.has_perm('%s.%s' % (opts.app_label, 'csv'))

    @admin.action(permissions=['json'], description=u'导出为json')
    def export_model_as_json(self, request, queryset):
        group_names = self.get_group_names(request.user)
        response = HttpResponse(content_type='application/json')
        response['Content-Disposition'] = "attachment; filename=goods-dates-list-%s.json" % (
            datetime.datetime.now().strftime("%Y-%m-%d %H/%M/%S")
        )
        if request.user.is_superuser:
            filed_list = gd.admin_export_table_fields_json
        elif 'purchase' in group_names:
            filed_list = gd.purchase_export_table_fields_json
        else:
            filed_list = gd.export_table_fields_json

        file = io.StringIO()
        for obj in queryset:
            json_line_values = {}
            for filed in filed_list:
                json_line_values[filed] = getattr(obj, filed)
            data = json.dumps(json_line_values, cls=DateUserBoolEnconding, ensure_ascii=False)
            file.write(data)
            file.write("\n")
        response.write(file.getvalue())
        file.close()
        logger.info(u'账户{user}导出{nums}条物品记录-json'.format(user=request.user, nums=len(queryset)))
        return response

    def has_json_permission(self, request):
        """Does the user have the json permission?"""
        opts = self.opts
        return request.user.has_perm('%s.%s' % (opts.app_label, 'json'))

    def get_readonly_fields(self, request, obj=None):
        group_names = self.get_group_names(request.user)

        if 'purchase' in group_names:
            if request.path.endswith('change/') and obj.application_user != request.user:
                return gd.purchase_readonly_fields
        if 'cashier' in group_names:
            if request.path.endswith('change/') and obj.application_user != request.user:
                return gd.receive_readonly_fields
        return ()

    def get_fieldsets(self, request, obj=None):
        group_names = self.get_group_names(request.user)
        if 'cashier' in group_names:
            if request.path.endswith('change/') and obj.application_user != request.user:
                return gd.receive_fieldsets
            return gd.application_fieldsets
        if 'purchase' in group_names:
            if request.path.endswith('change/') and obj.application_user != request.user:
                return gd.purchase_fieldsets
            return gd.application_fieldsets
        if 'staff' in group_names:
            return gd.application_fieldsets
        return gd.default_fieldsets

    def get_list_display(self, request):
        group_names = self.get_group_names(request.user)
        if 'purchase' in group_names or request.user.is_superuser:
            return gd.purchase_list_display
        return gd.default_list_display

    def get_list_editabel(self, request):
        group_names = self.get_group_names(request.user)
        if 'cashier' in group_names or request.user.is_superuser:
            return ('receive_department', 'receive_user', 'divide_mark', 'is_receive')
        if 'purchase' in group_names or request.user.is_superuser:
            return ('is_purchase', 'is_reach', 'purchase_date', 'reach_date')
        return ()

    def get_changelist_instance(self, request):
        self.list_editable = self.get_list_editabel(request)
        return super(ApplicationAdmin, self).get_changelist_instance(request)

    def get_group_names(self, user):
        # 获取用户组名
        group_names = []
        for g in user.groups.all():
            group_names.append(g.name)
        return group_names

    def get_queryset(self, request):
        qs = super(ApplicationAdmin, self).get_queryset(request)

        group_names = self.get_group_names(request.user)
        if 'staff' in group_names:
            return Application.objects.filter(application_user=request.user)
        return qs

    def save_model(self, request, obj, form, change):
        group_names = self.get_group_names(request.user)

        if 'cashier' in group_names:
            if request.path.endswith('add/'):
                obj.application_user = request.user
            else:
                obj.divide_use = request.user
                obj.receive_date = datetime.datetime.now()
        if 'purchase' in group_names:
            if request.path.endswith('add/'):
                obj.application_user = request.user
            else:
                obj.purchase_user = request.user
        if 'staff' in group_names:
            obj.application_user = request.user
        obj.save()


admin.site.unregister(User)
admin.site.register(User, UserAdmin)
admin.site.register(Application, ApplicationAdmin)
