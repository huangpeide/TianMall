package com.example.demoboot.controller;


import com.example.demoboot.bean.GoodsAndNum;
import com.example.demoboot.bean.ItemIdAndNum;
import com.example.demoboot.bean.User;
import com.example.demoboot.service.ActionService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class CartController {
    @Autowired
    ActionService actionService;

    @RequestMapping("/cart")
    public ModelAndView getCart(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        User user = (User) request.getSession().getAttribute("user");
        mav.addObject("cartitem", actionService.getUserCartItem(user.getId()));
        mav.addObject("total", Double.parseDouble(actionService.getTotal()));
        mav.setViewName("cart.jsp");
        return mav;
    }

    @RequestMapping(value = "/editItemnum", method = RequestMethod.POST)
    public void editItemNum(@RequestParam("items") String items, HttpServletRequest request
            , HttpServletResponse response) throws IOException {
        Gson gson = new Gson();
        List<ItemIdAndNum> list = gson.fromJson(items, new TypeToken<List<ItemIdAndNum>>() {
        }.getType());
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            if (actionService.edititemnum(user.getId(), list) == list.size()) {
                out.write("true");
            } else {
                out.write("false");
            }
        } else {
            out.write("login");
        }
    }

    @RequestMapping("/addToCart")
    public void addToCart(@RequestParam("itemid") int itemid, @RequestParam("num") int num
            , HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            out.write("login");
        } else {
            if (actionService.addToCart(user.getId(), itemid, num) == 1) {
                out.write("true");
            } else {
                out.write("false");
            }
        }
    }


    @RequestMapping("/removeItemAllNum")
    public void removeItemFromCart(@RequestParam("itemid") int itemid, HttpServletRequest request
            , HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            out.write("error");
        } else {
            if (actionService.removeItemAllNum(user.getId(), itemid) == 1) {
                out.write("true");
            } else {
                out.write("false");
            }
        }
    }

    @RequestMapping("/getCartItem")
    @ResponseBody
    public List<GoodsAndNum> getCartItem(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            return actionService.getUserCartItem(user.getId());
        }
        return null;
    }
}
