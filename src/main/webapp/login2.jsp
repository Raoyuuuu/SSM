<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CRM登录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="./static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="./static/layui/css/admin.css" media="all">
    <link rel="stylesheet" href="static/layui/css/log.css" media="all">

</head>
<body>

<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">

    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>CRM管理系统</h2>
            <p>基于Layui的后台管理系统</p>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username"></label>
                <input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password"></label>
                <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" readonly onfocus="this.removeAttribute('readonly');" class="layui-input">
            </div>
            <div class="layui-form-item" style="margin-bottom: 20px;">
                <%--<input type="checkbox" name="remember" lay-skin="primary" title="记住密码" >--%>
                <a href="#" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit">登 入</button>
            </div>
            <div class="layui-trans layui-form-item layadmin-user-login-other">
                <label>社交账号登入</label>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>

                <a href="#" class="layadmin-user-jump-change layadmin-link">注册帐号</a>
            </div>
        </div>
    </div>

    <div class="layui-trans layadmin-user-login-footer">

        <p>© 2019 <a href="#" target="_blank">raoyuuuu</a></p>
    </div>


</div>

<script src="./static/layui/layui.js"></script>
<script>

    layui.use(['layer','form'], function(){
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.$;

        form.on('submit(LAY-user-login-submit)', function(obj) {
            console.log(obj.field);
            $.ajax({
                url:'/loginCheck',
                type:'POST',
                data:obj.field,
                success:function () {
                    layer.msg('登入成功', {
                        offset: '15px'
                        ,icon: 1
                        ,time: 1000
                    });
                }
            });
        });

    })
</script>
</body>

</html>
