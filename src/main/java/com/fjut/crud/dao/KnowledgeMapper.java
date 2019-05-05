package com.fjut.crud.dao;

import com.fjut.crud.bean.Knowledge;

import java.util.List;
import java.util.Map;

public interface KnowledgeMapper {

    //分页查询 条件查询
    List<Map<String,Object>> findAll(Knowledge knowledge);

    //新增文章
    void save(Knowledge knowledge);

    //删除
    void delete(Integer id);

    //更新
    void update(Knowledge knowledge);
}