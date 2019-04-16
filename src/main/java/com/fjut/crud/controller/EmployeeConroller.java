package com.fjut.crud.controller;

import com.fjut.crud.bean.Employee;
import com.fjut.crud.bean.Msg;
import com.fjut.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeConroller {


    @Autowired
    EmployeeService employeeService;

    /**
     * 单个删除和批量删除整合
     * 单个：1
     * 批量：1-2-3形式
     * @param ids
     * @return
     */

    @ResponseBody
    @RequestMapping(value="/delete/{ids}",method = RequestMethod.DELETE)
    public Msg deleteByID(@PathVariable("ids") String ids){
        //批量删除
        if(ids.contains("-")){
            List<Integer> list = new ArrayList<>();
            //包含“-”说明是批量删除
            String[] str_ids = ids.split("-");
            //组装ids的集合
            for (String string : str_ids) {
                //遍历转换成整型然后添加进list
                list.add(Integer.parseInt(string));
            }
            employeeService.deleteBatch(list);
        }else{
            //单个删除
            Integer id = Integer.parseInt(ids);
            employeeService.deleteById(id);

        }
        return Msg.success();
    }
//    @ResponseBody
//    @RequestMapping(value="/delete/{id}",method = RequestMethod.DELETE)
//    public Msg deleteByID(@PathVariable("id") Integer id){
//        employeeService.deleteById(id);
//        return Msg.success();
//    }

    /**
     * 根据ID更新员工信息
     * @return
     */
    @RequestMapping(value="/update/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg update(Employee employee){
        employeeService.update(employee);
        return Msg.success();
    }

    /**
     * 根据ID查询员工信息
     * @return
     */
    @RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){

        Employee employee = employeeService.getEmp(id);

        return Msg.success().add("emp", employee);
    }

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
    public Msg save(@Valid  Employee employee, BindingResult result){
        if(result.hasErrors()){
            //校验失败 返回校验失败的错误信息
            Map<String,Object> map = new HashMap<String, Object>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError:errors){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());

            }
            return Msg.fail().add("errorFields",map);
        }else{
            employeeService.save(employee);
            return Msg.success();
        }

    }

    //分页查询所有员工信息
    @RequestMapping("/emps")
    @ResponseBody
    //有responsebody可以直接返回json字符串 需要导入Jackson依赖
    public Msg getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn){

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
