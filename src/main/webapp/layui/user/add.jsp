<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="margin-top: 40px;margin-right: 50px;">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">

</head>
<body>
<form class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-block">
            <input type="text" name="username" id="username" required autocomplete="new-text"  lay-verify="required" placeholder="3-15位"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="password" id="password" name="password" autocomplete="new-password" placeholder="3-15位"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" id="usercode" name="usercode"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">入司时间</label>
        <div class="layui-input-block">
            <input type="text" id="createtime" name="createtime" class="layui-input" >
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block">
            <input type="text" id="phone" name="phone" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="gender" id="sexOne" value="1" title="男">
            <input type="radio" name="gender" id="sexZero" value="0" title="女">
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-input-block" style="margin-left: 215px">
            <button class="layui-btn" id="updateBtn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>


<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/layui/layui.js"></script>
<script>
    $(function () {

    });

    //Demo
    layui.use(['form','layer','laydate'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var laydate = layui.laydate;
        var $ = layui.$;

        //时间日期组件
        laydate.render({
            elem: '#createTime', //指定元素
            showBottom: false
        });


        //监听提交
        form.on('submit(formDemo)', function(data){
            //layer.msg(JSON.stringify(data.field));
            $.ajax({
                url:"/user/save",
                type:"POST",
                dataType:"json",
                //async:false,
                data:data.field,
                success:function(result){
                    layer.msg(result.msg, {
                        icon: 1,
                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                    }, function(){
                       parent.window.location.reload();
                    });
                }
            });
            return false
        });

    });

</script>
</body>
</html>