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
CELERYD_LOG_FILE = os.path.join(BASE_DIR, "celery_work.log")

import sentry_sdk
from sentry_sdk.integrations.django import DjangoIntegration

sentry_sdk.init(
    dsn="http://9f49453b5fd6442495720beb25a988a6@192.168.1.108:9000/2",
    integrations=[DjangoIntegration()],

    # Set traces_sample_rate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production.
    traces_sample_rate=1.0,

    # If you wish to associate users to errors (assuming you are using
    # django.contrib.auth) you may enable sending PII data.
    send_default_pii=True
)
