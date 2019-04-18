package com.fjut.crud.service;

import com.fjut.crud.bean.Customer;
import com.fjut.crud.dao.CustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {

    @Autowired
    CustomerMapper customerMapper;

    public List<Customer> getAll() {
        return customerMapper.selectByExampleWithDase(null);
    }

    public void save(Customer customer) {
        customerMapper.insertSelective(customer);
    }
}
