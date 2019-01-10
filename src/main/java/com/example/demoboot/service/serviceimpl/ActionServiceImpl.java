package com.example.demoboot.service.serviceimpl;

import com.example.demoboot.bean.GoodsAndNum;
import com.example.demoboot.bean.Item;
import com.example.demoboot.bean.ItemIdAndNum;
import com.example.demoboot.mapper.CartMapper;
import com.example.demoboot.mapper.ItemMapper;
import com.example.demoboot.mapper.WishListMapper;
import com.example.demoboot.service.ActionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ActionServiceImpl implements ActionService {
    @Autowired
    CartMapper cartMapper;

    @Autowired
    ItemMapper itemMapper;

    @Autowired
    WishListMapper wishListMapper;
    private List<GoodsAndNum> goodsAndNums = new ArrayList<>();

    @Override
    public int addToCart(int userId, int goodsId, int num) {
        if (itemMapper.selectItemById(goodsId).getStock().equals("0") || itemMapper.selectItemById(goodsId) == null) {
            return 0;
        }
        int currentstock = Integer.parseInt(itemMapper.selectItemById(goodsId).getStock());
        if (currentstock < num) {
            if (cartMapper.checkIsExist(userId, goodsId) == 1) {
                return cartMapper.itemNumadd(currentstock, userId, goodsId);
            }
            return cartMapper.addToCart(userId, goodsId, currentstock);
        } else {
            if (cartMapper.checkIsExist(userId, goodsId) == 1) {
                return cartMapper.itemNumadd(num, userId, goodsId);
            }
            return cartMapper.addToCart(userId, goodsId, num);
        }
    }

    @Override
    public List<GoodsAndNum> getUserCartItem(int userId) {
        goodsAndNums = cartMapper.getCartItemIdByUserId(userId);
        return goodsAndNums;
    }

    @Override
    public String getTotal() {
        double total = 0;
        for (GoodsAndNum goodsAndNum : goodsAndNums) {
            total += Double.parseDouble(goodsAndNum.getItem().getValue()) * goodsAndNum.getNum();
        }
        return String.format("%.2f", total);
    }

    @Override
    public int removeItemAllNum(int userId, int goodsId) {
        return cartMapper.deleteItemAllNum(userId, goodsId);
    }

    @Override
    public int edititemnum(int userId, List<ItemIdAndNum> list) {
        int res = 0;
        for (ItemIdAndNum itemIdAndNum : list) {
            int currentStock = Integer.parseInt(itemMapper.selectItemById(itemIdAndNum.getItemid()).getStock());
            if (currentStock < itemIdAndNum.getNum()) {
                res += cartMapper.itemNumEdit(currentStock, userId, itemIdAndNum.getItemid());
            } else {
                res += cartMapper.itemNumEdit(itemIdAndNum.getNum(), userId, itemIdAndNum.getItemid());
            }
        }
        return res;
    }

    @Override
    public int addToWishList(int userId, int itemId) {
        return wishListMapper.addToWishList(userId, itemId);
    }

    @Override
    public void removeWishList(int userId, int itemId) {
        wishListMapper.deleteWishList(userId,itemId);
    }

    @Override
    public List<Item> getWishListItem(int userId) {
        return wishListMapper.getWishListItem(userId);
    }

}
