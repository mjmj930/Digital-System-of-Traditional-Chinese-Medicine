
# encoding:utf-8

import requests
import base64
import json
import csv

'''
通用文字识别（高精度版）
'''

request_url = "https://aip.baidubce.com/rest/2.0/ocr/v1/accurate_basic"
# 二进制方式打开图片文件
f = open('D:/Digital-System-of-Traditional-Chinese-Medicine/DataSource/pythonOcr/images/test_02a.png', 'rb')
img = base64.b64encode(f.read())

params = {"image":img}
access_token = '24.d2312a0bdeeeb8072ed4946b5d66c994.2592000.1714548889.282335-59237617'
request_url = request_url + "?access_token=" + access_token
# 设置请求的HTTP头，声明我们正在发送表单编码的数据
headers = {'content-type': 'application/x-www-form-urlencoded'}
# 执行一个HTTP POST请求，发送数据并包含自定义的HTTP头
response = requests.post(request_url, data=params, headers=headers)

#检查响应是否成功

# if response:
#     print (response.json())

if response:
    try:
        # 解析JSON数据
        data = response.json()
        # 指定要写入的json文件名
        filename = 'output.json'
        # 写入文件
        with open(filename, 'w', encoding='utf-8') as f:
            # 确保写入的JSON数据为utf-8编码，确保兼容性
            json.dump(data, f, ensure_ascii=False, indent=4)
        print(f"JSON data is saved to {filename}")
    except json.JSONDecodeError:
        # 如果响应内容不是JSON格式，打印错误
        print("Response is not in JSON format.")
    except Exception as e:
        # 打印任何其他异常
        print(f"An error occurred: {e}")