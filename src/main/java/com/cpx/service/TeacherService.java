package com.cpx.service;

import com.cpx.entity.Teacher;

import java.util.List;

public interface TeacherService {

    void add(Teacher teacher);

    List<Teacher> list();

    Teacher getById(Integer id);

    void update(Teacher teacher);

    boolean delete(Integer id);  // 只删除停聘教师
}
