package com.cpx.controller;

import com.cpx.entity.User;
import com.cpx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/toRegister.do", method = RequestMethod.GET)
    public String toRegister() {
        return "register";
    }

    // 提交注册：/register.do
    @RequestMapping(value = "/register.do", method = RequestMethod.POST)
    public String register(User user, HttpSession session) {

        // 1) 基本校验（避免空值）
        if (user == null
                || user.getUsername() == null || user.getUsername().trim().isEmpty()
                || user.getPassword() == null || user.getPassword().trim().isEmpty()) {
            return "redirect:/toRegister.do?err=2"; // err=2：参数不完整（你可在register.jsp里提示）
        }

        // 2) 注册（用户名已存在则返回 false）
        boolean ok = userService.register(user);
        if (!ok) {
            return "redirect:/toRegister.do?err=1"; // err=1：用户名已存在
        }

        // 3) 两种选择（选一种即可）：

        // A. 注册成功后回到登录页，并提示 reg=1（推荐）
        return "redirect:/index.jsp?reg=1";

        // B. 注册成功后自动登录（如果你更想要这种体验，注释掉A，打开下面两行）
        // session.setAttribute("loginUser", user);
        // return "redirect:/teacher/list.do";
    }
    // 登录提交
    @PostMapping("/login.do")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session) {

        User u = userService.login(username, password);
        if (u == null) {
            return "redirect:/index.jsp?err=1";
        }
        session.setAttribute("loginUser", u);   // 登录态保存到 session [web:162]
        return "redirect:/teacher/list.do";
    }

    // 登出
    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();                  // 清空 session [web:162]
        return "redirect:/index.jsp";
    }
}
