package com.fjut.crud.controller;

import com.fjut.crud.bean.Msg;
import com.fjut.crud.bean.Role;
import com.fjut.crud.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/role")
@RestController
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("/findAll")
    public Msg findAll(Role role){
        List<Role> roles =  roleService.findAll(role);
        return Msg.success().add("data",roles);
    }
}
