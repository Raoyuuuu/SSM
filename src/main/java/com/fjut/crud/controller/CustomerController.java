package com.fjut.crud.controller;

import com.fjut.crud.bean.Customer;
import com.fjut.crud.bean.Msg;
import com.fjut.crud.service.CustomerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CustomerController {

    @Autowired
    CustomerService customerService;

    //分页查询所有员工信息
    @RequestMapping("/customers")
    //有responsebody可以直接返回json字符串 需要导入Jackson依赖
    public Msg getAll(@RequestParam(value = "pn",defaultValue = "1") Integer pn){

        PageHelper.startPage(pn,5);
        List<Customer> cust = customerService.getAll();
        PageInfo page = new PageInfo(cust,5);
        return Msg.success().add("pageInfo",page);

    }
}
