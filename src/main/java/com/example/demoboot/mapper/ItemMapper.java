package com.example.demoboot.mapper;

import com.example.demoboot.bean.Item;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ItemMapper {
    @Insert("INSERT INTO `goods`(num,value,address,stock,info,image,produceAddress,brand,name,kind,onindex,isfeatured) VALUES(#{num},#{value},#{address},#{stock},#{info},#{image},#{produceAddress},#{brand},#{name},#{kind},#{onindex},#{isfeatured})")
    int addItem(Item item);

    @Select("SELECT * FROM `goods` WHERE id=#{id}")
    Item selectItemById(int id);

    @Select("SELECT * FROM `goods` WHERE kind=#{kind}")
    List<Item> selectItemsByKind(String kind);

    @Select("SELECT * FROM `goods` WHERE kind=#{kind} LIMIT #{start},#{end}")
    List<Item> selectItemsByKindLimit(@Param("kind") String kind, @Param("start") int start, @Param("end") int end);

    @Select("SELECT * FROM `goods` WHERE onindex=1")
    List<Item> selectItemOnindex();

    @Select("SELECT * FROM `goods` WHERE kind=#{kind} and onindex=1")
    List<Item> selectItemsOnIndexByKind(@Param("kind") String kind);

    @Select("SELECT count(*) FROM `goods`")
    int getCountInGoods();

    @Select("<script>"
            + "SELECT * FROM `goods` WHERE id IN "
            + "<foreach item='item' index='index' collection='ids' open='(' separator=',' close=')'>"
            + "#{item}"
            + "</foreach>"
            + "</script>")
    List<Item> selectItemsByIds(@Param("ids") Integer[] ids);


    @Update("UPDATE `goods` SET onindex=#{index} WHERE id= #{id}")
    void updateItem(@Param("index") String index, @Param("id") int id);


    @Select("SELECT id FROM `goods` WHERE kind=#{kind}")
    List<Integer> selectIDByKind(@Param("kind") String kind);

    @Select("SELECT COUNT(*) FROM `goods` WHERE kind=#{kind}")
    int selectCountByKind(@Param("kind") String kind);

//    @Update("UPDATE `goods` SET stock=stock-#{reducenum} WHERE id= #{id}")
//    void reduceItemStock(@Param("reducenum") int reducenum, @Param("id") int id);

    @Select("SELECT * FROM `goods`")
    List<Item> SelectAllItems();
}
