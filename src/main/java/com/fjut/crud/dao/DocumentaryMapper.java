package com.fjut.crud.dao;

import com.fjut.crud.bean.Documentary;

import java.util.List;
import java.util.Map;

public interface DocumentaryMapper {

    List<Map<String, Object>> findAll(Documentary documentary);

    void save(Documentary documentary);

    void delete(Integer id);

    void update(Documentary documentary);
}
