package com.example.demoboot.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.example.demoboot.bean.GoodsAndNum;
import com.example.demoboot.bean.Order;
import com.example.demoboot.bean.User;
import com.example.demoboot.config.AlipayConfig;
import com.example.demoboot.service.ActionService;
import com.example.demoboot.service.OrderService;
import com.example.demoboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.nio.charset.StandardCharsets;
import java.util.*;

@Controller
public class OrderController {
    @Autowired
    ActionService actionService;
    @Autowired
    UserService userService;
    @Autowired
    OrderService orderService;
    private int userId;

    @RequestMapping("/checkout")
    public ModelAndView checkOut(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("checkout.jsp");
        int id = ((User) request.getSession().getAttribute("user")).getId();
        List<GoodsAndNum> userCartItem = actionService.getUserCartItem(id);
        if (orderService.checkStock(userCartItem)) {
            mav.addObject("address", userService.getUserAddressByUserId(id));
            mav.addObject("cartitem", userCartItem);
            mav.addObject("total", Double.parseDouble(actionService.getTotal()));
        } else {
            mav.addObject("info", "有商品已售罄");
        }
        return mav;
    }


    @RequestMapping("/pay")
    @ResponseBody
    public String pay(HttpServletRequest request) throws AlipayApiException {
        UUID uuid = UUID.randomUUID();
        User user = (User) request.getSession().getAttribute("user");
        userId = user.getId();

        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        String out_trade_no = uuid.toString().split("-")[0];
        actionService.getUserCartItem(userId);
        String total_amount = "";
        if (Double.parseDouble(actionService.getTotal()) > 66) {
            total_amount = actionService.getTotal();
        } else {
            total_amount = String.valueOf(Double.parseDouble(actionService.getTotal()) + 15);
        }
        String subject = "ORGANIK" + out_trade_no;
        String body = "";
        String timeout_express = "10m";

        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"timeout_express\":\"" + timeout_express + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        return alipayClient.pageExecute(alipayRequest).getBody();
    }


    @RequestMapping(value = "/alipayReturnNotice")
    public ModelAndView alipayReturnNotice(HttpServletRequest request, HttpServletRequest response) throws Exception {

        Map<String, String> params = new HashMap<>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = iter.next();
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            valueStr = new String(valueStr.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

        ModelAndView mav = new ModelAndView();
        if (signVerified) {

            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);

            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            mav.addObject("info", "success");

            Order order = new Order();
            order.setTotal(total_amount);
            order.setUserId(userId);
            orderService.addANewOrder(userId, order, trade_no, total_amount);
            mav.setViewName("redirect:/account");
//            mav.addObject("orders", orderService.getUserOrder(userId));
        } else {
            mav.setViewName("redirect:/account");
//            mav.setViewName("checkout.jsp");
            mav.addObject("info", "fail");
        }
        return mav;
    }


    @RequestMapping(value = "/alipayNotifyNotice")
    @ResponseBody
    public String alipayNotifyNotice(HttpServletRequest request, HttpServletRequest response) throws Exception {
        // TODO: 2018/12/30 暂存   尚未有该功能   退款操作等是进入这个判断的
        Map<String, String> params = new HashMap<>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = iter.next();
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

        if (signVerified) {//验证成功
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);

            //交易状态
            String trade_status = new String(request.getParameter("trade_status").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);

            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);

            if (trade_status.equals("TRADE_FINISHED")) {

            } else if (trade_status.equals("TRADE_SUCCESS")) {
            }
        } else {//验证失败
            return "fail";
        }
        return "success";
    }
}
