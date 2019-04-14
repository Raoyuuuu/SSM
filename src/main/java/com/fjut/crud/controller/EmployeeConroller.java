package com.fjut.crud.controller;

import com.fjut.crud.bean.Employee;
import com.fjut.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class EmployeeConroller {


    @Autowired
    EmployeeService employeeService;

    //查询员工数据 分页查询
    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        //这不是一个分页查询 需要添加以上pageNumber信息
        //再引入pageHelper分页插件,然后在查询之前调用
        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAll();

        //包装查询出来的数据,只需将pageinfo交给页面就行了 用model 带给页面 传入连续显示的页数
        PageInfo page = new PageInfo(emps,5);

        model.addAttribute("pageInfo",page);
        return "list";
    }
}
