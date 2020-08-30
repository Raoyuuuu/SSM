package com.fjut.crud.controller;

import com.fjut.crud.bean.BaseDict;
import com.fjut.crud.bean.Msg;
import com.fjut.crud.service.BaseDictService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RequestMapping("/dict")
@RestController
public class BaseDictController {

    @Autowired
    BaseDictService baseDictService;

    /**
     * 查询所有，异步加载字典项数据
     * @param baseDict
     * @return
     */
    @RequestMapping("/list")
    public Msg list(BaseDict baseDict){
        List<BaseDict> cust = baseDictService.findAll(baseDict);
        return Msg.success().add("data",cust);
    }

    /**
     * 分页查询 条件查询
     * @param page
     * @param limit
     * @param baseDict
     * @return
     */
    @RequestMapping("/findAll")
    public Msg findAll(@RequestParam(value = "page",defaultValue = "1") Integer page, @RequestParam(value = "limit",defaultValue = "10") Integer limit, BaseDict baseDict){
        PageHelper.startPage(page,limit);
        List<BaseDict> cust = baseDictService.findAll(baseDict);
        PageInfo pages = new PageInfo(cust,limit);
        return Msg.success().add("data",pages);
    }

    /**
     * 新增
     * @param baseDict
     * @return
     */
    @RequestMapping("/save")
    public Msg save(BaseDict baseDict){
        baseDict.setDictEnable("1");
        baseDictService.save(baseDict);
        return Msg.success();
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public Msg delete(Integer id){
        baseDictService.delete(id);
        return Msg.success();
    }

    @RequestMapping("/update")
    public Msg update(BaseDict baseDict){
        baseDictService.update(baseDict);
        return Msg.success();
    }
}
