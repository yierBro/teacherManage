package com.cpx.service;

import com.cpx.entity.Category;
import java.util.List;

public interface CategoryService {

    void add(Category category);

    List<Category> list();

    Category findById(Integer id);   // 新增

    void update(Category category);  // 新增
}
