package com.fjut.crud.service;

import com.fjut.crud.bean.Employee;
import com.fjut.crud.bean.EmployeeExample;
import com.fjut.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    //查询所有员工和级联的部门
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    /**
     * 保存员工
     * @param employee
     */
    public void save(Employee employee) {
        employeeMapper.insertSelective(employee);
    }


    /**
     *检查用户是否可用
     * @param empName
     * @return true：代表当前用户可用
     */
    public boolean checkUser(String empName) {
        //查找符合条件的记录数 如果有就会返回大于0的数
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count==0;
    }
}
