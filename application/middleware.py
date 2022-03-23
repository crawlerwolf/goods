# -*- coding: utf-8 -*-
import logging
import time

from django.http import HttpResponse
import traceback
from sentry_sdk import capture_exception

from .tasks import send_ding_talk_msg

logger = logging.getLogger(__name__)


class PerformanceLoggerExceptionMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
        # One-time configuration and initialization.

    def __call__(self, request):
        # Code to be executed for each request before
        # the view (and later middleware) are called.

        start_time = time.time()
        response = self.get_response(request)
        duration = time.time() - start_time
        response["X-Page-Duration-ms"] = int(duration * 1000)
        parameters = {}
        method = request.META['REQUEST_METHOD']
        if method == 'GET':
            parameters = request.GET.dict()
        # if method == 'POST':
        #     parameters = request.POST.dict()
        logger.info("duration:%s  method:%s url:%s parameters:%s", duration, method,
                    request.path, parameters)
        # Code to be executed for each request/response after
        # the view is called.

        return response

    def process_exception(self, request, exception):
        if exception:
            message = "url:{url} ** msg:{error} ````{tb}````".format(
                url=request.build_absolute_uri(),
                error=repr(exception),
                tb=traceback.format_exc()
            )

            logger.warning(message)

            # send dingtalk message
            send_ding_talk_msg.delay(message)

            # capture exception to sentry:
            capture_exception(exception)

        return HttpResponse("Error processing the request, please contact the system administrator.", status=500)
