SELECT
    *
FROM
    BABYNAME.CHINESE_DICT C
WHERE
    POSITION(
        (
            SELECT
                PINYIN
            FROM
                BABYNAME.CHINESE_DICT_3
            WHERE
                NUM = C.NUM
        ) IN C.PINYIN
    ) = 0 -- select * from babyname.chinese_dict c where c.pinyin_final_category is  null;
    -- ü: 
    ---  1. 前面没有声母，写成 yu, yue, yuan, yun
    ---  2. 声母是j,q,x时，写成，ju, qu,xu
    ---  3. 声母是n,l 时，依然写成 nü,lü
    -- select * from babyname.chinese_dict c where c.pinyin_final ='u' and c.pinyin_initial in ('j','q','x')
    -- select * from babyname.chinese_dict c where c.pinyin_final ='u' and c.pinyin_initial in ('n','l')
    -- select string_to_array(pinyin, ',', 'gè'),  array_to_string(string_to_array(pinyin, ',', 'gè'), ','), c.* from babyname.chinese_dict c where c.pinyin_initial != substring(c.pinyin for length(c.pinyin_initial));
select
    a.num,
    array_to_string (
        array_prepend (
            b.pinyin,
            string_to_array (a.pinyin, ',', b.pinyin)
        ),
        ','
    ),
    a.*
from
    babyname.chinese_dict a
    inner join babyname.chinese_dict_3 b on a.num = b.num


select * from babyname.chinese_dict c where c.pinyin_initial != substring(c.pinyin for length(c.pinyin_initial)) 
and c.num not in (select num from babyname.chinese_dict_3)
