package com.example.demoboot.controller;


import com.example.demoboot.service.AdminService;
import com.example.demoboot.service.ItemService;
import com.example.demoboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    AdminService adminService;
    @Autowired
    ItemService itemService;
    @Autowired
    UserService userService;

    @GetMapping("/adminlogin")
    public ModelAndView adminLoginView() {
        return new ModelAndView("admin/adminlogin.jsp");
    }

    @PostMapping("/adminlogin")
    public ModelAndView adminLogin(@RequestParam("username") String username, @RequestParam("password") String password
            , HttpSession session) {
        ModelAndView mav = new ModelAndView();
        if (adminService.adminLogin(username, password)) {
            mav.setViewName("redirect:/adminindex");
            session.setAttribute("status", "true");
        } else {
            mav.setViewName("admin/adminlogin.jsp");
            mav.addObject("info", "登录失败");
        }
        return mav;
    }

    @GetMapping("/adminindex")
    public String adminIndex() {
        return "admin/admin-index.jsp";
    }


    @GetMapping("/productlist")
    public ModelAndView productList() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/productlist.jsp");
        mav.addObject("items", itemService.getAllItem());
        return mav;
    }

    @GetMapping("/userlist")
    public ModelAndView userList() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/memberlist.jsp");
        mav.addObject("users", userService.getAllUser());
        return mav;
    }

    @GetMapping("/chart")
    public ModelAndView chart() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/charts.jsp");
        mav.addObject("data", adminService.getEveryMonthTotal());
        return mav;
    }

    @RequestMapping("/getChartData")
    @ResponseBody
    public List<Double> getChartData() {
        return adminService.getEveryMonthTotal();
    }

    @PostMapping("/adminuseradd")
    @ResponseBody
    public Boolean adminUserAdd(@RequestParam("username") String userName
            , @RequestParam("useremail") String userEmail
            , @RequestParam("userpassword") String userPassword) {
        userService.register(userName, userPassword, userEmail);
        return true;
    }
}
