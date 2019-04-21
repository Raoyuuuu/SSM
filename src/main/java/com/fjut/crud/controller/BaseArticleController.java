package com.fjut.crud.controller;

import com.fjut.crud.bean.BaseArticle;
import com.fjut.crud.bean.Msg;
import com.fjut.crud.service.BaseArticleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class BaseArticleController {
    @Autowired
    BaseArticleService baseArticleService;


    @RequestMapping("/getAll")
    public Msg getArtWithItem(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,5);
        List<BaseArticle> articles = baseArticleService.getAll();
        PageInfo page = new PageInfo(articles,5);
        return Msg.success().add("list",page);
    }
}
