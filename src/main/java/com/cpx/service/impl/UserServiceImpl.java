package com.cpx.service.impl;

import com.cpx.entity.User;
import com.cpx.mapper.UserMapper;
import com.cpx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String username, String password) {
        return userMapper.login(username, password);
    }

    @Override
    public boolean register(User user) {
        User exist = userMapper.findByUsername(user.getUsername());
        if (exist != null) {
            return false;
        }
        userMapper.insert(user);
        return true;
    }
}