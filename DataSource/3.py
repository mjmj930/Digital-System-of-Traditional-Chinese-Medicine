import requests
from bs4 import BeautifulSoup
import csv
import chardet




base_url = "https://sys01.lib.hkbu.edu.hk/cmed/mmid/detail.php"
params = {
    "lang": "chs",
    "sort": "name_cht",
    "fac_type_chs": "果实及种子类",
    "page": 1
}

with open('herbal_info_3.csv', 'w', newline='', encoding='gbk') as csvfile:
    fieldnames = ['名称', '拼音', '英文名', '拉丁名', '类别', '来源', '产地', '性状', '品质', '性味', '功效']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    # 写入字段名
    writer.writeheader()

    for pid in range(201, 300):
        pid_str = f"B0000{pid}" if pid < 10 else f"B000{pid}" if pid < 100 else f"B00{pid}"
        params["pid"] = pid_str
        url = base_url + "?" + "&".join([f"{k}={v}" for k, v in params.items()])

        response = requests.get(url)
        soup = BeautifulSoup(response.content, "html.parser")

        # 提取所需数据
        name = soup.select_one('td:contains("【名称】") + td').text.strip() if soup.select_one('td:contains("【名称】") + td') else ""
        pinyin = soup.select_one('td:contains("【拼音】") + td').text.strip() if soup.select_one('td:contains("【拼音】") + td') else ""
        english = soup.select_one('td:contains("【英文】") + td').text.strip() if soup.select_one('td:contains("【英文】") + td') else ""
        latin = soup.select_one('td:contains("【拉丁】") + td').text.strip() if soup.select_one('td:contains("【拉丁】") + td') else ""
        category = soup.select_one('td:contains("【类别】") + td').text.strip() if soup.select_one('td:contains("【类别】") + td') else ""
        source = soup.select_one('td:contains("【来源】") + td').text.strip() if soup.select_one('td:contains("【来源】") + td') else ""
        origin = soup.select_one('td:contains("【产地】") + td').text.strip() if soup.select_one('td:contains("【产地】") + td') else ""
        nature = soup.select_one('td:contains("【性状】") + td').text.strip() if soup.select_one('td:contains("【性状】") + td') else ""
        quality = soup.select_one('td:contains("【品质】") + td').text.strip() if soup.select_one('td:contains("【品质】") + td') else ""
        taste = soup.select_one('td:contains("【性味】") + td').text.strip() if soup.select_one('td:contains("【性味】") + td') else ""
        effect = soup.select_one('td:contains("【功效】") + td').text.strip() if soup.select_one('td:contains("【功效】") + td') else ""

        # 将数据写入 CSV 文件
        writer.writerow({'名称': name, '拼音': pinyin, '英文名': english, '拉丁名': latin, '类别': category, '来源': source,
                         '产地': origin, '性状': nature, '品质': quality, '性味': taste, '功效': effect})