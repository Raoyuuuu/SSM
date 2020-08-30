package com.fjut.crud.service;

import com.fjut.crud.bean.BaseDict;
import com.fjut.crud.dao.BaseDictMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BaseDictService {
    @Autowired
    BaseDictMapper baseDictMapper;


    public List<BaseDict> findAll(BaseDict baseDict) {
        return baseDictMapper.findAll(baseDict);
    }

    public void save(BaseDict baseDict) {
        baseDictMapper.save(baseDict);
    }

    public void delete(Integer id) {
        baseDictMapper.delete(id);
    }

    public void update(BaseDict baseDict) {
        baseDictMapper.update(baseDict);
    }
}
