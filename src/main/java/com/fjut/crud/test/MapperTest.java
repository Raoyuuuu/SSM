package com.fjut.crud.test;


import com.fjut.crud.bean.Knowledge;
import com.fjut.crud.dao.*;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    CustomerMapper customerMapper;
    @Autowired
    SqlSession sqlSession;
    @Autowired
    BaseItemMapper baseItemMapper;
    @Autowired
    KnowledgeMapper baseArticleMapper;

    @Test
        public  void testCURD(){

        //List<Knowledge> articles = baseArticleMapper.getArtWithItem();
        //System.out.println(articles);
//        BaseItem baseItem = baseItemMapper.getItemById(1);
//        System.out.println(baseItem);

        //插入部门数据
//      departmentMapper.insertSelective(new Department(null,"事业部"));
//      departmentMapper.insertSelective(new Department(null,"人事部"));

        //插入员工数据
//        employeeMapper.insertSelective(new Employee(null,"望月","M","asd@126.com",1));

        //批量生成
//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        for(int i=0;i<100;i++){
//            String uid = UUID.randomUUID().toString().substring(0, 5)+i;
//            mapper.insertSelective(new Employee(null,uid,"M",uid+"@126.com",1));
//
//        }

        //添加客户信息
        //customerMapper.insertSelective(new Customer(null,"李月","电话营销","网络教育","经理","13505618745","ceshi@126.com"));

        //批量添加客户信息
//        CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
//        for(int i=1;i<=30;i++){
//            String uid = UUID.randomUUID().toString().substring(0, 2)+i;
//            mapper.insertSelective(new Customer(null,uid+"王月","电话营销","房地产","经理","13505618745",uid+"jia@126.com"));
//        }


    }
}
