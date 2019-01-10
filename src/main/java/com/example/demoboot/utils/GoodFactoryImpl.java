package com.example.demoboot.utils;

import com.example.demoboot.bean.GoodsAndNum;
import com.example.demoboot.bean.ItemIdAndNum;
import com.example.demoboot.mapper.ItemMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

public class GoodFactoryImpl extends GoodFactory {
    @Autowired
    ItemMapper itemMapper;

    @Override
    public GoodsAndNum getGoods(ItemIdAndNum itemIdAndNum) {
        GoodsAndNum goodsAndNum = new GoodsAndNum();
        BeanUtils.copyProperties(itemIdAndNum, goodsAndNum);
        goodsAndNum.setItem(itemMapper.selectItemById(itemIdAndNum.getItemid()));
        return goodsAndNum;
    }
}
