package com.fjut.crud.controller;

import com.fjut.crud.bean.BaseItem;
import com.fjut.crud.bean.Msg;
import com.fjut.crud.service.BaseItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @auther: raoyu
 * @Title:
 * @Description:
 * @Date: 2019/4/22 17:53
 * @param:
 * @return:
 * @throws:
 */
@RestController
public class BaseItemController {
    @Autowired
    BaseItemService baseItemService;

    //查询所有分类
    @RequestMapping("/getAllItem")
    public Msg getAllItem(){
        List<BaseItem> allItem = baseItemService.getAllItem();
        return Msg.success().add("cates", allItem);
    }
}
