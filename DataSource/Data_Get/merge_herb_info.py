# -*- coding: utf-8 -*-
import pandas as pd

# 读入多个CSV文件
files = ['herbal_info_part1.csv', 'herbal_info_part2.csv', 'herbal_info_part3.csv', 'herbal_info_part4.csv']
dfs = [pd.read_csv(f) for f in files]

# 合并所有文件
df = pd.concat(dfs)

# 去除重复行
df.drop_duplicates(inplace=True)

# 写入新的CSV文件
df.to_csv('herbal_info.csv', index=False, encoding='utf_8_sig')


# 合并获取到的所有草药csv文件