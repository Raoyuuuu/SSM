package com.fjut.crud.controller;

import com.fjut.crud.bean.Customer;
import com.fjut.crud.bean.Msg;
import com.fjut.crud.service.CustomerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
public class CustomerController {

    @Autowired
    CustomerService customerService;

    /**
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/saveCust",method = RequestMethod.POST)
     public Msg save(@Valid Customer customer, BindingResult result){
        if(result.hasErrors()) {
            //校验失败 返回校验失败的错误信息
            Map<String, Object> map = new HashMap<String, Object>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else{
            customerService.save(customer);
            return Msg.success();
        }
     }
    /**
     * 分页查询所有员工信息
     */
    @RequestMapping("/customers")
    //有responsebody可以直接返回json字符串 需要导入Jackson依赖
    public Msg getAll(@RequestParam(value = "pn",defaultValue = "1") Integer pn){

        PageHelper.startPage(pn,5);
        List<Customer> cust = customerService.getAll();
        PageInfo page = new PageInfo(cust,5);
        return Msg.success().add("pageInfo",page);

    }
}
