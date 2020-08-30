package com.fjut.crud.utils;

import com.fjut.crud.bean.Permission;
import com.fjut.crud.bean.Role;
import com.fjut.crud.bean.User;
import com.fjut.crud.service.UserService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class AuthRealm  {

    @Autowired
    private UserService userService;

//    // 授权
//    @Override
//    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
//        //从session中获取到用户
//        User user = (User) principals.fromRealm(this.getClass().getName()).iterator().next();
//        //声明权限集合
//        List<String> permissionList = new ArrayList<>();
//        //声明角色集合
//        List<String> roleNameList = new ArrayList<>();
//        //从用户中获取对应角色
//        Set<Role> roleSet = user.getRoles();
//        if (CollectionUtils.isNotEmpty(roleSet)) {
//            for(Role role : roleSet) {
//                roleNameList.add(role.getRname());
//                //每个角色对应的权限
//                Set<Permission> permissionSet = role.getPermissions();
//                if (CollectionUtils.isNotEmpty(permissionSet)) {
//                    for (Permission permission : permissionSet) {
//                        permissionList.add(permission.getName());
//                    }
//                }
//            }
//        }
//        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
//        info.addStringPermissions(permissionList);
//        info.addRoles(roleNameList);
//        return info;
//    }
//
//    // 认证登录
//    @Override
//    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
//        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
//        String username = usernamePasswordToken.getUsername();
//        User user = userService.findByUsername(username);
//        return new SimpleAuthenticationInfo(user, user.getPassword(), this.getClass().getName());
//    }
}