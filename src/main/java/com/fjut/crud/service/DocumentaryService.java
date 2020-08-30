package com.fjut.crud.service;

import com.fjut.crud.bean.Documentary;
import com.fjut.crud.dao.DocumentaryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DocumentaryService {

    @Autowired
    DocumentaryMapper documentaryMapper;

    public List<Map<String, Object>> findAll(Documentary documentary) {
        return documentaryMapper.findAll(documentary);
    }

    public void save(Documentary documentary) {
        documentaryMapper.save(documentary);
    }

    public void delete(Integer id) {
        documentaryMapper.delete(id);
    }

    public void update(Documentary documentary) {
        documentaryMapper.update(documentary);
    }
}
