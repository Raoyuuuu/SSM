package com.fjut.crud.dao;

import java.util.List;
import java.util.Map;

/**
 * 通用接口
 */
public interface BaseMapper<T> {
    //分页查询 条件查询
     List<Map<String,Object>> findAll(T t);

    void save(T t);

    //void delete(T id);

    void update(T t);
}
