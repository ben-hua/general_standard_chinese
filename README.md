# 通用规范汉字表

+ [gsc_pinyin.csv](./gsc_pinyin.csv) 补全了拼音，部首，笔画，繁体，五行，五笔等信息。 详情来源: `百度汉语`, `Unihan`。
+ [gsc_pinyin_with_tone.csv](./gsc_pinyin_with_tone.csv) 比**gsc_pinyin.csv** 多了声母，韵母，声调。多音字选取第一个拼音。详情来源：`pinyin4j`。

## Information
  
一、2013年教育部、国家语言文字工作委员会组织制定《通用规范汉字表》。

二、共收字8105个，分为三级：

+ [**gsc_level_1.txt 是一级表** 收字3500个](./gsc_level_1.txt)，为常用字集，主要满足基础教育和文化普及的基本用字需要。
+ [**gsc_level_2.txt 是二级表** 收字3000个](./gsc_level_2.txt)，使用度仅次于一级字。一、二级字表合计6500字，主要满足出版印刷、辞书编纂和信息处理等方面的一般用字需要。
+ [**gsc_level_3.txt 是三级表** 收字1605个](./gsc_level_3.txt)，是姓氏人名、地名、科学技术术语和中小学语文教材文言文用字中未进入一、二级字表的较通用的字，主要满足信息化时代与大众生活密切相关的专门领域的用字需要。

### 百度汉语抓取程序

使用[scrapy](https://github.com/scrapy/scrapy) 抓取。

    ```bash
    pip install scrapy

    scrapy runspider ./script/baidu_hanzi_spider.py -o gsc_pinyin.csv
    ```

## Reference

1. 通用规范汉字表wiki <https://zh.wikisource.org/wiki/通用规范汉字表>
2. baidu汉语 <https://dict.baidu.com/>
3. 汉语拼音方案（教育部官网文件） <http://www.moe.gov.cn/ewebeditor/uploadfile/2015/03/02/20150302165814246.pdf>
4. 中华字典 <https://www.zhonghuazidian.com/zi/%F0%AB%98%9D>
5. unicode汉语 <https://util.unicode.org/UnicodeJsps/character.jsp?a=2B61D>
