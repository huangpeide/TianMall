package com.example.demoboot.mapper;

import com.example.demoboot.bean.User;
import com.example.demoboot.bean.UserAddress;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface UserMapper {
    @Insert("INSERT INTO `userinfo`(username,email,password) VALUES (#{userName}, #{email}, #{password})")
    int register(User user);

    @Select("SELECT * FROM `userinfo` WHERE username=#{userName}")
    User login(@Param("userName") String userName);

    @Select("SELECT * FROM `userinfo` WHERE username=#{userName}")
    User checkUser(@Param("userName") String userName);

    @Select("SELECT * FROM `userinfo` WHERE id=#{id}")
    User selectUserById(@Param("id") int id);

    @Select("SELECT * FROM `address` WHERE userId=#{id}")
    UserAddress selectAddressByUserId(@Param("id") int userId);

    @Update("UPDATE `address` SET shippingname=#{shippingname},phoneNum=#{phoneNum},address=#{address} WHERE userId=#{userId}")
    int updateAddress(@Param("shippingname") String shippingname, @Param("phoneNum") String phoneNum
            , @Param("address") String address, @Param("userId") int userId);

    @Update("UPDATE `userinfo` SET password=#{newpassword} WHERE id=#{userId}")
    int updateUserPassword(@Param("newpassword") String newpassword, @Param("userId") int userId);


    @Select("SELECT COUNT(*) FROM `userinfo` WHERE id=#{id} AND password=#{password}")
    int selectCountByPassword(@Param("id") int id, @Param("password") String password);

    @Select("SELECT COUNT(*) FROM `address` WHERE userId=#{id}")
    int selectAddressCountByUserId(@Param("id") int id);

    @Insert("INSERT INTO `address`(userId,shippingname,phoneNum,address) " +
            "VALUES(#{userid},#{shippingname},#{phoneNum},#{address})")
    int insertNewAddress(@Param("userid") int userId, @Param("shippingname") String shippingname,
                         @Param("phoneNum") String phoneNum, @Param("address") String address);


    /*
    管理员部分
     */
    @Select("SELECT COUNT(*) FROM `adminuser` WHERE username=#{username} AND password=#{password}")
    int adminLogin(@Param("username") String username, @Param("password") String password);


    @Select("SELECT * FROM `userinfo`")
    List<User> selectAllUser();
}
