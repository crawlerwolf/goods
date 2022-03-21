# -*- coding: utf-8 -*-
from .base import *

ALLOWED_HOSTS = ["127.0.0.1"]

DEBUG = False

# 钉钉机器人配置
DINGTALK_WEB_HOOK = ""
DINGTALK_SECRET = ""

# CELERY配置
CELERY_BROKER_URL = 'redis://127.0.0.1:6379/0'
CELERY_RESULT_BACKEND = 'redis://127.0.0.1:6379/1'
CELERY_ACCEPT_CONTENT = ['application/json']
CELERY_RESULT_SERIALIZER = 'json'
CELERY_TASK_SERIALIZER = 'json'
CELERY_TIMEZONE = 'Asia/Shanghai'
CELERYD_MAX_TASKS_PER_CHILD = 10
CELERYD_LOG_FILE = os.path.join(BASE_DIR, "logs", "celery_work.log")
