package com.example.demoboot.service;


import com.example.demoboot.bean.GoodsAndNum;
import com.example.demoboot.bean.Order;

import java.util.List;

public interface OrderService {
    void addANewOrder(int userId, Order order, String payid, String payTotal);

    boolean checkStock(List<GoodsAndNum> goodsAndNums);

    List<Order> getUserOrder(int userId);
}
