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
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="name" id="name" required  lay-verify="required" placeholder=""  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" id="sexOne" value="1" title="男" checked>
            <input type="radio" name="sex" id="sexZero" value="0" title="女">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">职务</label>
        <div class="layui-input-block">
            <input type="text" id="position" name="position"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">对应客户</label>
        <div class="layui-input-block">
            <select name="custNo" id="custNo" lay-verify="required" lay-search="">
                <option value=""></option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block">
            <input type="text" id="telephone" name="telephone" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">微信</label>
        <div class="layui-input-block">
            <input type="text" id="wechat" name="wechat" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-block">
            <input type="text" name="operator"  value="${user.usercode}"  class="layui-input layui-disabled">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <input type="text" id="remark" name="remark" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item" style="display:none;width: 0;height: 0">
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-block">
            <input type="text" id="createTime" name="createTime" class="layui-input" >
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
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
    layui.use(['form','layer'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.$;
        var time = CurentTime();

        $("#createTime").attr("value",time);

        //异步加载编辑中对应客户
        $.ajax({
            url:'/customer/list',
            type:'POST',
            success:function (result) {
                var lists = result.map.data;
                $.each(lists,function () {
                    var options = $("<option></option>").append(this.cust_name).attr("value",this.cust_id);
                    options.appendTo("#custNo");

                    form.render("select");

                });
            }
        });

        //监听提交
        form.on('submit(formDemo)', function(data){
            //layer.msg(JSON.stringify(data.field));
            console.log(data.field);
            $.ajax({
                url:"/linkman/save",
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

    //通用的获取时间方法
    function CurentTime() {
        var now = new Date();

        var year = now.getFullYear();       //年
        var month = now.getMonth() + 1;     //月
        var day = now.getDate();            //日

        var hh = now.getHours();            //时
        var mm = now.getMinutes();          //分
        var ss = now.getSeconds();           //秒

        var clock = year + "-";
        if(month < 10)
            clock += "0";
        clock += month + "-";

        if(day < 10)
            clock += "0";
        clock += day + " ";

        if(hh < 10)
            clock += "0";

        clock += hh + ":";
        if (mm < 10) clock += '0';
        clock += mm + ":";

        if (ss < 10) clock += '0';
        clock += ss;
        return(clock);
    }
</script>
</body>
</html>