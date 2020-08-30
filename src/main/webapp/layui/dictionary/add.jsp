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
        <label class="layui-form-label">类型编码</label>
        <div class="layui-input-block">
            <input type="text" name="dictTypeCode" required  lay-verify="required"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">类型名称</label>
        <div class="layui-input-block">
            <input type="text" name="dictTypeName" required  lay-verify="required"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">项目名称</label>
        <div class="layui-input-block">
            <input type="text" name="dictItemName" required  lay-verify="required"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">排序字段</label>
        <div class="layui-input-block">
            <input type="text" name="dictSort" required  lay-verify="required"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <input type="text" name="dictMemo" required  lay-verify="required"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>


<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/layui/layui.js"></script>
<script>
    //Demo
    layui.use(['form','layer'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.$;
        //监听提交
        form.on('submit(formDemo)', function(data){
            //layer.msg(JSON.stringify(data.field));
            //return false;

            $.ajax({
                url:"/dict/save",
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