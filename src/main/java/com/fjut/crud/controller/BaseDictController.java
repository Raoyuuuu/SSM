package com.fjut.crud.controller;

import com.fjut.crud.bean.BaseDict;
import com.fjut.crud.bean.Msg;
import com.fjut.crud.service.BaseDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class BaseDictController {

    @Autowired
    BaseDictService baseDictService;

    @RequestMapping("/getAllDict")
    public Msg getAllDict(){
        List<BaseDict> list = baseDictService.getAll();
        return Msg.success().add("list",list);
    }
}
