package com.fjut.crud.service;

import com.fjut.crud.bean.BaseDict;
import com.fjut.crud.dao.BaseDictMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BaseDictService {
    @Autowired
    BaseDictMapper baseDictMapper;

//    public List<BaseDict> getAll() {
//        return baseDictMapper.selectByExample(null);
//    }
}
