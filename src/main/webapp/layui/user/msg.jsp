
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/static/layui/css/admin.css" media="all">
    <style>
        .layui-input, .layui-textarea{
            width: 144%;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12" >
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card" style="height: 90%">
                        <div class="layui-card-header">基本资料</div>
                        <div class="layui-card-body">
                            <form class="layui-form" action="" style="margin-top: 20px">

                                <div class="layui-form-item" style="display: none;width: 0;height: 0;">
                                    <label class="layui-form-label">用户ID</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="uid" value="${user.uid}" readonly   class="layui-input">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">用户名</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="usercode" value="${user.usercode}" readonly   class="layui-input">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">登录账号</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="username"  value="${user.username}"  class="layui-input">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">密码</label>
                                    <div class="layui-input-inline">
                                        <input type="password" name="password"  value="${users.password}"  class="layui-input">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">单选框</label>
                                    <div class="layui-input-block">
                                        <input type="radio" name="gender" id="gender1" value="1" title="男">
                                        <input type="radio" name="gender" id="gender0" value="0" title="女">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">电话</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="phone" value="${users.phone}"  class="layui-input">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">生日</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="birthday" id="birthday"   class="layui-input">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">住址</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="address" value="${users.address}"  class="layui-input">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">紧急联络人</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="emergencyh" value="${users.emergencyh}"  class="layui-input">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">联络人电话</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="emergencyp" value="${users.emergencyp}"  class="layui-input">
                                    </div>
                                </div>



                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit lay-filter="formDemo">确认修改</button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/layui/layui.js"></script>
<script>

    $(function () {
        var time="${users.birthday}";
        console.log(time);
        if(time!=null&&time!=''){
            var birthday =timeTransform(time);
            $("#birthday").val(birthday);
        }

    })

    //Demo
     layui.use(['form','laydate'], function(){
        var form = layui.form;
        var laydate = layui.laydate;

         //时间日期组件
         laydate.render({
             elem: '#birthday', //指定元素
             showBottom: false
         });

         var gender="${users.gender}";
         if(gender=='0'){
             $("#gender0").attr("checked","checked");
         }else if(gender=='1'){
             $("#gender1").attr("checked","checked");
         }

         form.render();

        //监听提交
        form.on('submit(formDemo)', function(data){
            //layer.msg(JSON.stringify(data.field));
            //console.log(data.field);
            $.ajax({
                url:'/user/update',
                type:"POST",
                dataType:"json",
                data:data.field,
                async:false,
                success:function (result) {
                    //console.log(result);
                    if(result.code===0){
                        layer.msg(result.msg, {
                            icon: 1,
                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                        }, function(){
                            window.location.reload();
                        });
                    }
                    else{
                        alert("操作失败");
                    }
                }
            });
            return false;
        });
    });


    //时间戳转换
    function timeTransform(v){
        var date = new Date(v);
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        m = m<10?'0'+m:m;
        var d = date.getDate();
        d = d<10?("0"+d):d;
        var str = y+"-"+m+"-"+d;
        return str;
    }
</script>
</body>
</html>
