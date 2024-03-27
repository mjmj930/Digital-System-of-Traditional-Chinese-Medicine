import requests
from bs4 import BeautifulSoup

# 草药信息页面的URL
url = 'https://sys01.lib.hkbu.edu.hk/cmed/mmid/detail.php?sort=name_cht&page=1&fac_type_cht=%E5%85%A8%E8%8D%89%E9%A1%9E&lang=chs&pid=B00261'

# 发送HTTP请求获取网页内容
response = requests.get(url)
soup = BeautifulSoup(response.text, 'html.parser')

# 假设每种草药的信息都在一个类为"herb-info"的div标签内
herb_info_list = soup.find_all('div', class_='herb-info')

for herb_info in herb_info_list:
    # 假设名称、拼音等都在相应的span标签内
    name = herb_info.find('span', class_='name').text
    pinyin = herb_info.find('span', class_='pinyin').text
    english = herb_info.find('span', class_='english').text
    latin = herb_info.find('span', class_='latin').text
    # ... 其他属性

    # 处理和存储每种草药的信息
    print(f'名称: {name}, 拼音: {pinyin}, 英文: {english}, 拉丁: {latin}')
    # 将信息存储到CSV或数据库中

# 如果信息跨多个页面，可能需要添加代码来处理翻页