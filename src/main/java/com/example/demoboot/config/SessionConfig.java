package com.example.demoboot.config;

import com.example.demoboot.interceptor.AdminInterceptor;
import com.example.demoboot.interceptor.LoginInterceptor;
import org.springframework.boot.autoconfigure.web.servlet.WebMvcAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class SessionConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/account")
                .addPathPatterns("/cart")
                .addPathPatterns("/changepassword")
                .addPathPatterns("/shippingaddress")
                .addPathPatterns("/checkout")
                .addPathPatterns("/pay");
        registry.addInterceptor(new AdminInterceptor())
                .addPathPatterns("/adminindex")
                .addPathPatterns("/productlist")
                .addPathPatterns("/userlist")
                .addPathPatterns("/chart");
    }
}
