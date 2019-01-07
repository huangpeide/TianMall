package com.example.demoboot.service.serviceimpl;

import com.example.demoboot.bean.Item;
import com.example.demoboot.config.NumConfig;
import com.example.demoboot.mapper.ItemMapper;
import com.example.demoboot.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    ItemMapper itemMapper;

    @Override
    public List<Item> getIndexItems() {
        return itemMapper.selectItemOnindex();
    }

    @Override
    public Item getItemById(int id) {
        return itemMapper.selectItemById(id);
    }

    @Override
    public List<Item> getRandomItem() {
        Random random = new Random();
        int count = itemMapper.getCountInGoods();
        Set<Integer> ids = new HashSet<>();
        while (ids.size() != 5) {
            ids.add(random.nextInt(count));
        }
        return itemMapper.selectItemsByIds(ids.toArray(new Integer[ids.size()]));
    }

    @Override
    public List<Item> getRandomItemBykind(String kind) {
        Random random = new Random();
        Set<Integer> idset = new HashSet<>();
        List<Integer> ids = itemMapper.selectIDByKind(kind);
        while (idset.size() != 8) {
            idset.add(ids.get(random.nextInt(ids.size())));
        }
        return itemMapper.selectItemsByIds(idset.toArray(new Integer[idset.size()]));
    }

    @Override
    public List<Integer> getAllKindCount() {
        List<Integer> countlist = new ArrayList<>();
        countlist.add(itemMapper.selectCountByKind("FRU"));
        countlist.add(itemMapper.selectCountByKind("SEA"));
        countlist.add(itemMapper.selectCountByKind("PBM"));
        countlist.add(itemMapper.selectCountByKind("POU"));
        countlist.add(itemMapper.selectCountByKind("VEG"));
        countlist.add(itemMapper.selectCountByKind("FRO"));
        countlist.add(itemMapper.selectCountByKind("CAK"));
        return countlist;
    }

    @Override
    public Integer getKindCount(String kind) {
        int total = itemMapper.selectCountByKind(kind);
        if (total % NumConfig.PERPAGE == 0) {
            return total / NumConfig.PERPAGE;
        }
        return (total / NumConfig.PERPAGE) + 1;
    }

    @Override
    public List<Item> getItemByKindLimit(String kind, int pages) {
        if (pages > getKindCount(kind)) {
            return null;
        }
        if (pages == 0) {
            return itemMapper.selectItemsByKindLimit(kind, 0, NumConfig.PERPAGE);
        } else {
            return itemMapper.selectItemsByKindLimit(kind, pages * NumConfig.PERPAGE, NumConfig.PERPAGE);
        }
    }

    @Override
    public List<Item> getAllItem() {
        return itemMapper.SelectAllItems();
    }


}
