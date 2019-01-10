package com.example.demoboot.mapper;

import com.example.demoboot.bean.Item;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface WishListMapper {
    @Insert("INSERT INTO `wishlist`(userId,itemId) VALUES(#{userid},#{itemId})")
    int addToWishList(@Param("userid") int userId, @Param("itemId") int itemId);

    @Delete("DELETE FROM `wishlist` WHERE userId=#{userId} and itemId=#{itemId}")
    void deleteWishList(@Param("userId") int userId, @Param("itemId") int itemId);

    @Select("SELECT g.* FROM wishlist w,goods g WHERE w.userId=#{userId} AND w.itemId=g.id")
    List<Item> getWishListItem(@Param("userId")int userId);
}
