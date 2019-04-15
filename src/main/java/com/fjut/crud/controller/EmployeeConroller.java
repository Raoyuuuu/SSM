package com.fjut.crud.controller;

import com.fjut.crud.bean.Employee;
import com.fjut.crud.bean.Msg;
import com.fjut.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class EmployeeConroller {


    @Autowired
    EmployeeService employeeService;

    /**
     * 检查用户名是否可用
     * @param empName
     * @return
     */
    @RequestMapping("/checkUser")
    @ResponseBody
    public Msg checkUser(@RequestParam(value="empName") String empName){
        //判断用户名是否是合法的表达式
        String regx ="(^[a-z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!empName.matches(regx)){
            return Msg.fail().add("va_msg", "用户名为2-5位中文，或者6-16位英文和数字组合");
        }

        //用户名是否重复校验
        boolean b = employeeService.checkUser(empName);
        if(b){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg", "用户名不可用");
        }


    }

    //员工保存
    @RequestMapping(value="/saveEmp",method = RequestMethod.POST)
    @ResponseBody
    public Msg save(Employee employee){
        employeeService.save(employee);
        return Msg.success();
    }

    //分页查询所有员工信息
    @RequestMapping("/emps")
    @ResponseBody
    //有responsebody可以直接返回json字符串 需要导入Jackson依赖
    public Msg getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){

        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAll();
        PageInfo page = new PageInfo(emps,5);
        return Msg.success().add("pageInfo",page);

    }

    //查询员工数据 分页查询
//    @RequestMapping("/emps")
//    public String getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
//        //这不是一个分页查询 需要添加以上pageNumber信息
//        //再引入pageHelper分页插件,然后在查询之前调用
//        PageHelper.startPage(pn,5);
//        List<Employee> emps = employeeService.getAll();
//
//        //包装查询出来的数据,只需将pageinfo交给页面就行了 用model 带给页面 传入连续显示的页数
//        PageInfo page = new PageInfo(emps,5);
//
//        model.addAttribute("pageInfo",page);
//        return "list";
//    }
}
