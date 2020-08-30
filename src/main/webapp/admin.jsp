<%@ page language="java"  contentType="text/html;charset=UTF-8"  %>

<html>
<head>
    <meta charset="UTF-8">

    <title>CRM登录</title>

    <link rel="stylesheet" href="./static/layui/css/layui.css">
    <link rel="stylesheet" href="./static/layui/css/admin.css">
    <link rel="stylesheet" href="./static/layui/css/log.css">
    <script src="./static/js/jquery-3.3.1.min.js"></script>
    <script src="./static/layui/layui.js"></script>
</head>
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
                    <input type="text" name="username" id="LAY-user-login-username" lay-verify="username" placeholder="用户名" class="layui-input">
                    <div class="layui-form-mid layui-word-aux">${userMsg}</div>
                </div>
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-password"></label>
                    <input type="password" name="password" id="LAY-user-login-password" lay-verify="pass" placeholder="密码" readonly onfocus="this.removeAttribute('readonly');" class="layui-input">
                </div>
                <div class="layui-form-item" style="margin-bottom: 20px;">
                    <a href="#" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
                </div>
                <div class="layui-form-item">
                    <button type="submit" class="layui-btn layui-btn-fluid" >登 入</button>
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

        form.verify({
            username: function(value, item){ //value：表单的值、item：表单的DOM对象
                if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                    return '用户名不能有特殊字符';
                }
                if(/(^\_)|(\__)|(\_+$)/.test(value)){
                    return '用户名首尾不能出现下划线\'_\'';
                }
                if(/^\d+\d+\d$/.test(value)){
                    return '用户名不能全为数字';
                }
            }

            //我们既支持上述函数式的方式，也支持下述数组的形式
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            ,pass: [
                /^[\S]{3,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
        });

    })

</script>


</body>
</html>
