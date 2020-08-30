package com.fjut.crud.service;

import com.fjut.crud.bean.Linkman;
import com.fjut.crud.dao.LinkmanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LinkmanService {

    @Autowired
    LinkmanMapper linkmanMapper;

    public List<Map<String, Object>> findAll(Linkman linkman) {
        return linkmanMapper.findAll(linkman);
    }

    public void save(Linkman linkman) {
        linkmanMapper.save(linkman);
    }

    public void delete(Integer id) {
        linkmanMapper.delete(id);
    }

    public void update(Linkman linkman) {
        linkmanMapper.update(linkman);
    }


    public Linkman findById(Integer ids) {
        return linkmanMapper.findById(ids);
    }
}
