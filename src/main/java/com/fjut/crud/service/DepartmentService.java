package com.fjut.crud.service;


import com.fjut.crud.bean.Department;
import com.fjut.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @auther: raoyu
 * @Title:
 * @Description:
 * @Date: 2019/4/15 11:05
 * @param:
 * @return:
 * @throws:
 */
@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getAllDept() {
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }
}
