# -*- coding: utf-8 -*-
import pymysql
import csv

# 建立与MySQL的连接
connection = pymysql.connect(
    host='localhost',
    user='root',
    password='123456',
    charset='utf8mb4'
)

try:
    with connection.cursor() as cursor:
        # 创建数据库
        cursor.execute("CREATE DATABASE IF NOT EXISTS herbal_db")
        cursor.execute("USE herbal_db")

        # 创建表
        create_table_query = """
        CREATE TABLE IF NOT EXISTS herbal_info (
            name VARCHAR(255),
            pinyin VARCHAR(255),
            english_name VARCHAR(255),
            latin_name VARCHAR(255),
            category VARCHAR(255),
            source TEXT,
            origin VARCHAR(255),
            description TEXT,
            quality VARCHAR(255),
            properties VARCHAR(255),
            indications TEXT
        )
        """
        cursor.execute(create_table_query)

        # 从CSV文件导入数据
        with open('herbal_info.csv', 'r', encoding='utf-8') as file:
            csv_data = csv.reader(file)
            next(csv_data)  # 跳过标题行
            for row in csv_data:
                insert_query = "INSERT INTO herbal_info VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                cursor.execute(insert_query, row)

        connection.commit()
        print("数据已成功导入MySQL!")

finally:
    connection.close()