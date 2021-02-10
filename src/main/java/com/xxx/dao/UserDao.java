package com.xxx.dao;

import com.xxx.domain.User;

public interface UserDao {

    int insertUser(User user);

    int deleteUserById(Integer id);

    User selectUserByName(String name);

    User selectUserById(Integer id);
}
