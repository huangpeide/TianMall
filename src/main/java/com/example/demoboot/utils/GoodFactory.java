package com.example.demoboot.utils;

import com.example.demoboot.bean.GoodsAndNum;
import com.example.demoboot.bean.ItemIdAndNum;

public abstract class GoodFactory {
    public abstract GoodsAndNum getGoods(ItemIdAndNum itemIdAndNum);
}
