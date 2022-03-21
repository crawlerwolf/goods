# -*- coding: utf-8 -*-
from .base import *

ALLOWED_HOSTS = ["127.0.0.1"]

DEBUG = True

SECRET_KEY = 'django-insecure-cg^wi*8p!14d1%i^49d@tn855#@2e@-+5^%^0&--_yh#b1ndul'

INSTALLED_APPS += ()


DINGTALK_WEB_HOOK = ""
DINGTALK_SECRET = ""

CELERY_BROKER_URL = 'redis://127.0.0.1:6379/0'
CELERY_RESULT_BACKEND = 'redis://127.0.0.1:6379/1'
CELERY_ACCEPT_CONTENT = ['application/json']
CELERY_RESULT_SERIALIZER = 'json'
CELERY_TASK_SERIALIZER = 'json'
CELERY_TIMEZONE = 'Asia/Shanghai'
CELERYD_MAX_TASKS_PER_CHILD = 10
CELERYD_LOG_FILE = os.path.join(BASE_DIR, "logs", "celery_work.log")
