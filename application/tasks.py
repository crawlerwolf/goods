# -*- coding: utf-8 -*-
from celery import shared_task

from .dingtalk import send_ding_talk
from sentry_sdk import capture_exception

@shared_task
def send_ding_talk_msg(msg,  at_mobiles=[], at_dingtalk_ids=[], is_at_all=False, is_auto_at=True):
    """
    :param message: 消息内容
    :param at_mobiles: 被@人的手机号（注意：可以在msg内容里自定义@手机号的位置，也支持同时@多个手机号，可选）
    :param at_dingtalk_ids: 被@人的dingtalkId（可选）
    :param is_at_all: @所有人时：true，否则为false（可选）
    :param is_auto_at: 是否自动在msg内容末尾添加@手机号，默认自动添加，可设置为False取消（可选）
    """
    send_ding_talk(msg, is_at_all=is_at_all, at_mobiles=at_mobiles,
                   at_dingtalk_ids=at_dingtalk_ids, is_auto_at=is_auto_at)


@shared_task
def send_sentry_msg(msg):
    capture_exception(msg)
