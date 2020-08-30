package com.fjut.crud.service;

import com.fjut.crud.bean.Customer;
import com.fjut.crud.dao.BaseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BaseService<T> {

    @Autowired
    BaseMapper baseMapper;

    public List<Map<String,Object>> findAll(T t) {
        return baseMapper.findAll(t);
    }
}
