package com.fjut.crud.service;

import com.fjut.crud.bean.User;
import com.fjut.crud.dao.UserMapper;
import com.fjut.crud.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.security.provider.MD5;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User findByUsername(String username){
        return userMapper.findByUsername(username);
    }

    public List<Map<String, Object>> findAll(User user) {
        return userMapper.findAll(user);
    }

    public void save(User user) {
        String salt = UUID.randomUUID().toString();
        user.setSalt(salt);
        user.setPassword(MD5Utils.md5(user.getPassword()+salt));
        userMapper.save(user);
    }

    public void update(User user) {
        String salt = UUID.randomUUID().toString();
        user.setSalt(salt);
        user.setPassword(MD5Utils.md5(user.getPassword()+salt));
        userMapper.update(user);
    }

    public void delete(Integer id) {
        userMapper.delete(id);
    }


    public User findByName(String username) {
        return userMapper.findByName(username);
    }
}
