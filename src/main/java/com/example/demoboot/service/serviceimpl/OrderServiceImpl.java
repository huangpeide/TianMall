package com.example.demoboot.service.serviceimpl;

import com.example.demoboot.bean.GoodsAndNum;
import com.example.demoboot.bean.Order;
import com.example.demoboot.config.NumConfig;
import com.example.demoboot.mapper.CartMapper;
import com.example.demoboot.mapper.ItemMapper;
import com.example.demoboot.mapper.OrderMapper;
import com.example.demoboot.service.ActionService;
import com.example.demoboot.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    ActionService service;
    @Autowired
    ItemMapper itemMapper;
    @Autowired
    CartMapper cartMapper;


    @Override
    public void addANewOrder(int userId, Order order, String payid, String payTotal) {
        //添加到allorder返回主键
        List<GoodsAndNum> userCartItem = service.getUserCartItem(order.getUserId());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdfwithss = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        order.setOrderNum(userCartItem.size());
        order.setOrderDate(sdf.format(new Date()));
        orderMapper.insertIntoAllOrders(order);
        int allorderid = order.getId();


        //添加到user_order中减少商品相应的数量
        for (GoodsAndNum goodsAndNum : userCartItem) {
            orderMapper.insertIntoUserOrders(goodsAndNum.getItem().getId(), goodsAndNum.getNum(), allorderid);
            itemMapper.reduceItemStock(goodsAndNum.getNum(), goodsAndNum.getItem().getId());
        }

        //添加到Pay
        orderMapper.insertIntoPay(payid, allorderid, payTotal, sdfwithss.format(new Date()));

        //删除用户购物车中的物品
        cartMapper.deleteByUserId(userId);

    }

    @Override
    public boolean checkStock(List<GoodsAndNum> goodsAndNums) {
        for (GoodsAndNum goodsAndNum : goodsAndNums) {
            if (Integer.parseInt(itemMapper.selectItemById(goodsAndNum.getItem().getId()).getStock()) < goodsAndNum.getNum()) {
                return false;
            }
        }
        return true;
    }

    @Override
    public List<Order> getUserOrder(int userId) {
        return orderMapper.selectUserOrders(userId, NumConfig.SHOWORDERS);
    }
}
