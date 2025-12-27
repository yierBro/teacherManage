package com.cpx.mapper;

import com.cpx.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    User login(@Param("username") String username, @Param("password") String password);
    User findByUsername(@Param("username") String username);

    int insert(User user);
}
