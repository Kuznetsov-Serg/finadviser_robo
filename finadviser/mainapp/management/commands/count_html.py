#!/usr/bin/python3

from bs4 import BeautifulSoup
from bs4 import BeautifulSoup
import requests as req

resp = req.get("https://jetlend.ru")
soup = BeautifulSoup(resp.text, 'lxml')

count_teg = 0
count_attr = 0
# count_attr2 = 0
for child in soup.recursiveChildGenerator():
    # if child.attrs:
    #     count_attr2 += len(child.attrs)
    if child.name:
        count_teg += 1
        count_attr += len(child.attrs)
        print(child.name)

print(f'Если не считать (<!DOCTYPE>, <!--...-->,...), количество тэгов:{count_teg}\nКоличество атрибутов: {count_attr} и {count_attr2}')
