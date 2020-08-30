package com.fjut.crud.dao;

import com.fjut.crud.bean.Linkman;

import java.util.List;
import java.util.Map;

public interface LinkmanMapper {

    List<Map<String, Object>> findAll(Linkman linkman);

    void save(Linkman linkman);

    void delete(Integer id);

    void update(Linkman linkman);

    Linkman findById(Integer ids);
}
