package com.fjut.crud.dao;

import com.fjut.crud.bean.Customer;
import java.util.List;
import java.util.Map;


public interface CustomerMapper {

    //客户分页查询 条件查询
    List<Map<String,Object>> findAll(Customer customer);

    void save(Customer customer);

    void delete(Integer id);

    void update(Customer customer);

    List<Map<String,Object>> findList(Customer customer);


}