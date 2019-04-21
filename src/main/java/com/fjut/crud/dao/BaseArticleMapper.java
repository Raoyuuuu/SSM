package com.fjut.crud.dao;

import com.fjut.crud.bean.BaseArticle;

import java.util.List;

public interface BaseArticleMapper {

    //查询文章所有信息关联分类表
    List<BaseArticle> getArtWithItem();
}