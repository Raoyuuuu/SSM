package com.fjut.crud.controller;

import com.fjut.crud.bean.Customer;
import com.fjut.crud.bean.LayuiResult;
import com.fjut.crud.bean.Msg;
import com.fjut.crud.service.CustomerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RequestMapping("/customer")
@RestController
public class CustomerController {

    @Autowired
    CustomerService customerService;


//    @RequestMapping(value="/getCustById/{id}")
//    public Msg getCustById(@PathVariable("id") Integer id){
//        Customer customer = customerService.getCustById(id);
//        return Msg.success().add("custs",customer);
//    }
//
//    /**
//     *保存客户信息
//     * @param
//     * @return
//     */
//    @RequestMapping(value = "/saveCust",method = RequestMethod.POST)
//     public Msg save(@Valid Customer customer, BindingResult result){
//        if(result.hasErrors()) {
//            //校验失败 返回校验失败的错误信息
//            Map<String, Object> map = new HashMap<String, Object>();
//            List<FieldError> errors = result.getFieldErrors();
//            for (FieldError fieldError : errors) {
//                map.put(fieldError.getField(), fieldError.getDefaultMessage());
//            }
//            return Msg.fail().add("errorFields", map);
//        }else{
//            customerService.save(customer);
//            return Msg.success();
//        }
//     }
    /**
     * 分页查询所有员工信息
     */
    @RequestMapping("/findAll")
    public Msg findAll(@RequestParam(value = "page",defaultValue = "1") Integer page,@RequestParam(value = "limit",defaultValue = "10") Integer limit,Customer customer){
        PageHelper.startPage(page,limit);
        List<Map<String,Object>> cust = customerService.findAll(customer);
        PageInfo pages = new PageInfo(cust,limit);
        return Msg.success().add("data",pages);
    }


    //@RequestMapping("/save")
//    public Msg save(Customer customer){
//        customerService.save(customer);
//        return Msg.success();
//    }

//    /**
//     * 分页查询所有员工信息 用这种方式不好返回
//     */
//    @RequestMapping("/findAll")
//    public LayuiResult<Customer> findAll(@RequestParam(value = "page",defaultValue = "1") Integer page,@RequestParam(value = "limit",defaultValue = "10") Integer limit,Customer customer){
//        LayuiResult<Customer> result = new LayuiResult<>();
//        List<Customer> list = customerService.findAll(customer);
//        result.setData(list);
//        return result;
//    }
}
