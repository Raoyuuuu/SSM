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
        <label class="layui-form-label">客户名称</label>
        <div class="layui-input-block">
            <input type="text" name="cust_name" required  lay-verify="required" placeholder="请输入客户名称" autocomplete="new-text" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">来源</label>
        <div class="layui-input-block">
            <select name="cust_source" id="cust_source" lay-verify="required">
                <option value=""></option>
            </select>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">行业</label>
        <div class="layui-input-block">
            <select name="cust_industry" id="cust_industry" lay-verify="required">
                <option value=""></option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">
            <select name="cust_type" id="cust_type" lay-verify="required">
                <option value=""></option>
            </select>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block">
            <input type="text" name="cust_phone" required  lay-verify="required" placeholder="phone"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="cust_email" required  lay-verify="required" placeholder="CRM@126.com"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-block">
            <input type="text" name="cust_operator" required  lay-verify="required" value="${user.usercode}"  class="layui-input layui-disabled">
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
    $(function () {

    });

    //Demo
    layui.use(['form','layer'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.$;
        var cust_create_time = CurentTime();

        $.ajax({
            url:'/dict/list',
            type:'GET',
            success:function (data) {
                var lists = data.map.data;
                console.log(lists);
                $.each(lists,function () {
                    if(this.dictTypeCode==005){
                        var options = $("<option></option>").append(this.dictItemName).attr("value",this.dictId);
                        options.appendTo("#cust_type");
                        //form.render("select");
                    }
                    if(this.dictTypeCode==002){
                        var options = $("<option></option>").append(this.dictItemName).attr("value",this.dictId);
                        options.appendTo("#cust_source");
                        //form.render("select");
                    }
                    if(this.dictTypeCode==001){
                        var options = $("<option></option>").append(this.dictItemName).attr("value",this.dictId);
                        options.appendTo("#cust_industry");
                    }
                    form.render("select");
                });
            }
        });

        //监听提交
        form.on('submit(formDemo)', function(data){
            //layer.msg(JSON.stringify(data.field));
            //return false;

            $.ajax({
                url:"/customer/save",
                type:"POST",
                dataType:"json",
                //async:false,
                data:{
                    cust_name:data.field.cust_name,
                    cust_source:data.field.cust_source,
                    cust_industry:data.field.cust_industry,
                    cust_type:data.field.cust_type,
                    cust_phone:data.field.cust_phone,
                    cust_email:data.field.cust_email,
                    cust_operator:data.field.cust_operator,
                    cust_create_time:cust_create_time
                },
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