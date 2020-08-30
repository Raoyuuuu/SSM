package com.fjut.crud.controller;

import com.fjut.crud.bean.Documentary;
import com.fjut.crud.bean.Msg;
import com.fjut.crud.service.DocumentaryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RequestMapping("/documentary")
@RestController
public class DocumentaryController {

    @Autowired
    DocumentaryService documentaryService;

    /**
     * 分页查询 条件查询
     * @param page
     * @param limit
     * @param documentary
     * @return
     */
    @RequestMapping("/findAll")
    public Msg findAll(@RequestParam(value="page",defaultValue = "1") Integer page, @RequestParam(value="limit",defaultValue = "10") Integer limit,
                       Documentary documentary){
        PageHelper.startPage(page,limit);
        List<Map<String,Object>> cust = documentaryService.findAll(documentary);
        PageInfo pages = new PageInfo(cust,limit);
        return Msg.success().add("data",pages);
    }

    @RequestMapping("/save")
    public Msg save(Documentary documentary){
        documentaryService.save(documentary);
        return Msg.success();
    }

    @RequestMapping("/delete")
    public Msg delete(Integer id){
        documentaryService.delete(id);
        return Msg.success();
    }

    @RequestMapping("/update")
    public Msg update(Documentary documentary){
        documentaryService.update(documentary);
        return Msg.success();
    }
}
