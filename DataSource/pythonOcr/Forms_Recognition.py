

#    D:\Digital-System-of-Traditional-Chinese-Medicine\DataSource\pythonOcr\images\test_02a.png
#
# 59237617
# fVyPdu4rDO188KetCjUewzjS
# FqrPV6yQ7y8s2FVaTvzsTmLsMNG7Ftg5




# encoding:utf-8

import requests
import base64
import pandas as pd

'''
表格文字识别
'''

request_url = "https://aip.baidubce.com/rest/2.0/ocr/v1/table"
# 二进制方式打开图片文件
f = open('test_02a.png', 'rb')
img = base64.b64encode(f.read())

params = {"image":img}
access_token = '24.9c7e5fa496b39b3b031d045eec6c586a.2592000.1714986920.282335-59237617'
request_url = request_url + "?access_token=" + access_token
headers = {'content-type': 'application/x-www-form-urlencoded'}
response = requests.post(request_url, data=params, headers=headers)
if response:
    print (response.json())

