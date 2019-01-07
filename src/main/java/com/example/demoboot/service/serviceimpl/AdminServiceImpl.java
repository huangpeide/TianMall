package com.example.demoboot.service.serviceimpl;

import com.example.demoboot.mapper.OrderMapper;
import com.example.demoboot.mapper.UserMapper;
import com.example.demoboot.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    OrderMapper orderMapper;

    @Override
    public boolean adminLogin(String username, String password) {
        return userMapper.adminLogin(username, password) == 1;
    }

    @Override
    public List<Double> getEveryMonthTotal() {
        // TODO: 2019/1/1 可优化查询
        List<Double> total = new ArrayList<>();
        String prefix = "2018-";
        String suffix = "-%";
        String[] month = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"};
        for (String s : month) {
            Double temp = orderMapper.selectPerMonthTotal(prefix + s + suffix);
            if (temp == null) {
                total.add(0.0);
            } else {
                total.add(temp);
            }
        }
        return total;
    }
}
