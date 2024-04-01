from aip import AipOcr   # 导入第一步安装的库
APP_ID = '58773347'
API_KEY = 'jwEHnT7Amapachc0OQE13fry'
SECRET_KEY = 'uCXksJ6EZgIcPH5cMZlzqqLvLdiRAeTg'
# D:/Digital-System-of-Traditional-Chinese-Medicine/DataSource/pythonOcr/images/test_02.png
client = AipOcr(APP_ID, API_KEY, SECRET_KEY)   # 根据 API key 生成客户端

img = open("/pythonOcr/images/test_02.png", 'rb').read() # 以二进制方式打开图片
table = client.tableRecognitionAsync(img)       # 调用 API 表格服务
print(table)  # 查看 API 返回结果
