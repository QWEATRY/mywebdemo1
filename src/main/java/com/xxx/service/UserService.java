package com.xxx.service;

import com.xxx.domain.User;

public interface UserService {

    int insertUser(User user);

    int deleteUser(String name);

    User selectUserByName(String name);
}
