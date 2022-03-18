# -*- coding: utf-8 -*-
import logging
import time

logger = logging.getLogger(__name__)


class PerformanceLoggerMiddleware:
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
        logger.info("duration:%s url:%s parameters:%s", duration, request.path, request.GET.dict())

        # Code to be executed for each request/response after
        # the view is called.

        return response