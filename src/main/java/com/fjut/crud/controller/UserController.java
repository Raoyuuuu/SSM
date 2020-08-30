package com.fjut.crud.controller;

import com.fjut.crud.bean.Msg;
import com.fjut.crud.bean.User;
import com.fjut.crud.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RequestMapping("/user")
@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/list")
    public Msg findAll(@RequestParam(value = "page",defaultValue = "1") Integer page, @RequestParam(value = "limit",defaultValue = "10") Integer limit,
                       User user){
        PageHelper.startPage(page,limit);
        List<Map<String,Object>> users =  userService.findAll(user);
        PageInfo datas = new PageInfo(users,limit);
        return Msg.success().add("data",datas);
    }

    @RequestMapping("/save")
    public Msg save(User user){
        userService.save(user);
        return Msg.success();
    }

    @RequestMapping("/update")
    public Msg update(User user){
        userService.update(user);
        return Msg.success();
    }

    @RequestMapping("/delete")
    public Msg delete(Integer id){
        userService.delete(id);
        return Msg.success();
    }


}
