package com.fjut.crud.dao;

import com.fjut.crud.bean.BaseDict;

import java.util.List;
import java.util.Map;

public interface BaseDictMapper {

    List<BaseDict> findAll(BaseDict baseDict);

    void save(BaseDict baseDict);

    void delete(Integer id);

    void update(BaseDict baseDict);
}