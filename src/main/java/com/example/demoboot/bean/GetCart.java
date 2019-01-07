package com.example.demoboot.bean;

import com.example.demoboot.service.ActionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Component
public class GetCart {
    @Autowired
    ActionService actionService;

    public ModelAndView addCartToModel(HttpServletRequest request, ModelAndView mav) {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            mav.addObject("cartitem", actionService.getUserCartItem(user.getId()));
            mav.addObject("total", actionService.getTotal());
        }
        return mav;
    }
}
