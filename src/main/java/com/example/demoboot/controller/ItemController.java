package com.example.demoboot.controller;

import com.example.demoboot.bean.GetCart;
import com.example.demoboot.bean.Item;
import com.example.demoboot.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ItemController {
    @Autowired
    ItemService itemService;
    @Autowired
    GetCart getCart;

    @RequestMapping("/item")
    public ModelAndView itemDetail(@RequestParam("itemid") int itemid, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("itemdetail.jsp");
        Item item = itemService.getItemById(itemid);
        mav.addObject("item", item);
        mav.addObject("itemkind", itemService.getRandomItemBykind(item.getKind()));
        mav.addObject("items", itemService.getRandomItem());
        mav.addObject("countlist", itemService.getAllKindCount());
        return getCart.addCartToModel(request, mav);
    }
}
