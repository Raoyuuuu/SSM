package com.fjut.crud.service;

import com.fjut.crud.dao.BaseItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BaseItemService {
    @Autowired
    BaseItemMapper baseItemMapper;

}
