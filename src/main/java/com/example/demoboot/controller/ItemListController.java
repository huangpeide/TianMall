package com.example.demoboot.controller;


import com.example.demoboot.bean.GetCart;
import com.example.demoboot.bean.Item;
import com.example.demoboot.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ItemListController {
    @Autowired
    ItemService itemService;
    @Autowired
    GetCart getCart;

    @RequestMapping("/itemList")
    @ResponseBody
    public List<Item> getItemList(@RequestParam("kind") String kind, @RequestParam("pages") int pages) {
        return itemService.getItemByKindLimit(kind, pages - 1);
    }

    @RequestMapping(value = "/itemList", method = RequestMethod.GET)
    public ModelAndView getItemFirst(@RequestParam("kind") String kind, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("shop.jsp");
        modelAndView.addObject("kind", kind);
        modelAndView.addObject("pages", itemService.getKindCount(kind));
        modelAndView.addObject("countlist", itemService.getAllKindCount());
        modelAndView.addObject("items", itemService.getRandomItem());
        modelAndView.addObject("indexitems", itemService.getItemByKindLimit(kind, 0));
        return getCart.addCartToModel(request, modelAndView);
    }
}
