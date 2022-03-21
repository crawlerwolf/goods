# -*- coding: utf-8 -*-
from dingtalkchatbot.chatbot import DingtalkChatbot

from django.conf import settings


def send_ding_talk(message, at_mobiles=[], at_dingtalk_ids=[], is_at_all=False, is_auto_at=True):
    """
    text类型
        :param message: 消息内容
        :param at_mobiles: 被@人的手机号（注意：可以在msg内容里自定义@手机号的位置，也支持同时@多个手机号，可选）
        :param at_dingtalk_ids: 被@人的dingtalkId（可选）
        :param is_at_all: @所有人时：true，否则为false（可选）
        :param is_auto_at: 是否自动在msg内容末尾添加@手机号，默认自动添加，可设置为False取消（可选）
    """
    # 钉钉群自定义机器人webhook地址
    webhook = settings.DINGTALK_WEB_HOOK

    # 初始化机器人
    if not settings.DINGTALK_SECRET:
        # 机器人安全设置页面未勾选“加签”时
        xiaoding = DingtalkChatbot(webhook)
    else:
        # 机器人安全设置页面勾选“加签”时需要传入的密钥--v1.5以上新功能
        xiaoding = DingtalkChatbot(webhook, secret=settings.DINGTALK_SECRET)

    # Text消息
    xiaoding.send_text(msg='通知:{msg}'.format(msg=message), is_at_all=is_at_all, at_mobiles=at_mobiles,
                       at_dingtalk_ids=at_dingtalk_ids, is_auto_at=is_auto_at)
