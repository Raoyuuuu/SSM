package com.fjut.crud.service;

import com.fjut.crud.bean.UserRole;
import com.fjut.crud.dao.UserRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserRoleService {

    @Autowired
    private UserRoleMapper userRoleMapper;

    public void update(UserRole userRole) {
        userRoleMapper.update(userRole);
    }

    public void save(UserRole userRole) {
        userRoleMapper.save(userRole);
    }
}
