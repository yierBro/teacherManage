package com.cpx.controller;

import com.cpx.entity.Category;
import com.cpx.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    // 跳转到新增院系页面
    @RequestMapping("/toAdd.do")
    public String toAdd() {
        return "category_add";
    }

    // 提交新增
    @RequestMapping(value = "/add.do", method = RequestMethod.POST)
    public String add(Category category) {
        categoryService.add(category);
        return "redirect:/category/list.do";
    }

    // 院系列表（只展示 status=1 的 active）
    @RequestMapping("/list.do")
    public String list(Model model) {
        List<Category> list = categoryService.list();
        model.addAttribute("categories", list);
        return "category_list";
    }

    // ===== 新增：跳转到编辑页（回显数据） =====
    @RequestMapping("/toEdit.do")
    public String toEdit(@RequestParam("id") Integer id, Model model) {
        Category category = categoryService.findById(id);
        model.addAttribute("category", category);
        return "category_edit";
    }

    // ===== 新增：提交编辑 =====
    @RequestMapping(value = "/edit.do", method = RequestMethod.POST)
    public String edit(Category category) {
        categoryService.update(category);
        return "redirect:/category/list.do";
    }
}
