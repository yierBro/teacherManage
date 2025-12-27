package com.cpx.controller;

import com.cpx.entity.Category;
import com.cpx.entity.Teacher;
import com.cpx.service.CategoryService;
import com.cpx.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private CategoryService categoryService;

    // 教师列表
    @RequestMapping("/list.do")
    public String list(Model model) {
        List<Teacher> list = teacherService.list();
        model.addAttribute("teachers", list);
        return "teacher_list";
    }

    // 跳转到新增教师
    @RequestMapping("/toAdd.do")
    public String toAdd(Model model) {
        List<Category> categories = categoryService.list();
        model.addAttribute("categories", categories);
        return "teacher_add";
    }

    // 提交新增教师
    @RequestMapping(value = "/add.do", method = RequestMethod.POST)
    public String add(Teacher teacher) {
        teacherService.add(teacher);
        return "redirect:/teacher/list.do";
    }

    // 跳转到修改页面
    @RequestMapping("/toEdit.do")
    public String toEdit(@RequestParam("id") Integer id, Model model) {
        Teacher t = teacherService.getById(id);
        List<Category> categories = categoryService.list();
        model.addAttribute("teacher", t);
        model.addAttribute("categories", categories);
        return "teacher_edit";
    }

    // 提交修改
    @RequestMapping(value = "/update.do", method = RequestMethod.POST)
    public String update(Teacher teacher) {
        teacherService.update(teacher);
        return "redirect:/teacher/list.do";
    }

    // 删除（只允许删除停聘教师）
    @RequestMapping("/delete.do")
    public String delete(@RequestParam("id") Integer id) {
        teacherService.delete(id);
        return "redirect:/teacher/list.do";
    }
}
