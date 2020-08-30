<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="margin-top: 40px;margin-right: 50px;">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body>
<form class="layui-form">

    <div class="layui-form-item" style="display: none;margin: 0;height: 0;">
        <label class="layui-form-label">用户</label>
        <div class="layui-input-block">
          <input type="text" id="uid" name="uid">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-block">
            <select name="rid" id="rid" lay-verify="required">
                <option value=""></option>
            </select>
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

        $.ajax({
            url:'/role/findAll',
            type:'POST',
            success:function (result) {

                var data = result.map.data;
                console.log(data);
                $.each(data,function () {
                    var options = $("<option></option>").append(this.memo).attr("value",this.rid);
                    options.appendTo("#rid");
                    form.render("select");

                });
            }
        });

        //监听提交
        form.on('submit(formDemo)', function(data){
            //layer.msg(JSON.stringify(data.field));
             console.log(data.field);
            $.ajax({
                url:"/userRole/update",
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

    $(function () {
        var uid=GetQueryString("uid");
        $("#uid").val(uid);
        //console.log(uid);
    });


    //获取通过url地址栏传过来的id
    function GetQueryString(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return unescape(r[2]); return null;
    }


</script>
</body>
</html>