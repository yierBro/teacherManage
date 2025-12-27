package com.cpx.mapper;

import com.cpx.entity.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherMapper {

    int insert(Teacher teacher);

    List<Teacher> findAllActive();   // del=0

    Teacher findById(@Param("id") Integer id);

    int update(Teacher teacher);

    int logicalDelete(@Param("id") Integer id); // del=1
}
