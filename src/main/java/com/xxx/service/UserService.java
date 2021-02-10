package com.xxx.service;

import com.xxx.domain.User;

public interface UserService {

    int insertUser(User user);

    int deleteUserById(Integer id);

    User selectUserByName(String name);

    User selectUserById(Integer id);
}
