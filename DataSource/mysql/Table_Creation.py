# -*- coding: utf-8 -*-
import pymysql

# 建立数据库连接

connection  = pymysql.connect(
    host='localhost',
    user='root',
    password='123456',
    # database="herbalSys",
    charset='utf8mb4',
)

try:
    with connection.cursor() as cursor:
        # 创建数据库
        cursor.execute("CREATE DATABASE IF NOT EXISTS herbal_sys")
        cursor.execute("USE herbal_sys")


        #方剂类别表
        create_table_queries = """        
        CREATE TABLE herb_category (
        category_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '类别ID',
        parent_id INT COMMENT '父类别ID',
        name VARCHAR(50) NOT NULL COMMENT '类别名称',
        code VARCHAR(20) UNIQUE COMMENT '类别编码',
        level TINYINT UNSIGNED COMMENT '类别层级',
        description VARCHAR(255) COMMENT '类别描述',
        category_create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        category_update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        FOREIGN KEY (parent_id) REFERENCES herb_category(category_id)
    );
            """
        cursor.execute(create_table_queries)


        #药材基本信息表
        create_table_queries = """
        CREATE TABLE IF NOT EXISTS herb_basic_info (
        herb_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '药材id',
        name VARCHAR(50) NOT NULL UNIQUE COMMENT '名称',
        pinyin VARCHAR(50) COMMENT '拼音',
        alias JSON COMMENT '别名',
        latin_name VARCHAR(100) COMMENT '拉丁名',
        category_id INT COMMENT '药材类别ID',
        origin VARCHAR(255) COMMENT '来源地',
        harvest_process TEXT COMMENT '加工方法',
        description TEXT COMMENT '性状描述',
        herb_image VARCHAR(255) COMMENT '药材图片',
        info_create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        info_update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' 
);
        """
        cursor.execute(create_table_queries)

        #药材产地信息表
        create_table_queries = """
        CREATE TABLE herb_origin (
        origin_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '产地ID',
        name VARCHAR(50) NOT NULL COMMENT '产地名称',
        region VARCHAR(50) COMMENT '所属区域',
        province VARCHAR(50) COMMENT '所属省份',
        city VARCHAR(50) COMMENT '所属城市',
        description TEXT COMMENT '产地描述',
        geo_location VARCHAR(100) COMMENT '地理位置',
        climate VARCHAR(100) COMMENT '气候特点',
        soil VARCHAR(100) COMMENT '土壤特点',
        famous_herbs JSON COMMENT '著名药材',
        origin_create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        origin_update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
);
        """
        cursor.execute(create_table_queries)




        connection.commit()
        print("数据表创建成功!")

except Exception as e:
    print(f"发生错误: {e}")

finally:
    # 关闭数据库连接
    connection.close()

    # ALTER   TABLE herb_basic_info
    # ADD CONSTRAINT fk_herb_category FOREIGN KEY(category_id) REFERENCES herb_category(category_id);