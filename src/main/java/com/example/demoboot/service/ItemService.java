package com.example.demoboot.service;

import com.example.demoboot.bean.Item;

import java.util.List;

public interface ItemService {
    List<Item> getIndexItems();

    Item getItemById(int id);

    List<Item> getRandomItem();

    List<Item> getRandomItemBykind(String kind);

    List<Integer> getAllKindCount();

    Integer getKindCount(String kind);

    List<Item> getItemByKindLimit(String kind, int pages);

    List<Item> getAllItem();
}
