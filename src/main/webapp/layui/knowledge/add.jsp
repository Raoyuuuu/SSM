<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="margin-top: 40px;margin-right: 50px;">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <style>
        .layui-layedit{
            margin-left: 111px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<!--新增表单  隐藏-->
<form class="layui-form">

        <div class="layui-form-item">
            <label class="layui-form-label">分类</label>
            <div class="layui-input-block">
                <select name="artCate" id="artCate" lay-verify="required">
                    <option value=""></option>
                    <option value="1">销售话语</option>
                    <option value="2">客户活动安排</option>
                    <option value="3">活动推广时间安排</option>
                </select>

            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <input type="text" name="artTitle" id="artTitle" required  lay-verify="required"  class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">发布人</label>
            <div class="layui-input-block">
                <input type="text" id="artAuthor" name="artAuthor" required  lay-verify="required"  class="layui-input">
            </div>
        </div>
        <!--富文本编辑器-->
        <textarea id="artContent" style="display: none;"></textarea>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn"  lay-submit lay-filter="addArt"  style="margin-left: 40%">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/layui/layui.js"></script>
<script>

    layui.use(['form','layer','layedit'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var layedit = layui.layedit;
        var $ = layui.$;
        var time = CurentTime();

        //富文本编辑器
        layedit.set({
            uploadImage: {//图片上传
                url: '/uploadFile' //接口url
                ,type: 'POST' //默认post
            }
        });
        var index = layedit.build('artContent',{
            tool: [
                'strong' //加粗
                ,'italic' //斜体
                ,'underline' //下划线
                ,'del' //删除线

                ,'|' //分割线

                ,'left' //左对齐
                ,'center' //居中对齐
                ,'right' //右对齐
                ,'link' //超链接
                ,'unlink' //清除链接
                ,'face'
                ,'image' //插入图片
                ,'help' //帮助
            ]
        });

        form.on('submit(addArt)', function(data){
            var artContent = layedit.getContent(index);
            $.ajax({
                url:"/knowledge/save",
                type:"POST",
                dataType:"json",
                data:{
                    artCate:data.field.artCate,
                    artTitle:data.field.artTitle,
                    artContent:artContent,
                    artAuthor:data.field.artAuthor,
                    artCreateTime:time,
                    artUpdateTime:time
                },
                success:function (result) {
                    layer.msg(result.msg, {
                        icon: 1,
                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                    }, function(){
                        parent.window.location.reload();
                    });
                }
            });
            return false;
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
        if (month < 10)
            clock += "0";
        clock += month + "-";

        if (day < 10)
            clock += "0";
        clock += day + " ";

        if (hh < 10)
            clock += "0";

        clock += hh + ":";
        if (mm < 10) clock += '0';
        clock += mm + ":";

        if (ss < 10) clock += '0';
        clock += ss;
        return (clock);
    }


</script>
</body>
</html>