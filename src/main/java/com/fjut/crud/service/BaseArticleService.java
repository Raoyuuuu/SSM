package com.fjut.crud.service;

import com.fjut.crud.bean.BaseArticle;
import com.fjut.crud.dao.BaseArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BaseArticleService {
    @Autowired
    BaseArticleMapper baseArticleMapper;

    public List<BaseArticle> getAll() {
        return  baseArticleMapper.getArtWithItem();
    }
}
