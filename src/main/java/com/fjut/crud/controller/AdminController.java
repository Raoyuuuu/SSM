package com.fjut.crud.controller;


import com.fjut.crud.bean.User;
import com.fjut.crud.service.UserService;
import com.fjut.crud.utils.MD5Utils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    public User findByName(String username){

        return userService.findByName(username);

    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(){
        Subject subject = SecurityUtils.getSubject();
        if(subject!=null){
            subject.logout();
        }
        return "redirect:/login";
    }


    @RequestMapping("/index")
    public String index(){
        return "index";
    }



    @RequestMapping("/loginCheck")
    public String loginCheck(String username, String password,HttpSession session) {
        /**
         * 使用shiro编写认证操作
         */
        //1 获取subject
        Subject subject = SecurityUtils.getSubject();
        try {
        User users = findByName(username);
        String salt = users.getSalt();

        //2 封装用户数据
        UsernamePasswordToken token = new UsernamePasswordToken(username, MD5Utils.md5(password + salt));

        //3 执行登录方法

            subject.login(token);
            //校验没有异常 拿到主体用户
            User user = (User) subject.getPrincipal();
            //将拿到的用户放进session中
            session.setAttribute("user", user);
            session.setAttribute("users", users);
            return "index";
        } catch (UnknownAccountException e) {
            //登录失败，用户名不存在
            session.setAttribute("userMsg", "用户名不存在");
            return "redirect:/login";
        } catch (IncorrectCredentialsException e) {
            //登录失败，密码错误
            session.setAttribute("pswMsg", "密码错误");
            return "redirect:/login";
        }catch (NullPointerException e) {
            //登录失败，密码错误
            session.setAttribute("userMsg", "用户名不存在");
            return "redirect:/login";
        }
    }

}
