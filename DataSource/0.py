import requests
from bs4 import BeautifulSoup
import csv

base_url = "https://sys01.lib.hkbu.edu.hk/cmed/mmid/detail.php"
params = {
    "lang": "chs",
    "sort": "name_cht",
    "page": 1
}

with open('herbal_info.csv', 'w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['名称', '拼音', '英文名', '拉丁名', '类别', '来源', '产地', '性状', '品质', '性味', '功效']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()

    for pid in range(1, 421):
        pid_str = f"B{pid:05d}"
        params["pid"] = pid_str
        url = base_url + "?" + "&".join([f"{k}={v}" for k, v in params.items()])

        response = requests.get(url)
        soup = BeautifulSoup(response.content, "html.parser")

        data = {}
        for field in fieldnames:
            value = soup.select_one(f'td:contains("【{field}】") + td')
            data[field] = value.text.strip() if value else ""

        writer.writerow(data)