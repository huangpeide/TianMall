package com.example.demoboot.service;

import com.example.demoboot.bean.User;
import com.example.demoboot.bean.UserAddress;

import java.util.List;

public interface UserService {
    User login(String userName, String userPassword);

    User register(String userName, String userPassword, String userEmail);

    User checkUser(String userName);

    User getUserById(int id);

    UserAddress getUserAddressByUserId(int userId);

    int updateUserAddress(String shippingname, String phoneNum, String address, int userId);

    int updateUserPassword(String newpassword, int userId);

    boolean checkOldPassWordIsRight(int userId, String oldPassWord);

    List<User> getAllUser();
}
