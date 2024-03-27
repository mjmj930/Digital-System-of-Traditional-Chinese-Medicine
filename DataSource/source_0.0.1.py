from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager

# 目标网页的URL
url = 'https://sys01.lib.hkbu.edu.hk/cmed/mmid/detail.php?sort=name_cht&page=1&fac_type_cht=%E5%85%A8%E8%8D%89%E9%A1%9E&lang=chs&pid=B00261'

# 设置Selenium WebDriver
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service)
driver.get(url)

# 等待页面加载完成
driver.implicitly_wait(10)  # 10秒内如果页面加载完成则继续，否则抛出异常

# 使用XPath定位元素
xpath = '/html/body/div[1]/table[2]/tbody/tr/td[2]/table[1]/tbody/tr/td/table/tbody/tr[1]'
herbal_name_element = driver.find_element(By.XPATH, xpath)

# 提取元素的文本
if herbal_name_element:
    herbal_name = herbal_name_element.text
    print(f'草药名称: {herbal_name}')
else:
    print('没有找到指定的XPath元素')


# 关闭WebDriver
driver.quit()