package com.fjut.crud.utils;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;

/**
 * 密码校验重写
 */
public class CredentialMatcher extends SimpleCredentialsMatcher {
    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
        //前端获取的密码
        String password = new String(usernamePasswordToken.getPassword());
        //数据库获取的密码
        String dbPassword = (String) info.getCredentials();
        //自定义 看两者是否相同
        return this.equals(password,dbPassword);

    }
}
