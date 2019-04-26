package com.fjut.crud.service;

import com.fjut.crud.bean.Customer;
import com.fjut.crud.dao.CustomerMapper;
import jdk.nashorn.internal.ir.ReturnNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CustomerService {

    @Autowired
    CustomerMapper customerMapper;

//    public List<Customer> getAll() {
//        return customerMapper.selectByExampleWithDase(null);
//    }


    public void save(Customer customer) {
        customerMapper.insertSelective(customer);
    }

    public Customer getCustById(Integer id) {
        Customer customer = customerMapper.selectByPrimaryKey(Long.valueOf(id));
        return customer;
    }

    public List<Map<String,Object>> findAll(Customer customer) {
        return customerMapper.findAll(customer);
    }
}
