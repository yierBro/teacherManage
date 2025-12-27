package com.cpx.mapper;

import com.cpx.entity.Category;
import java.util.List;

public interface CategoryMapper {
    int insert(Category category);

    List<Category> findAllActive(); // status=1

    Category findById(Integer id);  // 新增：编辑回显

    int update(Category category);  // 新增：提交更新
}
