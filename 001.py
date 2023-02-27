#!/usr/bin/env python3 
# -*- coding: utf8 -*-
# python >=3.8
import urllib.request
import urllib.parse
import random
# 步数默认96000 至97999 随机数，可以自行修改。
# 接口限制，最高不得超过 98000。
 
step =random.randint(96000,97999)
# 账号
user = "17674505208"
# 密码 
password = "ljhnchina0"
if __name__ == '__main__':
    main()
 
def main():
    base_url = "https://apis.jxcxin.cn/api/mi?"
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36',
        'host': 'apis.jxcxin.cn',
        'Accept': '*/*',
    }
    data = {
        "user": user,
        "password": password,
        'step': step,
        'ver': 'cxydzsv3.1',
    }
    new_data = urllib.parse.urlencode(data)
    url = base_url + new_data
    request = urllib.request.Request(url=url,headers=headers)
    response = urllib.request.urlopen(request)
    content = response.read().decode("utf-8")
    print(content)
 
 
#腾讯云函数
def main_handler(event, context):
    return main()
 
#阿里云函数
def handler(event, context):
    return main()