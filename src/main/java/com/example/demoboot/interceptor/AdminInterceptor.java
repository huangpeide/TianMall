package com.example.demoboot.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!("true").equals(request.getSession().getAttribute("status"))) {
            response.sendRedirect(request.getContextPath() + "/adminlogin");
            return false;
        }
        return true;
    }
}
