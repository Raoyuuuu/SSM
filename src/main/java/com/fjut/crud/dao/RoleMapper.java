package com.fjut.crud.dao;

import com.fjut.crud.bean.Role;

import java.util.List;

public interface RoleMapper {

    List<Role> findAll(Role role);

}
