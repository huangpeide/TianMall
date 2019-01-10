package com.example.demoboot.service;

import com.example.demoboot.bean.GoodsAndNum;
import com.example.demoboot.bean.Item;
import com.example.demoboot.bean.ItemIdAndNum;

import java.util.List;

public interface ActionService {
    int addToCart(int userId, int goodsId, int num);

    List<GoodsAndNum> getUserCartItem(int userId);

    String getTotal();

    int removeItemAllNum(int userId, int goodsId);

    int edititemnum(int userId, List<ItemIdAndNum> list);

    int addToWishList(int userId,int itemId);

    void removeWishList(int userId, int itemId);

    List<Item> getWishListItem(int userId);
}
