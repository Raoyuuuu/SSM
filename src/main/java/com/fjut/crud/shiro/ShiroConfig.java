package com.fjut.crud.shiro;


import com.fjut.crud.utils.CredentialMatcher;
import org.apache.shiro.cache.MemoryConstrainedCacheManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;

/**
 * shiro的配置类
 */
@Configuration
public class ShiroConfig {

    /**
     * 创建ShiroFilterFactoryBean
     */
    @Bean("shiroFilter")
    public ShiroFilterFactoryBean shiroFilterFactoryBean(@Qualifier("securityManager") DefaultWebSecurityManager securityManager){
        ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();

        //设置安全管理器
        bean.setSecurityManager(securityManager);

        //添加shiro内置器
        /**
         * shiro内置过滤器：可以实现权限相关的拦截
         *     常用的过滤器：
         *        anon:无需认证（登录）可以访问
         *        authc：必须认证才可以访问
         *        user：如果使用rememberMe可以直接访问
         *        perms：该资源必须得到资源权限才可以进行访问
         *        role：该资源必须得到角色权限才可以访问
         */
        LinkedHashMap<String,String> filterMap = new LinkedHashMap<>();
        filterMap.put("/static/**","anon");
        filterMap.put("/index","authc");
        filterMap.put("/login","anon");
        filterMap.put("/loginCheck","anon");
        filterMap.put("/user/update","roles[normal]");
        filterMap.put("/user/update","roles[admin]");
        filterMap.put("/user/**","roles[admin]");
        filterMap.put("/user/user/","perms[select]");
        filterMap.put("/**","user");

        //定义登录的URL
        bean.setLoginUrl("/login");
        //登录成功后跳转
        bean.setSuccessUrl("/index");
        //没有权限跳转的页面
        bean.setUnauthorizedUrl("/unAuth");


        bean.setFilterChainDefinitionMap(filterMap);
        return bean;
    }

    /**
     * 创建DefaultWebSecurityManager 安全管理器
     */
    @Bean("securityManager")
    public DefaultWebSecurityManager securityManager(@Qualifier("userRealm") UserRealm userRealm){
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        //关联realm
        securityManager.setRealm(userRealm);
        return securityManager;
    }

    /**
     * 创建Realm
     * Shiro连接数据的桥梁
     * @Bean 将方法放入spring的环境
     */
    @Bean("userRealm")
    public UserRealm userRealm(@Qualifier("credentialMatcher") CredentialMatcher matcher){
        UserRealm userRealm = new UserRealm();
        //缓存
        userRealm.setCacheManager(new MemoryConstrainedCacheManager());
        userRealm.setCredentialsMatcher(matcher);
        return userRealm;
    }

    /**
     * 密码校验规则
     * @return
     */
    @Bean("credentialMatcher")
    public CredentialMatcher credentialMatcher(){
        return new CredentialMatcher();
    }


}
