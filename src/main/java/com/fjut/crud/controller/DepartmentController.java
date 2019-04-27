package com.fjut.crud.controller;

import com.fjut.crud.bean.Department;
import com.fjut.crud.bean.Msg;
import com.fjut.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @auther: raoyu
 * @Title:
 * @Description:
 * @Date: 2019/4/15 11:03
 * @param:
 * @return:
 * @throws:
 */
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

//    //获取返回所有部门信息
//    @RequestMapping("/depts")
//    @ResponseBody
//    public Msg getAllDept(){
//        List<Department> list = departmentService.getAllDept();
//        return Msg.success().add("depts", list);
//    }
}
