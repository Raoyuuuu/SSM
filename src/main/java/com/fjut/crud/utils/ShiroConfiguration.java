package com.fjut.crud.utils;

import org.apache.shiro.cache.MemoryConstrainedCacheManager;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;

//@Configuration
public class ShiroConfiguration {

//    @Bean("shiroFilter")
//    public ShiroFilterFactoryBean shiroFilter(@Qualifier("securityManager") DefaultWebSecurityManager manager){
//        ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
//        bean.setSecurityManager(manager);
//
//        //定义登录的URL
//        bean.setLoginUrl("/login");
//        //登录成功后跳转
//        bean.setSuccessUrl("/index");
//        //没有权限跳转的页面
//        bean.setUnauthorizedUrl("/unauthorized");
//
//        /**
//         * shiro内置过滤器：可以实现权限相关的拦截
//         *     常用的过滤器：
//         *        anon:无需认证（登录）可以访问
//         *        authc：必须认证才可以访问
//         *        user：如果使用rememberMe可以直接访问
//         *        perms：该资源必须得到资源权限才可以进行访问
//         *        role：该资源必须得到角色权限才可以访问
//         */
//        //某些请求的拦截
//        LinkedHashMap<String,String> filterChainDefinitionMap = new LinkedHashMap<>();
//        filterChainDefinitionMap.put("/index","authc");
//        filterChainDefinitionMap.put("/login","anon");
//        filterChainDefinitionMap.put("/user/**","roles[admin]");//只有admin的角色才可以访问/admin
//        filterChainDefinitionMap.put("/loginCheck","anon");
//        filterChainDefinitionMap.put("/druid/**","anon");
//        //filterChainDefinitionMap.put("/user/**","perms[select]");
//        filterChainDefinitionMap.put("/aaa","perms[select]");
//        filterChainDefinitionMap.put("/**","user");
//
//        bean.setFilterChainDefinitionMap(filterChainDefinitionMap);
//
//        return bean;
//    }
//
//    @Bean("securityManager")
//    public DefaultWebSecurityManager securityManager(@Qualifier("authRealm") AuthRealm authRealm){
//        DefaultWebSecurityManager manager = new DefaultWebSecurityManager();
//        manager.setRealm(authRealm);
//        return manager;
//    }
//
//    @Bean("authRealm")
//    public AuthRealm authRealm(@Qualifier("credentialMatcher") CredentialMatcher matcher){
//        AuthRealm authRealm = new AuthRealm();
//        //缓存
//        authRealm.setCacheManager(new MemoryConstrainedCacheManager());
//        authRealm.setCredentialsMatcher(matcher);
//        return authRealm;
//    }
//
//    /**
//     * 密码校验规则
//     * @return
//     */
//    @Bean("credentialMatcher")
//    public CredentialMatcher credentialMatcher(){
//        return new CredentialMatcher();
//    }
//
//    //spring处理securityManager
//    @Bean
//    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(@Qualifier("securityManager") DefaultWebSecurityManager securityManager){
//        AuthorizationAttributeSourceAdvisor advisor = new AuthorizationAttributeSourceAdvisor();
//        advisor.setSecurityManager(securityManager);
//        return advisor;
//    }
//
//    @Bean
//    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator(){
//        DefaultAdvisorAutoProxyCreator creator = new DefaultAdvisorAutoProxyCreator();
//        creator.setProxyTargetClass(true);
//        return creator;
//    }
}
