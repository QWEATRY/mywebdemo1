package com.xxx.service;

import com.xxx.dao.UserDao;
import com.xxx.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public int insertUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    public int deleteUserById(Integer id) {
        return userDao.deleteUserById(id);
    }

    @Override
    public User selectUserByName(String name) {
        return userDao.selectUserByName(name);
    }

    @Override
    public User selectUserById(Integer id) {
        return userDao.selectUserById(id);
    }
}
