
### 草药类别
```sql

INSERT INTO herb_category (parent_id, category_name, category_code, category_level, category_description)
VALUES  (NULL, '解表药' ,          'JB' ,    '1' , '以发散表邪、解除表证为主要作用的一类中药。又称发表药。'),
        (NULL, '清热药' ,          'QR' ,    '1' , '以清解里热为主要作用的药物。' ),
        (NULL, '泻下药' ,          'XX' ,    '1' , '以清解里热为主要作用的药物。' ),
        (NULL, '祛风湿药' ,        'QFS' ,   '1' , '以祛风除湿，解除痹痛，用治风湿痹证为主要功用的药物。' ),
        (NULL, '芳香化湿药' ,      'FXHS' ,  '1' , '以化湿运脾为主要作用的一类中药。' ),
        (NULL, '温里药' ,          'WL' ,    '1' , '以温暖脏腑经络、消除里寒为主要作用的一类中药。' ),
        (NULL, '理气药' ,          'LQ' ,    '1' , '以疏畅气机、消除气滞、平降气逆为主要作用的一类中药。又称行气药。' ),
        (NULL, '消导药' ,          'XD' ,    '1' , '以消化饮食、导行积滞为主要作用的一类中药。又称消食药。' ),
        (NULL, '止血药' ,          'ZX' ,    '1' , '以制止人体各种出血为主要作用的一类中药。' ),
        (NULL, '活血药' ,          'HX' ,    '1' , '以通利血脉、促进血行、消散瘀血为主要作用的一类中药。' ),
        (NULL, '化痰止咳平喘药' , 'HTZKPC' , '1' , '以祛痰、消痰、制止和减轻咳嗽气喘为主要作用的一类中药。' ),
        (NULL, '安神药' ,          'AS' ,    '1' , '以安定神志为主要作用的一类中药。' ),
        (NULL, '平肝熄风药' ,      'PGXF' ,  '1' , '以平肝潜阳、熄风止痉为主要作用的一类中药。' ),
        (NULL, '开窍药' ,          'KQ' ,    '1' , '以通关开窍、启闭醒神为主要作用的一类中药。' ),
        (NULL, '补益药' ,          'BY' ,    '1' , '以补益人体物质亏损、增强人体活动机能、提高抗病能力、消除虚弱证候为主要作用的一类中药。又称补虚药、补养药。' ),
        (NULL, '固涩药' ,          'GS' ,    '1' , '以收敛固涩为主要作用的一类中药。又称收涩药、收敛药。' ),
        (NULL, '外用药' ,          'WY' ,    '1' , '以外用为主，通过与体表局部直接接触而起治疗作用的药物。' ),
        (NULL, '利水渗湿药',       'LSCS',    '1', '以通利水道、渗泄水湿为主要作用的一类中药。'),
        (NULL, '驱虫药',          'QCY',      '1',  '以驱除或杀灭肠道寄生虫为主要作用的一类中药。');


INSERT INTO herb_category (parent_id, category_name, category_code, category_level, category_description)  
VALUES  ('1', '发散风寒药' , 'JB-FSFH' , '2' , NULL ),
        ('1', '发散风热药' , 'JB-FSFR' , '2' , NULL ),
        ('2', '清热泻火药' , 'QR-QRXH' , '2' , NULL ),
        ('2', '清肝明目药' , 'QR-QGMM' , '2' , NULL ),
        ('2', '清热凉血药' , 'QR-QRLX' , '2' , NULL ),
        ('2', '清热解毒药' , 'QR-QRJD' , '2' , NULL ),
        ('2', '清热燥湿药' , 'QR-QRZS' , '2' , NULL ),
        ('2', '清虚热药' ,   'QR-QXR' , '2' , NULL ),
        ('3', '攻下药' , 'XX-GX' , '2' , NULL ),
        ('3', '润下药' , 'XX-RX' , '2' , NULL ),
        ('3', '峻下逐水药' , 'XX-JXZS' , '2' , NULL ),
        ('4', '祛风湿散寒药' , 'QFS-QFSSH' , '2' , NULL ),
        ('4', '祛风湿清热药' , 'QFS-QFSQR' , '2' , NULL ),
        ('4', '祛风湿强筋骨药' , 'QFS-QFSQJG' , '2' , NULL ),
        ('18', '利水渗湿药' , 'LSCS-LSCS' , '2' , NULL ),
        ('18', '利水通淋药' , 'LSCS-LSTL' , '2' , NULL ),
        ('18', '清热利湿药' , 'LSCS-QRLS' , '2' , NULL ),
        ('6', '温中散寒药' , 'WL-WZSH' , '2' , NULL ),
        ('6', '温肾回阳药' , 'WL-WSHY' , '2' , NULL ),
        ('6', '暖肝散寒药: ' , 'WL-NGSH' , '2' , NULL ),
        ('6', '温肺化饮药' , 'WL-WFHY' , '2' , NULL ),
        ('7', '理脾和胃药' , 'LQ-WPHW' , '2' , NULL ),
        ('7', '疏肝解郁药' , 'LQ-SGJY' , '2' , NULL ),
        ('7', '疏肝和胃药' , 'LQ-SGHW' , '2' , NULL ),
        ('7', '通宣理肺药' , 'LQ-TXLF' , '2' , NULL );

INSERT INTO herb_category (parent_id, category_name, category_code, category_level, category_description)  
VALUES  ('8', '消导药' , 'XD-XD' , '2' , NULL ),
        ('9', '收敛止血药' , 'ZX-SLZX' , '2' , NULL ),
        ('9', '凉血止血药' , 'ZX-LXZX' , '2' , NULL ),
        ('9', '化瘀止血药' , 'ZX-HYZX' , '2' , NULL ),
        ('9', '温经止血药' , 'ZX-WJZX' , '2' , NULL ),
        ('10', '活血化瘀药' , 'HX-HXZY' , '2' , NULL ),
        ('10', '破血消癥药' , 'HX-PXX' , '2' , NULL ),
        ('11', '温化寒痰药' , 'HTZKPC-WHHT' , '2' , NULL ),
        ('11', '清化热痰药' , 'HTZKPC-QHRT' , '2' , NULL ),
        ('11', '止咳平喘药' , 'HTZKPC-ZKPC' , '2' , NULL ),
        ('12', '重镇安神药' , 'AS-ZZAS' , '2' , NULL ),
        ('12', '养心安神药' , 'AS-YXAS' , '2' , NULL ),
        ('13', '平肝潜阳药' , 'PGXF-PGQY' , '2' , NULL ),
        ('13', '熄风止痉药' , 'PGXF-XFZJ' , '2' , NULL ),
        ('14', '温宣开窍药' , 'KQ-WXKQ' , '2' , NULL ),
        ('14', '凉宣开窍药' , 'KQ-LXKQ' , '2' , NULL ),
        ('15', '补气药', 'BY-BQ'  , '2' , NULL ),
        ('15', '助阳药' , 'BY-ZY' , '2' , NULL ),
        ('15', '养血药' , 'BY-YX' , '2' , NULL ),
        ('15', '滋阴药' , 'BY-CY' , '2' , NULL ),
        ('16', '固表止汗药' , 'GS-GBZH' , '2' , NULL ),
        ('16', '涩肠止泻药' , 'GS-SCZX' , '2' , NULL ),
        ('16', '固精止遗药' , 'GS-GJZY' , '2' , NULL ),
        ('16', '固精止遗药' , 'GS-GBZD' , '2' , NULL ),
        ('16', '固精止遗药' , 'GS-LFZK' , '2' , NULL ),
        ('17', '消肿解毒药' , 'WY-XZJD' , '2' , NULL ),
        ('17', '消肿解毒药' , 'WY-PNQF' , '2' , NULL ),
        ('17', '消肿解毒药' , 'WY-ZSSCZY' , '2' , NULL ),
        ('17', '消肿解毒药' , 'WY-FP' , '2' , NULL ),
        ('19', '驱虫药' , 'QC-QC' , '2' , NULL );



```



### 草药基本信息 && 草药详细信息

```sql

INSERT INTO herb_basic_info (herb_name, herb_pinyin, herb_alias, herb_english_name, herb_latin_name, category_id )
VALUES ('麻黄', 'Mahuang', '色道麻、结力根[蒙古]、龙沙、卑相、卑盐、狗骨', 'Chinese Ephedrs Herb',
 'Ephedrae Herba', 20);

INSERT INTO herb_basic_info (herb_name, herb_pinyin, herb_alias, herb_english_name, herb_latin_name, category_id)
VALUES ('当归', 'danggui', '女补、白当归、神草、天附子、夜交藤、救草', 'Chinese Angelica', 'Radix Angelicae Sinensis', 1);



```