package com.fjut.crud.controller;

import com.fjut.crud.bean.Customer;
import com.fjut.crud.bean.Msg;
import com.fjut.crud.service.CustomerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;


@RequestMapping("/customer")
@RestController
public class CustomerController {

    @Autowired
    CustomerService customerService;

    /**
     * 普通查询 条件查询
     * @param customer
     * @return
     */
    @RequestMapping("list")
    public Msg findList(Customer customer){
        List<Map<String,Object>> cust = customerService.findList(customer);
        return Msg.success().add("data",cust);
    }

    /**
     * 分页查询 条件查询
     */
    @RequestMapping("/findAll")
    public Msg findAll(@RequestParam(value = "page",defaultValue = "1") Integer page,@RequestParam(value = "limit",defaultValue = "10") Integer limit,Customer customer){
        PageHelper.startPage(page,limit);
        List<Map<String,Object>> cust = customerService.findAll(customer);
        PageInfo pages = new PageInfo(cust,limit);
        return Msg.success().add("data",pages);
    }

    /**
     *
     * @auther: raohuarong
     * @param:
     * @return:
     * @date: 2019/4/29 9:20
     * @description: 保存客户
     */
    @RequestMapping("/save")
    public Msg save(Customer customer){
        customerService.save(customer);
        return Msg.success();
    }
    /**
     *
     * @auther: raohuarong
     * @param:
     * @return:
     * @date: 2019/4/29 14:11
     * @description: 删除客户
     */
    @RequestMapping("/delete")
    public Msg delete(Integer id){
        customerService.delete(id);
        return Msg.success();
    }
    /**
     *
     * @auther: raohuarong
     * @param:
     * @return:
     * @date: 2019/4/29 14:12
     * @description: 更新用户
     */
    @RequestMapping("/update")
    public Msg update(Customer customer){
        customerService.update(customer);
        return Msg.success();
    }

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
}
