package com.fjut.crud.service;

import com.fjut.crud.bean.Knowledge;
import com.fjut.crud.dao.KnowledgeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class KnowledgeService {

    @Autowired
    KnowledgeMapper knowledgeMapper;

    /**
     * 分页查询 条件查询文章
     * @param knowledge
     * @return
     */
    public List<Map<String,Object>> findAll(Knowledge knowledge) {
        return knowledgeMapper.findAll(knowledge);
    }

    /**
     * 新增文章
     * @param knowledge
     */
    public void save(Knowledge knowledge) {
        knowledgeMapper.save(knowledge);
    }

    /**
     * 删除
     * @param id
     */
    public void delete(Integer id) {
        knowledgeMapper.delete(id);
    }

    /**
     * 更新
     * @param knowledge
     */
    public void update(Knowledge knowledge) {
        knowledgeMapper.update(knowledge);
    }
}
