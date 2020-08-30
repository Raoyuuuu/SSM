package com.fjut.crud.dao;

import com.fjut.crud.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    User findByUsername(@Param("username") String username);

    List<Map<String, Object>> findAll(User user);

    void save(User user);

    void update(User user);

    void delete(Integer id);

    User findByName(String username);
}
