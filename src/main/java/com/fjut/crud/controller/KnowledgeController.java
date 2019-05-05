package com.fjut.crud.controller;


import com.fjut.crud.bean.Knowledge;
import com.fjut.crud.bean.Msg;
import com.fjut.crud.service.KnowledgeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;


@RequestMapping("/knowledge")
@RestController
public class KnowledgeController {
    @Autowired
    KnowledgeService knowledgeService;

    /**
     *分页查询 条件查询
     * @return
     */
    @RequestMapping("/list")
    public Msg getKnoList(@RequestParam(value="pageNum",defaultValue = "1") Integer pageNum,
                          @RequestParam(value="pageSize",defaultValue = "10") Integer pageSize,
                          Knowledge knowledge){
        PageHelper.startPage(pageNum,pageSize);
        List<Map<String, Object>> maps = knowledgeService.findAll(knowledge);
        PageInfo pages = new PageInfo(maps,pageSize);
        return Msg.success().add("data",pages);
    }

    /**
     * 新增
     * @param knowledge
     * @return
     */
    @RequestMapping("/save")
    public Msg sava(Knowledge knowledge){
        knowledgeService.save(knowledge);
        return Msg.success();
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public Msg delete(Integer id){
        knowledgeService.delete(id);
        return Msg.success();
    }

    /**
     * 更新
     * @param knowledge
     * @return
     */
    @RequestMapping("/update")
    public Msg update(Knowledge knowledge){
        knowledgeService.update(knowledge);
        return Msg.success();
    }
}
