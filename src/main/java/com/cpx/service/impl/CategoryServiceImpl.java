package com.cpx.service.impl;

import com.cpx.entity.Category;
import com.cpx.mapper.CategoryMapper;
import com.cpx.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public void add(Category category) {
        if (category.getStatus() == null) {
            category.setStatus(1);
        }
        categoryMapper.insert(category);
    }

    @Override
    public List<Category> list() {
        return categoryMapper.findAllActive();
    }

    @Override
    public Category findById(Integer id) {
        return categoryMapper.findById(id);
    }

    @Override
    public void update(Category category) {
        categoryMapper.update(category);
    }
}
