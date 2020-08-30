<%@ page language="java"  contentType="text/html;charset=UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">

    <title>CRM登录</title>

    <link rel="stylesheet" href="./static/layui/css/layui.css">
    <link rel="stylesheet" href="./static/layui/css/admin.css">
    <link rel="stylesheet" href="./static/layui/css/log.css">
    <script src="./static/js/jquery-3.3.1.min.js"></script>
    <script src="./static/layui/layui.js"></script>

<body>
<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">

    <div class="layadmin-user-login-main">

            <div class="layadmin-user-login-box layadmin-user-login-header">
                <h2>CRM管理系统</h2>
                <p>基于Layui的后台管理系统</p>
            </div>

        <form action="/loginCheck" method="post">
            <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-username"></label>
                    <input type="text" name="username" id="username"     placeholder="用户名" autocomplete="new-text" class="layui-input">
                    <div class="layui-form-mid layui-word-aux msg">${userMsg}</div>
                </div>
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-password"></label>
                    <input type="password" name="password" id="password"   placeholder="密码" autocomplete="new-password"  class="layui-input">
                    <div class="layui-form-mid layui-word-aux msg">${pswMsg}</div>
                </div>
                <div class="layui-form-item" style="margin-bottom: 20px;">
                    <a href="#" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
                </div>
                <div class="layui-form-item">
                    <button type="submit"  class="layui-btn layui-btn-fluid"  onclick=" return check()">登 入</button>
                </div>

        </div>
        </form>
    </div>

    <div class="layui-trans layadmin-user-login-footer">

        <p>© 2019 <a href="#" target="_blank">raoyuuuu</a></p>
    </div>


</div>


<script>

    layui.use(['layer','form'], function(){
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.$;
        //$(".msg").empty();
    });


    function check() {
        var name = $("#username").val();
        var password =$("#password").val();

        //用户名的规则： 昵称的长度为3-15，包含任意的字母、数字、中文，不可以使用其他符号
        var reg = /^([\u4e00-\u9fa5]|[a-zA-Z0-9]){3,15}$/i;
        var regP = /^[\S]{3,12}$/;
        if(name==null){
            layer.msg("用户名不能为空");
            return false;
        }
        else if(!reg.test(name)){
            layer.msg("长度为3-15，包含任意的字母、数字、中文<br/>不可使用特殊符号");
            return false;
        }
        else if(password==null){
            layer.msg("密码不能为空");
            return false;
        }
        else if(!regP.test(password)){
            layer.msg("密码不能为空，且必须3到12位");
            return false;
        }
    }


</script>
<%
    session.removeAttribute("userMsg");
    session.removeAttribute("pswMsg");
%>

</body>
</html>
