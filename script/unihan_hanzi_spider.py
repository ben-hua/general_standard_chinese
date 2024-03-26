from pathlib import Path

import scrapy


class UniHanSpider(scrapy.Spider):
    name = "unihan_hanzi"

    custom_settings = {
        # 'DOWNLOAD_DELAY': 1,
        'CONCURRENT_REQUESTS_PER_DOMAIN': 1, ## 按顺序爬取
        'FEED_EXPORT_ENCODING': 'utf-8', ## 输出编码
    }

    def start_requests(self):
        with open('general_standard_chinese_level_0.txt','r') as file:
            for line in file:
                words = line.strip().split(',')
                yield scrapy.Request(url=f"https://www.zhonghuazidian.com/zi/{words[1]}",
                                        callback=self.parse,
                                        meta={'num': words[0],'word':words[1]},
                                        )
            
    def parse(self, response):
        nextUrl = response.xpath('//a[contains(@href, "https://util.unicode.org/UnicodeJsps/character.jsp")]/@href').get()
        yield scrapy.Request(url=nextUrl,
                             callback=self.parse_unihan,
                             meta={'num': response.meta['num'],'word':response.meta['word']},
                             )
        
    def parse_unihan(self, response):
        yield {
                "num":response.meta['num'], # 序号
                "word":response.meta['word'], # 汉字
                "pinyin":  response.css("table.propTable")[1].css("table")[2].css("tr")[18].css("td a::text").get(), # 拼音
                "radical": '',  # 部首
                "stroke_count":response.css("table.propTable")[1].css("table")[2].css("tr")[46].css("td a::text").get(), # 笔画
                "wuxing":'', # 五行
                "traditional":response.css("table.propTable")[1].css("table")[2].css("tr")[47].css("td a::text").get(), # 繁体
                "wubi":'', # 五笔
            }

    ## 未使用
    def parse_unihan2(self, response):
        yield scrapy.Request(url=f"http://ccamc.co/cjkv.php?cjkv={response.meta['word']}",
                             callback=self.parse_ccamc,
                             meta={
                                    "num":response.meta['num'], # 序号
                                    "word":response.meta['word'], # 汉字
                                    "pinyin":  response.css("table.propTable")[1].css("table")[2].css("tr")[18].css("td a::text").get(), # 拼音
                                    "stroke_count":response.css("table.propTable")[1].css("table")[2].css("tr")[46].css("td a::text").get(), # 笔画
                                    "wuxing":'', # 五行
                                    "traditional":response.css("table.propTable")[1].css("table")[2].css("tr")[47].css("td a::text").get(), # 繁体
                                    "wubi":'', # 五笔
                                },
                             )

    def parse_ccamc(self, response):
        yield {
            "num":response.meta['num'], # 序号
            "word":response.meta['word'], # 汉字
            "pinyin": response.meta['pinyin'], # 拼音
            "radical": response.xpath('//a[contains(@href, "cjkv_radical.php?q=")]/text()').get(),  # 部首
            "stroke_count": response.meta['stroke_count'], # 笔画
            "wuxing": '', # 五行
            "traditional": response.meta['traditional'], # 繁体
            "wubi":response.xpath('//a[contains(@href, "cjkv_search.php?imecode")]/text()').get(), # 五笔 
        }