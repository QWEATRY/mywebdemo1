package com.xxx.dao;

import com.xxx.domain.User;

public interface UserDao {

    int insertUser(User user);

    int deleteUser(String name);

    User selectUserByName(String name);
}
