package com.example.demoboot.mapper;

import com.example.demoboot.bean.Order;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface OrderMapper {
    @Insert("INSERT INTO `allorders`(userId,OrderNum,total,orderDate) VALUES(#{userId}" +
            ",#{orderNum},#{total},#{orderDate})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    void insertIntoAllOrders(Order order);


    @Insert("INSERT INTO `user_order`(goodsId,num,orderId) VALUES(#{goodsId},#{num},#{orderId})")
    void insertIntoUserOrders(@Param("goodsId") int goodsId, @Param("num") int num, @Param("orderId") int orderId);


    @Insert("INSERT INTO `pay`(payid,orderid,paytotal,paytime)VALUES(#{payid},#{orderid},#{paytotal},#{paytime})")
    void insertIntoPay(@Param("payid") String payid, @Param("orderid") int orderid, @Param("paytotal") String paytotal, @Param("paytime") String paytime);

    @Select("SELECT * FROM `allorders` WHERE userId=#{userId} ORDER BY id DESC LIMIT 0,#{ordersnum}")
    List<Order> selectUserOrders(@Param("userId") int userId, @Param("ordersnum") int ordersnum);

    @Select("SELECT SUM(total+0) FROM `allorders` WHERE orderDate like #{month}")
    Double selectPerMonthTotal(@Param("month") String month);
}
