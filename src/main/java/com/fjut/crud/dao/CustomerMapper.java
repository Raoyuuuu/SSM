package com.fjut.crud.dao;

import com.fjut.crud.bean.Customer;
import java.util.List;
import java.util.Map;


public interface CustomerMapper {
//    long countByExample(CustomerExample example);
//
//    int deleteByExample(CustomerExample example);
//
//    int deleteByPrimaryKey(Long custId);
//
//    int insert(Customer record);
//
//    int insertSelective(Customer record);
//
//    List<Customer> selectByExample(CustomerExample example);
//
//    Customer selectByPrimaryKey(Long custId);
//
//    //自定义
//    List<Customer> selectByExampleWithDase(CustomerExample example);
//    Customer selectByPrimaryKeyWithDase(Long custId);
//
//    int updateByExampleSelective(@Param("record") Customer record, @Param("example") CustomerExample example);
//
//    int updateByExample(@Param("record") Customer record, @Param("example") CustomerExample example);
//
//    int updateByPrimaryKeySelective(Customer record);
//
//    int updateByPrimaryKey(Customer record);

    //客户分页查询 条件查询
    List<Map<String,Object>> findAll(Customer customer);

    //List<Customer> findAll(Customer customer);

    //客户保存

}