package com.fjut.crud.dao;

import com.fjut.crud.bean.BaseItem;

import java.util.List;

public interface BaseItemMapper {
     BaseItem getItemById(Integer id);
     //查询所有分类
     List<BaseItem> getAllItem();

}