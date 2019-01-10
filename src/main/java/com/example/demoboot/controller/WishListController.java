package com.example.demoboot.controller;

import com.example.demoboot.bean.GetCart;
import com.example.demoboot.bean.User;
import com.example.demoboot.service.ActionService;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class WishListController {
    // TODO: 2019/1/8 未完成的功能
    @Autowired
    ActionService actionService;
    @Autowired
    GetCart getCart;

    @PostMapping("/addToList")
    @ResponseBody
    public void addToWish(@RequestParam("itemid") int itemid, HttpSession session, HttpServletResponse response) throws IOException {
        User user = (User) session.getAttribute("user");

        PrintWriter out = response.getWriter();
        if (user == null) {
            out.write("login");
        } else {
            if (actionService.addToWishList(user.getId(), itemid)==1) {
                out.write("true");
            } else {
                out.write("false");
            }
        }
    }

    @GetMapping("/wishList")
    public ModelAndView getWishList(HttpSession session) {
        User user = (User) session.getAttribute("user");
        ModelAndView mav = new ModelAndView("wishlist.jsp");
        mav.addObject("cartitem", actionService.getUserCartItem(user.getId()));
        mav.addObject("total", Double.parseDouble(actionService.getTotal()));
        mav.addObject("wishlist", actionService.getWishListItem(user.getId()));
        return mav;
    }

    @PostMapping("/removeWishList")
    @ResponseBody
    public void removeWishList(@RequestParam("itemid") int itemid, HttpSession session) {
        User user = (User) session.getAttribute("user");
        actionService.removeWishList(user.getId(), itemid);
    }
}
