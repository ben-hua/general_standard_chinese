from pathlib import Path

import scrapy


class BaiduHanZiSpider(scrapy.Spider):
    name = "baidu_hanzi"

    custom_settings = {
        # 'DOWNLOAD_DELAY': 1,
        'CONCURRENT_REQUESTS_PER_DOMAIN': 1, ## 按顺序爬取
        'FEED_EXPORT_ENCODING': 'utf-8', ## 输出编码
    }

    def start_requests(self):
        for i in range(1, 4):
            fileName = Path(f'general_standard_chinese_level_{i}.txt')
            with open(fileName,'r') as file:
                for line in file:
                    words = line.strip().split(' ')
                    yield scrapy.Request(url=f"https://dict.baidu.com/s?wd={words[1]}&ptype=zici",
                                         callback=self.parse,
                                         meta={'num': words[0],'word':words[1]},
                                         )
            
    def parse(self, response):
        yield {
            "num":response.meta['num'], # 序号
            "word":response.meta['word'], # 汉字
            "pinyin":  response.css("#pinyin span b::text").getall(), # 拼音
            "radical":response.css("#radical span::text").getall(),  # 部首
            "stroke_count":response.css("#stroke_count span::text").getall(), # 笔画
            "wuxing":response.css("#wuxing span::text").get(), # 五行
            "traditional":response.css("#traditional span::text").get(), # 繁体
            "wubi":response.css("#wubi span::text").get(), # 五笔
        }
