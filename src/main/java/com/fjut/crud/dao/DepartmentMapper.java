package com.fjut.crud.dao;

import com.fjut.crud.bean.Department;

public interface DepartmentMapper {

    int deleteByPrimaryKey(Integer deptId);

    int insert(Department record);

    int insertSelective(Department record);


    Department selectByPrimaryKey(Integer deptId);



    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
}