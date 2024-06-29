-- 更新声母
update babyname.chinese_dict
set
    pinyin_initial = CASE
        when position('b' in pinyin) = 1 then 'b'
        when position('p' in pinyin) = 1 then 'p'
        when position('m' in pinyin) = 1 then 'm'
        when position('f' in pinyin) = 1 then 'f'
        when position('d' in pinyin) = 1 then 'd'
        when position('t' in pinyin) = 1 then 't'
        when position('n' in pinyin) = 1 then 'n'
        when position('l' in pinyin) = 1 then 'l'
        when position('g' in pinyin) = 1 then 'g'
        when position('k' in pinyin) = 1 then 'k'
        when position('h' in pinyin) = 1 then 'h'
        when position('j' in pinyin) = 1 then 'j'
        when position('q' in pinyin) = 1 then 'q'
        when position('x' in pinyin) = 1 then 'x'
        when position('zh' in pinyin) = 1 then 'zh'
        when position('ch' in pinyin) = 1 then 'ch'
        when position('sh' in pinyin) = 1 then 'sh'
        when position('r' in pinyin) = 1 then 'r'
        when position('z' in pinyin) = 1 then 'z'
        when position('c' in pinyin) = 1 then 'c'
        when position('s' in pinyin) = 1 then 's'
        when position('y' in pinyin) = 1 then 'y'
        when position('w' in pinyin) = 1 then 'w'
        else null
    END
WHERE
    tone is null;


--- 更新韵母 
--- 1. 获取带有声调的韵母 substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1)
--- 2. 将带声调的韵母转换为不带声调的韵母   "āáǎàaēéěèeīíǐìiōóǒòoūúǔùuǖǘǚǜü" -> "aaaaeeeeiiiiioooouuuuüüüüü"
--- 3. set到韵母字段final
update babyname.chinese_dict
set
    pinyin_final = CASE
        when position('ā' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[āáǎàa]','a')
        when position('á' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[āáǎàa]','a')
        when position('ǎ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[āáǎàa]','a')
        when position('à' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[āáǎàa]','a')
        when position('a' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[āáǎàa]','a')
        when position('ē' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ēéěèe]','e')
        when position('é' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ēéěèe]','e')
        when position('ě' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ēéěèe]','e')
        when position('è' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ēéěèe]','e')
        when position('e' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ēéěèe]','e')
        when position('ī' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[īíǐìi]','i')
        when position('í' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[īíǐìi]','i')
        when position('ǐ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[īíǐìi]','i')
        when position('ì' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[īíǐìi]','i')
        when position('i' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[īíǐìi]','i')
        when position('ō' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ōóǒòo]','o')
        when position('ó' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ōóǒòo]','o')
        when position('ǒ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ōóǒòo]','o')
        when position('ò' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ōóǒòo]','o')
        when position('o' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ōóǒòo]','o')
        when position('ū' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ūúǔùu]','u')
        when position('ú' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ūúǔùu]','u')
        when position('ǔ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ūúǔùu]','u')
        when position('ù' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ūúǔùu]','u')
        when position('u' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ūúǔùu]','u')
        when position('ǖ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ǖǘǚǜü]','ü')
        when position('ǘ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ǖǘǚǜü]','ü')
        when position('ǚ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ǖǘǚǜü]','ü')
        when position('ǜ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ǖǘǚǜü]','ü')
        when position('ü' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then regexp_replace(substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1),'[ǖǘǚǜü]','ü')
        else 'other'
    END
WHERE
    tone is null;

-- 特殊过程
update babyname.chinese_dict c
set
 c.pinyin_final = replace(pinyin_final,'u','ü')
where c.pinyin_final in ('u', 'ue','uan','un') and c.pinyin_initial in ('y')

update babyname.chinese_dict 
set
 pinyin_final ='üe'
where pinyin_final in ( 'ue')


--- 更新声调
update babyname.chinese_dict
set
    tone = CASE
        when position('ā' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 1
        when position('á' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 2
        when position('ǎ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 3
        when position('à' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 4
        when position('ē' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 1
        when position('é' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 2
        when position('ě' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 3
        when position('è' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 4
        when position('ī' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 1
        when position('í' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 2
        when position('ǐ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 3
        when position('ì' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 4
        when position('ō' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 1
        when position('ó' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 2
        when position('ǒ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 3
        when position('ò' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 4
        when position('ū' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 1
        when position('ú' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 2
        when position('ǔ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 3
        when position('ù' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 4
        when position('ǖ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 1
        when position('ǘ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 2
        when position('ǚ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 3
        when position('ǜ' in substring((regexp_split_to_array(pinyin,','))[1] from character_length(pinyin_initial)+1))>0 then 4
        else 5
    END
WHERE
    tone is null;

-- 更新声母分类
update babyname.chinese_dict
set
    pinyin_initial_category = CASE
        when position('b' in pinyin_initial) = 1 then '1'
        when position('p' in pinyin_initial) = 1 then '1'
        when position('m' in pinyin_initial) = 1 then '1'
        when position('f' in pinyin_initial) = 1 then '1'
        when position('d' in pinyin_initial) = 1 then '2'
        when position('t' in pinyin_initial) = 1 then '2'
        when position('n' in pinyin_initial) = 1 then '2'
        when position('l' in pinyin_initial) = 1 then '2'
        when position('g' in pinyin_initial) = 1 then '3'
        when position('k' in pinyin_initial) = 1 then '3'
        when position('h' in pinyin_initial) = 1 then '3'
        when position('j' in pinyin_initial) = 1 then '4'
        when position('q' in pinyin_initial) = 1 then '4'
        when position('x' in pinyin_initial) = 1 then '4'
        when position('zh' in pinyin_initial) = 1 then '4'
        when position('ch' in pinyin_initial) = 1 then '4'
        when position('sh' in pinyin_initial) = 1 then '4'
        when position('r' in pinyin_initial) = 1 then '4'
        when position('z' in pinyin_initial) = 1 then '4'
        when position('c' in pinyin_initial) = 1 then '4'
        when position('s' in pinyin_initial) = 1 then '4'
        when position('y' in pinyin_initial) = 1 then '4'
        when position('w' in pinyin_initial) = 1 then '4'
        else null
    END

-- 更新韵母分类
update babyname.chinese_dict c
set
    pinyin_final_category = CASE
        when array_position(ARRAY['a', 'ai', 'ao', 'ang', 'an'], c.pinyin_final) is not null then '1'
		when array_position(ARRAY['o', 'ou', 'uo', 'ong'], c.pinyin_final) is not null then '2'
		when array_position(ARRAY['e', 'er', 'eng', 'en', 'ei'], c.pinyin_final) is not null then '3'
		when array_position(ARRAY['i','ia','iao','ie','iu','iou','ian','iang','in','ing','iong'], c.pinyin_final) is not null then '4'
		when array_position(ARRAY['u','ua','uo','uai','ui','uei','uan','un','uen','uang','ong'], c.pinyin_final) is not null then '5'
		when array_position(ARRAY['ü','üe','üan','ün'], c.pinyin_final) is not null then '6'
        else null
    END;