package com.fjut.crud.controller;

import com.fjut.crud.bean.Linkman;
import com.fjut.crud.bean.Msg;
import com.fjut.crud.service.LinkmanService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RequestMapping("/linkman")
@RestController
public class LinkmanController {

    @Autowired
    LinkmanService linkmanService;

    @RequestMapping("/list")
    public Msg findList(Integer ids){
        Linkman linkman= linkmanService.findById(ids);
        return Msg.success().add("data",linkman);
    }

    @RequestMapping("/findAll")
    public Msg findAll(@RequestParam(value = "page",defaultValue = "1") Integer page, @RequestParam(value = "limit",defaultValue = "10") Integer limit, Linkman linkman){
        PageHelper.startPage(page,limit);
        List<Map<String,Object>> cust = linkmanService.findAll(linkman);
        PageInfo pages = new PageInfo(cust,limit);
        return Msg.success().add("data",pages);
    }

    @RequestMapping("/save")
    public Msg save(Linkman linkman){
        linkmanService.save(linkman);
        return Msg.success();
    }

    @RequestMapping("/delete")
    public Msg delete(Integer id){
        linkmanService.delete(id);
        return Msg.success();
    }

    @RequestMapping("/update")
    public Msg update(Linkman linkman){
        linkmanService.update(linkman);
        return Msg.success();
    }
}
