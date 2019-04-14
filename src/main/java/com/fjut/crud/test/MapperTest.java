package com.fjut.crud.test;

import com.fjut.crud.bean.Department;
import com.fjut.crud.bean.Employee;
import com.fjut.crud.dao.DepartmentMapper;
import com.fjut.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;

    @Test
        public  void testCURD(){

        //插入部门数据
//      departmentMapper.insertSelective(new Department(null,"事业部"));
//      departmentMapper.insertSelective(new Department(null,"人事部"));

        //插入员工数据
//        employeeMapper.insertSelective(new Employee(null,"望月","M","asd@126.com",1));

        //批量生成
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for(int i=0;i<100;i++){
            String uid = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Employee(null,uid,"M",uid+"@126.com",1));

        }

    }
}
