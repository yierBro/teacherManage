package com.cpx.service;

import com.cpx.entity.User;

public interface UserService {
    User login(String username, String password);
    boolean register(User user); // true=注册成功，false=用户名已存在
}
