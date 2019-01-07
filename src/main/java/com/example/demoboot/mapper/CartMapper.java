package com.example.demoboot.mapper;

import com.example.demoboot.bean.GoodsAndNum;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface CartMapper {
    @Insert("INSERT INTO `cart`(userId,goodsId,num) VALUES(#{userid},#{goodsId},#{num})")
    int addToCart(@Param("userid") int userId, @Param("goodsId") int goodsId, @Param("num") int num);

    @Select("SELECT COUNT(*) FROM `cart` WHERE userId=#{userId} and goodsId=#{goodsId}")
    int checkIsExist(@Param("userId") int userId, @Param("goodsId") int goodsId);

    @Update("UPDATE `cart` SET num=num+#{num} WHERE userId=#{userId} and goodsId=#{goodsId}")
    int itemNumadd(@Param("num") int num, @Param("userId") int userId, @Param("goodsId") int goodsId);

    @Select("SELECT * FROM `cart` WHERE userId=#{userId}")
    @Results({
            @Result(column = "num", property = "num"),
            @Result(column = "goodsId", property = "item", one =
            @One(select = "com.example.demoboot.mapper.ItemMapper.selectItemById", fetchType = FetchType.EAGER))

    })
    List<GoodsAndNum> getCartItemIdByUserId(@Param("userId") int userId);

    @Delete("DELETE FROM `cart` WHERE userId=#{userId} and goodsId=#{goodsId}")
    int deleteItemAllNum(@Param("userId") int userId, @Param("goodsId") int goodsId);

    @Update("UPDATE `cart` SET num=#{num} WHERE userId=#{userId} and goodsId=#{goodsId}")
    int itemNumEdit(@Param("num") int num, @Param("userId") int userId, @Param("goodsId") int goodsId);


    @Delete("DELETE FROM `cart` WHERE userId=#{userId}")
    void deleteByUserId(@Param("userId") int userId);
}
