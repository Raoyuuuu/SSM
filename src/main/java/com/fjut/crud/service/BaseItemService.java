package com.fjut.crud.service;

import com.fjut.crud.bean.BaseItem;
import com.fjut.crud.dao.BaseItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BaseItemService {
    @Autowired
    BaseItemMapper baseItemMapper;


    public List<BaseItem> getAllItem() {
        return baseItemMapper.getAllItem();
    }
}