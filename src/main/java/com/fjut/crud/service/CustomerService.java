package com.fjut.crud.service;

import com.fjut.crud.bean.Customer;
import com.fjut.crud.dao.CustomerMapper;
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

//
//    public void save(Customer customer) {
//        customerMapper.insertSelective(customer);
//    }
//
//    public Customer getCustById(Integer id) {
//        Customer customer = customerMapper.selectByPrimaryKey(Long.valueOf(id));
//        return customer;
//    }

    public List<Map<String,Object>> findAll(Customer customer) {
        return customerMapper.findAll(customer);
    }

    public void save(Customer customer) {
        customerMapper.save(customer);
    }

    public void delete(Integer id) {
        customerMapper.delete(id);
    }

    public void update(Customer customer) {
        customerMapper.update(customer);
    }



//        public List<Customer> findAll(Customer customer){
//                return customerMapper.findAll(customer);
//        }
}
