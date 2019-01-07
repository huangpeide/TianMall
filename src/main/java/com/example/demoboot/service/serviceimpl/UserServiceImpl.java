package com.example.demoboot.service.serviceimpl;

import com.example.demoboot.bean.User;
import com.example.demoboot.bean.UserAddress;
import com.example.demoboot.mapper.UserMapper;
import com.example.demoboot.service.UserService;
import org.mindrot.bcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String userName, String userPassword) {
        User login = userMapper.login(userName);
        if (BCrypt.checkpw(userPassword, login.getPassword())) {
            return login;
        }
        return null;
    }

    @Override
    public User register(String userName, String userPassword, String userEmail) {
        User user = new User();
        user.setUserName(userName);
        user.setEmail(userEmail);
        String cryptPassword = BCrypt.hashpw(userPassword, BCrypt.gensalt(6));
        user.setPassword(cryptPassword);
        userMapper.register(user);
        user.setPassword("");
        return user;
    }


    @Override
    public User checkUser(String userName) {
        return userMapper.checkUser(userName);
    }

    @Override
    public User getUserById(int id) {
        return userMapper.selectUserById(id);
    }

    @Override
    public UserAddress getUserAddressByUserId(int userId) {
        return userMapper.selectAddressByUserId(userId);
    }

    @Override
    public int updateUserAddress(String shippingname, String phoneNum, String address, int userId) {
        if (userMapper.selectAddressCountByUserId(userId) == 1) {
            return userMapper.updateAddress(shippingname, phoneNum, address, userId);
        } else {
            return userMapper.insertNewAddress(userId, shippingname, phoneNum, address);
        }
    }

    @Override
    public int updateUserPassword(String newpassword, int userId) {
        return userMapper.updateUserPassword(newpassword, userId);
    }

    @Override
    public boolean checkOldPassWordIsRight(int userId, String oldPassWord) {
        return userMapper.selectCountByPassword(userId, oldPassWord) == 1;
    }

    @Override
    public List<User> getAllUser() {
        return userMapper.selectAllUser();
    }
}
