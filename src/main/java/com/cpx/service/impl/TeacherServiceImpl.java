package com.cpx.service.impl;

import com.cpx.entity.Category;
import com.cpx.entity.Teacher;
import com.cpx.mapper.CategoryMapper;
import com.cpx.mapper.TeacherMapper;
import com.cpx.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public void add(Teacher teacher) {
        if (teacher.getStatus() == null) {
            teacher.setStatus(1); // 默认在职
        }
        teacherMapper.insert(teacher);
    }

    @Override
    @Transactional
    //在数据库里面查找每一个id也可以，时间复杂度是常数项系数很小的logN
    //同时数据库会有缓存
    //但是我们把两个都查出来然后
    //使用hashmap 时间复杂度是O1 常数项系数很大 也可以
    //在数据量太大的时候 论时间复杂度 hashmap好一点
    //数据量小的时候数据库论时间复杂度更好一点
    //这个性能不需要考虑太多
    public List<Teacher> list() {
        List<Category> categories = categoryMapper.findAllActive();
        HashMap<Integer,String> hashMap=new HashMap();
        //时间复杂度是O1
        for (Category category:categories) {
            hashMap.put(category.getId(),category.getName());
        }
        List<Teacher> teachers = teacherMapper.findAllActive();

        for (Teacher teacher : teachers) {
            teacher.setCname(hashMap.get(teacher.getCid()));
        }
        return teachers;
    }

    @Override
    public Teacher getById(Integer id) {
        return teacherMapper.findById(id);
    }

    @Override
    public void update(Teacher teacher) {
        teacherMapper.update(teacher);
    }

    @Override
    @Transactional
    public boolean delete(Integer id) {
        Teacher t = teacherMapper.findById(id);
        if (t == null) {
            return false;
        }
        if (t.getStatus() != null && t.getStatus() == 0) {
            teacherMapper.logicalDelete(id);
            return true;
        }
        return false;
    }
}
