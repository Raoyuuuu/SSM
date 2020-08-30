package com.fjut.crud.controller;

import com.fjut.crud.bean.Msg;
import com.fjut.crud.bean.UserRole;
import com.fjut.crud.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/userRole")
@RestController
public class UserRoleController {

    @Autowired
    private UserRoleService userRoleService;

    @RequestMapping("/update")
    public Msg update(UserRole userRole){
        userRoleService.update(userRole);
        return Msg.success();
    }

    @RequestMapping("/save")
    public Msg save(UserRole userRole){
        userRoleService.save(userRole);
        return Msg.success();
    }
}
