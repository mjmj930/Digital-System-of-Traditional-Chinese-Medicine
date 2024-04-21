# -*- coding: utf-8 -*-
import requests
from bs4 import BeautifulSoup


def get_formula_types(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')

    formula_type_elements = soup.select('.mw-headline')
    formula_types = [ele.text.strip() for ele in formula_type_elements]

    return formula_types


url = 'http://www.a-hospital.com/w/%E4%B8%AD%E8%8D%AF%E6%96%B9%E5%89%82'
types = get_formula_types(url)

print("方剂类型:")
for formula_type in types:
    print(formula_type)