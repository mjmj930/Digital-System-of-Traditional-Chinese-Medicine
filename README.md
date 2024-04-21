# Digital-System-of-Traditional-Chinese-Medicine

# ：基于中医传统理论的养生药材库数字化系统开发

* [ ] 构建一个基于数字化的养生中药材模型；
* [ ] 建立一个养生中药材数据库；
* [ ] 开发一套数字化药材库系统

# 所需环境：

```
1、JDK：1.8+
安装教程：https://www.runoob.com/java/java-environment-setup.html
2、Redis 3.0+
安装教程：https://www.runoob.com/redis/redis-install.html
3、Maven 3.0+
安装教程：https://www.runoob.com/maven/maven-setup.html
4、MYSQL 5.5.0+
安装教程：https://www.runoob.com/mysql/mysql-install.html
5、Node v10+ (最好使用 12-16，高版本可能会有问题)
安装教程：https://www.runoob.com/nodejs/nodejs-install-setup.html
```

* [ ] Node : v16.20.2
* [ ] JDK : 20.0.1
* [ ] mysql  Ver 8.3.0
* [ ] apache-maven-3.9.2
* [ ] redis-cli 5.0.14.1
* [ ] tesseract v5.3.0.20221214 (图像识别)

# 中医理论体系的数字化构建

# 数据库设计

### 中药材信息表 （5）


1.  药材基本信息表

字段解释：
>   *   药材ID (herb_id):作为表的主键,通常设为自动递增的整数。用于唯一标识每条药材记录,并与其他表建立关联关系。
>   *   药材名称 (herb_name):药材的名称,是药材的主要标识之一。数据类型为VARCHAR(50),要求非空,最大长度为50个字符。
>   *   药材别名 (herb_alias):药材的别名,一种药材可能有多个别名。数据类型为VARCHAR(100),允许为空,最大长度为100个字符。
>   *   药材英文名 (herb_english_name):药材的英文名称,便于国际化和学术交流。数据类型为VARCHAR(50),允许为空,最大长度为50个字符。
>   *   药材拉丁学名 (herb_latin_name):药材的拉丁学名,是药材的国际通用学术名称。数据类型为VARCHAR(50),允许为空,最大长度为50个字符。
>   *   药材类别ID (category_id):药材所属类别的ID,与中药材类别表(herb_category)建立外键关联关系。数据类型为INT(整数),允许为空。
>   *   记录创建时间 (create_time):自动记录药材信息的创建时间。数据类型为TIMESTAMP(时间戳),默认值为当前时间(CURRENT_TIMESTAMP)。
>   *   记录更新时间 (update_time):自动记录药材信息的最后更新时间。数据类型为TIMESTAMP(时间戳),默认值为当前时间(CURRENT_TIMESTAMP)。在记录>    *   更新时自动更新为当前时间(ON UPDATE CURRENT_TIMESTAMP)。

```sql

CREATE TABLE herb_basic_info (
  herb_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '药材ID,主键,自动递增',
  herb_name VARCHAR(50) NOT NULL COMMENT '药材名称',
  herb_alias VARCHAR(100) COMMENT '药材别名',
  herb_english_name VARCHAR(50) COMMENT '药材英文名',
  herb_latin_name VARCHAR(50) COMMENT '药材拉丁学名',
  category_id INT COMMENT '药材类别ID,外键,关联herb_category表',
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  FOREIGN KEY (category_id) REFERENCES herb_category(category_id)
) COMMENT '中药材基本信息表';

```


2.  药材详细信息表

字段解释：
>  *     药材ID (herb_id): 作为表的主键,关联到中药材基本信息表(herb_basic_info)的herb_id字段。
>  *     药材来源 (herb_source): 药材的来源地信息,数据类型为VARCHAR(50),最大长度为50个字符。
>  *     主要产地 (herb_producing_area): 药材的主要产地信息,数据类型为VARCHAR(100),最大长度为100个字符。
>  *     药用部位 (herb_part): 药材的药用部位信息,数据类型为VARCHAR(50),最大长度为50个字符。
>  *     药材性味 (herb_property): 药材的性味信息,如寒、热、温、凉、平等,数据类型为VARCHAR(50),最大长度为50个字符。
>  *     药材归经 (herb_meridian_tropism): 药材的归经信息,如归肺经、归肝经等,数据类型为VARCHAR(100),最大长度为100个字符。
>  *     功效主治 (herb_efficacy): 药材的功效主治信息,数据类型为TEXT,用于存储较长的文本描述。
>  *     用法用量 (herb_usage): 药材的用法和用量信息,数据类型为VARCHAR(255),最大长度为255个字符。
>  *     使用注意 (herb_precaution): 药材的使用注意事项,数据类型为TEXT,用于存储较长的文本描述。
>  *     贮藏方法 (herb_storage): 药材的贮藏方法信息,数据类型为VARCHAR(255),最大长度为255个字符。


```sql

    CREATE TABLE herb_detail_info (
        herb_id INT PRIMARY KEY COMMENT '药材ID,主键,关联herb_basic_info表',
        herb_source VARCHAR(50) COMMENT '药材来源',
        herb_producing_area VARCHAR(100) COMMENT '主要产地',
        herb_part VARCHAR(50) COMMENT '药用部位',
        herb_property VARCHAR(50) COMMENT '药材性味',
        herb_temperature VARCHAR(20) COMMENT '药材性温,如寒、凉、平、温、热',
        herb_meridian_tropism VARCHAR(100) COMMENT '药材归经',
        herb_efficacy TEXT COMMENT '功效主治',
        herb_usage VARCHAR(255) COMMENT '用法用量',
        herb_precaution TEXT COMMENT '使用注意',
        herb_storage VARCHAR(255) COMMENT '贮藏方法',
        create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
        update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
        FOREIGN KEY (herb_id) REFERENCES herb_basic_info(herb_id)
    ) COMMENT '中药材详细信息表';

```

3.  药材类别表

字段解释:
> * 类别ID (category_id): 作为表的主键,自动递增的整数,用于唯一标识每个类别。
> * 类别名称 (category_name): 中药材类别的名称,数据类型为VARCHAR(50),要求非空,最大长度为50个字符。
> * 父类别ID (parent_category_id): 表示该类别的父类别ID,引用herb_category表自身的category_id字段。对于顶级类别,该字段可以为NULL。
> * 类别层级 (category_level): 表示类别的层级深度,顶级类别的层级为1,子类别的层级依次递增。
> * 类别描述 (category_description): 对类别的详细描述,数据类型为TEXT,用于存储较长的文本信息。
> * 记录创建时间 (create_time): 自动记录类别信息的创建时间,数据类型为TIMESTAMP,默认值为当前时间(CURRENT_TIMESTAMP)。
> * 记录更新时间 (update_time): 自动记录类别信息的最后更新时间,数据类型为TIMESTAMP,默认值为当前时间(CURRENT_TIMESTAMP),并在记录更新时自动更新为当前时间(ON UPDATE CURRENT_TIMESTAMP)。


```sql

CREATE TABLE `herb_category` (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '类别ID',
  `parent_id` int DEFAULT NULL COMMENT '父类别ID',
  `category_name` varchar(50) NOT NULL COMMENT '类别名称',
  `category_code` varchar(20) DEFAULT NULL COMMENT '类别编码',
  `category_level` tinyint unsigned DEFAULT NULL COMMENT '类别层级',
  `category_description` varchar(255) DEFAULT NULL COMMENT '类别描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_code` (`category_code`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `herb_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `herb_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储中药材分类的基本信息';

```


4.  药材来源表

字段解释：
> * 来源id
> * 来源名称：
> * 来源类型：
> * 来源区域：
> * 所属省份：
> * 所属城市：
> * 所属国家：
> * 海拔高度：
> * 气候条件：
> * 土壤类型：
> * 描述：
> * 著名药材：
> * 记录创建时间：
> * 记录更新时间：


```sql

    CREATE TABLE `herb_source` (
        `source_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '来源ID,主键,自动递增',
        `source_name` VARCHAR(100) NOT NULL COMMENT '来源名称',
        `source_type` VARCHAR(50) COMMENT '来源类型',
        `source_region` VARCHAR(100) COMMENT '来源区域',
	    `source_province` VARCHAR ( 50 ) DEFAULT NULL COMMENT '所属省份',
	    `source_city` VARCHAR ( 50 ) DEFAULT NULL COMMENT '所属城市',        
        `source_country` VARCHAR(50) COMMENT '所属国家',
        `source_elevation` INT COMMENT '来源地海拔高度',
        `source_climate` VARCHAR(50) COMMENT '气候条件',
        `source_soil` VARCHAR(50) COMMENT '来土壤类型',
        `source_description` TEXT COMMENT '来源地描述',
	    `source_herbs` JSON DEFAULT NULL COMMENT '产地著名药材',
        `create_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
        `update_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间'
    ) COMMENT '药材来源表';

```

5.  药材图谱表

```sql

CREATE TABLE herb_image (
  image_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '图片ID,主键,自动递增',
  herb_id INT NOT NULL COMMENT '药材ID,外键,关联herb_basic_info表',
  image_path VARCHAR(255) COMMENT '图片路径',
  image_description TEXT COMMENT '图片描述',
  FOREIGN KEY (herb_id) REFERENCES herb_basic_info(herb_id)
) COMMENT '中药材图片表';

```










### 评论表  （3）
    
1.  评论信息表

字段解释：
> * comment_id: 评论ID,作为主键,自动递增的整数类型,唯一标识每条评论。
> * user_id: 评论用户ID,引用用户表的主键,表示发表该评论的用户。
> * herb_id: 评论关联的药材ID,引用药材表的主键,表示该评论所属的药材。
> * comment_content: 评论内容,文本类型,存储评论的具体内容。
> * comment_rating: 评论评分,整数类型,可以根据业务需求设置评分范围,如1-5星等。
> * comment_status: 评论状态,字符串类型,用于标识评论的审核状态,如pending(待审核)、approved(已通过)、rejected(已拒绝)等。
> * create_time: 评论创建时间,时间戳类型,自动记录评论的创建时间。
> * update_time: 评论更新时间,时间戳类型,自动记录评论的最后更新时间。


```sql

CREATE TABLE comment_info (
  comment_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '评论ID,主键,自动递增',
  user_id INT NOT NULL COMMENT '评论用户ID,引用用户表的主键',
  herb_id INT NOT NULL COMMENT '评论关联的药材ID,引用药材表的主键',
  comment_content TEXT NOT NULL COMMENT '评论内容',
  comment_rating INT COMMENT '评论评分,可以是1-5星等',
  comment_status VARCHAR(20) DEFAULT 'pending' COMMENT '评论状态,如pending(待审核),approved(已通过),rejected(已拒绝)',
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '评论创建时间',
  update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论更新时间',
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (herb_id) REFERENCES herb_basic_info(herb_id)
) COMMENT '评论信息表';

```



2.  评论图片表

字段解释：
> * image_id: 图片ID,作为主键,自动递增的整数类型,唯一标识每张图片。
> * comment_id: 关联的评论ID,引用评论信息表的主键,表示该图片所属的评论。
> * image_url: 图片URL,字符串类型,存储图片的访问路径或URL。
> * image_description: 图片描述,字符串类型,用于存储图片的文字描述信息。
> * create_time: 图片上传时间,时间戳类型,自动记录图片的上传时间。

```sql

CREATE TABLE comment_image (
  comment_image_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '图片ID,主键,自动递增',
  comment_id INT NOT NULL COMMENT '关联的评论ID,引用评论信息表的主键',
  image_url VARCHAR(255) NOT NULL COMMENT '图片URL',
  image_description VARCHAR(255) COMMENT '图片描述',
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '图片上传时间',
  FOREIGN KEY (comment_id) REFERENCES comment_info(comment_id)
) COMMENT '评论图片表';

```


3.  评论点赞表

字段解释：
> * like_id: 点赞ID,作为主键,自动递增的整数类型,唯一标识每个点赞记录。
> * comment_id: 关联的评论ID,引用评论信息表的主键,表示被点赞的评论。
> * user_id: 点赞用户ID,引用用户表的主键,表示进行点赞操作的用户。
> * create_time: 点赞时间,时间戳类型,自动记录点赞的时间。

```sql

        CREATE TABLE comment_like (
            like_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '点赞ID,主键,自动递增',
            comment_id INT NOT NULL COMMENT '关联的评论ID,引用评论信息表的主键',
            user_id INT NOT NULL COMMENT '点赞用户ID,引用用户表的主键',
            create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '点赞时间',
            FOREIGN KEY (comment_id) REFERENCES comment_info(comment_id),
            FOREIGN KEY (user_id) REFERENCES users(user_id),
            UNIQUE (comment_id, user_id)
        ) COMMENT '评论点赞表';

```
### 药材价格（3）

好的,为了实现药材价格的功能,我们可以创建以下几个表:

1. 药材价格表(herb_price):

```sql
        CREATE TABLE herb_price (
            price_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '价格ID,主键,自动递增',
            herb_id INT NOT NULL COMMENT '关联的药材ID,引用药材表的主键',
            price_type VARCHAR(20) NOT NULL COMMENT '价格类型,如retail(零售价)、wholesale(批发价)等',
            price DECIMAL(10, 2) NOT NULL COMMENT '价格,保留两位小数',
            unit VARCHAR(20) NOT NULL COMMENT '价格单位,如元/克、元/公斤等',
            effective_date DATE COMMENT '价格生效日期',
            expiration_date DATE COMMENT '价格失效日期',
            create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '价格创建时间',
            update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '价格更新时间',
            FOREIGN KEY (herb_id) REFERENCES herb_basic_info(herb_id)
        ) COMMENT '药材价格表';
```

2. 药材供应商表(herb_supplier):

```sql
        CREATE TABLE herb_supplier (
            supplier_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '供应商ID,主键,自动递增',
            supplier_name VARCHAR(100) NOT NULL COMMENT '供应商名称',
            supplier_contact VARCHAR(50) COMMENT '供应商联系人',
            supplier_phone VARCHAR(20) COMMENT '供应商联系电话',
            supplier_email VARCHAR(50) COMMENT '供应商邮箱',
            supplier_address VARCHAR(200) COMMENT '供应商地址',
            create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '供应商创建时间',
            update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '供应商更新时间'
        ) COMMENT '药材供应商表';
```

3. 药材供应商价格表(herb_supplier_price):

```sql
        CREATE TABLE herb_supplier_price (
            supplier_price_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '供应商价格ID,主键,自动递增',
            herb_id INT NOT NULL COMMENT '关联的药材ID,引用药材表的主键',
            supplier_id INT NOT NULL COMMENT '关联的供应商ID,引用供应商表的主键',
            price DECIMAL(10, 2) NOT NULL COMMENT '供应商提供的价格,保留两位小数',
            unit VARCHAR(20) NOT NULL COMMENT '价格单位,如元/克、元/公斤等',
            effective_date DATE COMMENT '价格生效日期',
            expiration_date DATE COMMENT '价格失效日期',
            create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '价格创建时间',
            update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '价格更新时间',
            FOREIGN KEY (herb_id) REFERENCES herb_basic_info(herb_id),
            FOREIGN KEY (supplier_id) REFERENCES herb_supplier(supplier_id)
        ) COMMENT '药材供应商价格表';
```





### 方剂（3）

    方剂分类表（formula_categories）、方剂表（formulas）、方剂组成表（formula_ingredients）

1.  方剂分类表
    
字段解释：

>   *   分类id(category_id):为每个分类项唯一标识
>   *   分类名称(name)
>   *   分类描述(description)


```sql

CREATE TABLE `Formula_Categories` (
    `category_id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '分类的唯一标识符',
    `name` VARCHAR(100) NOT NULL COMMENT '分类名称',
    `description` TEXT COMMENT '分类描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储中医方剂的分类信息';

```


2.  方剂表

字段解释:

>   *   方剂ID (formula_id): 唯一标识每一个方剂的主键。
>   *   方剂名称 (name): 方剂的名字。
>   *   主要作用 (primary_effect): 方剂的主要治疗作用或效果描述。
>   *   适用症状 (indications): 方剂适用于治疗的主要症状或疾病。
>   *   描述 (description): 对方剂的详细描述，可能包括方剂的来源、历史等背景信息。

```sql

CREATE TABLE `Formulas` (
    `formula_id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '自动增长的唯一标识符',
    `category_id` INT NOT NULL COMMENT '方剂所属分类的标识符，外键',
    `chinese_name` VARCHAR(255) NOT NULL COMMENT '方剂的中文名称',
    `pinyin_name` VARCHAR(255) COMMENT '方剂的汉语拼音名称',
    `english_name` VARCHAR(255) COMMENT '方剂的英文名称',
    `source` VARCHAR(255) COMMENT '方剂的文献来源或出处',
    `usage` TEXT COMMENT '方剂的用法说明',
    `functions` TEXT COMMENT '方剂的主要功效',
    `indications` TEXT COMMENT '方剂的主治功能',
    `pathogenesis` TEXT COMMENT '方剂涉及的病机描述',
    `precautions` TEXT COMMENT '使用该方剂时的注意事项',
    `formula_song` TEXT COMMENT '方剂的记忆歌谣，帮助记忆方剂组成',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '记录的创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录的最后更新时间',
    FOREIGN KEY (`category_id`) REFERENCES `Formula_Categories`(`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储中医方剂的基本信息';

```


3.  方剂组成表

字段解释：

>   *   组成ID (ingredient_id): 唯一标识每一个组成的主键。
>   *   方剂ID (formula_id): 引用方剂表的外键，表示该组成属于哪个方剂。
>   *   药材ID (herb_id): 引用药材表的外键，标识使用的药材。
>   *   用量 (dosage): 药材的使用量。
>   *   单位 (unit): 用量的单位（如克、两等）。
>   *   角色 (role): 可选字段，表示药材在方剂中的角色（如君、臣、佐、使）。

```sql

CREATE TABLE `Formula_Ingredients` (
    `ingredient_id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '唯一标识符',
    `formula_id` INT NOT NULL COMMENT '方剂的唯一标识符，外键',
    `herb_id` INT NOT NULL COMMENT '药材的唯一标识符，外键',
    `role` VARCHAR(50) COMMENT '标识药材角色（君、臣、佐、使）',
    `dosage` FLOAT NOT NULL COMMENT '药材的使用量' ,
    `unit` VARCHAR(50) COMMENT '用量的单位（克、两等）',
    `description` TEXT COMMENT '用药说明',
    FOREIGN KEY (`formula_id`) REFERENCES `Formulas`(`formula_id`) ON DELETE CASCADE,
    FOREIGN KEY (`herb_id`) REFERENCES `herb_basic_info`(`herb_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储方剂的组成成分和分量';


```













### 用户权限表（5）

用户表分为用户表（user）、角色表（Roles）、权限表（Permissions）、用户角色关联表（UserRoles）、角色权限关联表（RolePermissions）

1.  用户表  （users）    

    存储系统中所有用户的基本信息。

字段解释
*   user_id (PK)：主键，唯一标识每个用户。
*   username：用户的登录名，通常是唯一的。
*   password：用户的密码，通常以加密形式存储以保证安全。
*   email：用户的电子邮件地址，可用于通信或密码恢复。
*   created_at：用户账户的创建时间。

```sql

CREATE TABLE `users` (
	`user_id` INT NOT NULL AUTO_INCREMENT,
	`username` VARCHAR ( 15 ) NOT NULL,
	`password` VARCHAR ( 255 ) NOT NULL,
	`email` VARCHAR ( 255 ) NOT NULL,
	`phone_number` VARCHAR ( 255 ) DEFAULT NULL,
	`create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
	`update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY ( `user_id` ),
UNIQUE KEY `username` ( `username` ) 
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

```

2.  角色表（Roles）

    定义系统中不同的角色，如普通用户、专家、管理员和超级管理员。

字段解释：
*   role_id: 主键，自动递增，确保每个角色都有一个唯一标识符。
*   name: 角色名称，设置为 NOT NULL 和 UNIQUE，确保每个角色的名称都是唯一且非空。
*   description: 角色的详细描述，使用文本类型以便存储更多信息。
*   created_at 和 updated_at: 这两个时间戳字段用于自动记录角色的创建和更新时间。

```SQL

CREATE TABLE `Roles` (
    `role_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL UNIQUE,
    `description` TEXT,
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

```

3.  权限表（Permissions）

    定义具体可执行操作,系统中所有可能的操作或权限

字段解释：
*   权限ID (permission_id): 作为表的主键，通常设为自动递增的整数。
*   权限名称 (name): 权限的名称，如 "编辑文章"、"查看用户信息" 等。
*   权限描述 (description): 对权限的详细描述，帮助理解权限的具体作用。

```sql

CREATE TABLE `Permissions` (
    `permission_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL UNIQUE,
    `description` TEXT
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

```

4.  用户角色关联表（UserRoles）

    定义用户和角色之间关系,由于用户和角色之间是多对多关系，此表作为关联表来维护这种关系。

字段解释：
*   用户ID (user_id): 引用用户表（ users 表）中的用户ID。
*   角色ID (role_id): 引用角色表（ Roles 表）中的角色ID。

```sql

CREATE TABLE `UserRoles` (
    `user_id` INT NOT NULL,
    `role_id` INT NOT NULL,
    PRIMARY KEY (`user_id`, `role_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`role_id`) REFERENCES `Roles`(`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

```

5.  角色权限关联表（RolePermissions）

   定义角色和权限之间关系

字段解释：
*   角色ID (role_id): 引用角色表（ Roles 表）中的角色ID。
*   权限ID (permission_id): 引用权限表（ Permissions 表）中的权限ID。

```sql

CREATE TABLE `RolePermissions` (
    `role_id` INT NOT NULL,
    `permission_id` INT NOT NULL,
    PRIMARY KEY (`role_id`, `permission_id`),
    FOREIGN KEY (`role_id`) REFERENCES `Roles`(`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`permission_id`) REFERENCES `Permissions`(`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

```
