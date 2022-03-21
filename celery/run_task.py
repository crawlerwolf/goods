# -*- coding: utf-8 -*-
from tasks import add

result = add.delay(4, 4)
print('Is task ready:{}'.format(result.ready()))

ret_result = result.get(timeout=1)
print('task result:{}'.format(ret_result))
