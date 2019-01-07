package com.example.demoboot.service;

import java.util.List;

public interface AdminService {
    boolean adminLogin(String username, String password);

    List<Double> getEveryMonthTotal();
}
