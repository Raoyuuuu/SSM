package com.fjut.crud.service;

import com.fjut.crud.bean.Role;
import com.fjut.crud.dao.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService {
    @Autowired
    private RoleMapper roleMapper;

    public List<Role> findAll(Role role) {
        return roleMapper.findAll(role);
    }
}
