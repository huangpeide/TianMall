package com.example.demoboot.controller;


import com.example.demoboot.bean.GetCart;
import com.example.demoboot.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {
    @Autowired
    ItemService itemService;
    @Autowired
    GetCart getCart;

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("index.jsp");
        mav.addObject("indexitems", itemService.getIndexItems());
        return getCart.addCartToModel(request, mav);
    }

    @RequestMapping("/")
    public ModelAndView index() {
        return new ModelAndView("redirect:/index");
    }
}
