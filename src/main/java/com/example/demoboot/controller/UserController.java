package com.example.demoboot.controller;


import com.example.demoboot.bean.GetCart;
import com.example.demoboot.bean.User;
import com.example.demoboot.service.OrderService;
import com.example.demoboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private GetCart getCart;
    @Autowired
    private OrderService orderService;

    @PostMapping(value = "/login")
    public ModelAndView login(@RequestParam("username") String userName
            , @RequestParam("userpassword") String userPassword, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        User user = userService.login(userName, userPassword);
        if (user != null) {
            user.setPassword("");
            session.setAttribute("user", user);
            mav.setViewName("redirect:/index");
        } else {
            mav.addObject("error", "登录失败");
            mav.setViewName("login.jsp");
        }
        return mav;
    }

    @PostMapping(value = "/register")
    public ModelAndView register(@RequestParam("username") String userName
            , @RequestParam("useremail") String userEmail
            , @RequestParam("userpassword") String userPassword, Model model) {
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.register(userName, userPassword, userEmail);
        model.addAttribute("user", user);
        modelAndView.setViewName("redirect:/index");
        return modelAndView;
    }

    @PostMapping(value = "/checkUser")
    public void checkUser(@RequestParam("username") String userName, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        if (userService.checkUser(userName) != null) {
            out.write("false");
        } else {
            out.write("true");
        }
        out.close();
    }

    @GetMapping("/account")
    public ModelAndView account(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        User user = (User) request.getSession().getAttribute("user");
        mav = getCart.addCartToModel(request, mav);
        mav.setViewName("account.jsp");
        mav.addObject("user", userService.getUserById(user.getId()));
        mav.addObject("address", userService.getUserAddressByUserId(user.getId()));
        mav.addObject("orders", orderService.getUserOrder(user.getId()));
        return mav;
    }

    @PostMapping("/changepassword")
    public ModelAndView changePassword(@RequestParam("currentpassword") String currentPassword,
                                       @RequestParam("newpassword") String newPassword, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        User user = (User) request.getSession().getAttribute("user");
        if (userService.checkOldPassWordIsRight(user.getId(), currentPassword)) {
            if (userService.updateUserPassword(newPassword, user.getId()) == 1) {
                mav.addObject("msg", "修改成功");
                mav.setViewName("account.jsp");
            }
        } else {
            mav.addObject("msg", "密码不正确");
            mav.setViewName("account.jsp");
        }
        return mav;
    }

    @PostMapping("/shippingaddress")
    public ModelAndView editaddress(@RequestParam("shippingaddress") String shippingaddress,
                                    @RequestParam("shippingname") String shippingname,
                                    @RequestParam("shippingnum") String shippingnum, HttpServletRequest request) {
        if (userService.updateUserAddress(shippingname, shippingnum, shippingaddress
                , ((User) request.getSession().getAttribute("user")).getId()) == 1) {
            // TODO: 2018/12/29 懒得判断了
            return new ModelAndView("redirect:/account");
        }
        return null;
    }

    @GetMapping("/login")
    public String login() {
        return "login.jsp";
    }

    @GetMapping("/register")
    public String register() {
        return "register.jsp";
    }

    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        return new ModelAndView("redirect:/index");
    }

}
