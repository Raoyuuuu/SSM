<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/general.css">

</head>
<body>
<div class="layui-fluid">
    <div class="layui-col-md12">
        <div class="layui-card">
            <div class="layui-card-header" style="height: 60px">
                <div class="demoTable" style="padding-top: 10px">
                    用户搜索：
                    <div class="layui-inline">
                        <input class="layui-input" name="id" id="demoReload" autocomplete="off">
                    </div>
                    <button id="search" class="layui-btn" data-type="reload">搜索</button>
                </div>
            </div>
            <div class="layui-card-body" style="margin-bottom: 20px">
                <div>
                    <button id="addBtn" class="layui-btn"><i class="layui-icon">&#xe608;</i> 新增用户</button>
                </div>

                <table class="layui-hide" id="demo" lay-filter="test" ></table>

                <!--工具条-->
                <script type="text/html" id="barDemo">
                    {{#  if(d.uid === 1){ }}
                    <button class="layui-btn layui-btn-disabled layui-btn-sm ">编辑</button>
                    <button class="layui-btn layui-btn-disabled layui-btn-sm" >删除</button>
                    {{# } else if(d.uid === 2){ }}
                    <a class="layui-btn layui-btn-normal layui-btn-sm " lay-event="edit">编辑</a>
                    <a class="layui-btn layui-btn-warm layui-btn-sm" lay-event="del">删除</a>

                    {{# } else{ }}
                    <a class="layui-btn layui-btn-normal layui-btn-sm " lay-event="edit">编辑</a>
                    <a class="layui-btn layui-btn-warm layui-btn-sm" lay-event="del">删除</a>
                    {{#  } }}

                </script>
            </div>
        </div>
    </div>
</div>
<!--编辑表单  隐藏-->
<div class="layui-row" id="updateForm" style="display:none;margin:40px 30px 0 0">
    <form class="layui-form" id="update_form">
        <div class="layui-form-item" style="display:none;width: 0;height: 0">
            <label class="layui-form-label">用户ID</label>
            <div class="layui-input-block">
                <input type="text" name="uid" id="uid" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-block">
                <input type="text" name="username" id="username" required autocomplete="new-text"  lay-verify="required" placeholder="3-15位"  class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="text" id="password" name="password"  autocomplete="new-password" class="layui-input" placeholder="3-15位">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" id="usercode" name="usercode"  class="layui-input">
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
            <label class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <input type="text" id="phone" name="phone" class="layui-input">
            </div>
        </div>




        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" id="updateBtn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/layui/layui.js"></script>
<script src="/static/js/global.js"></script>
<script>

    $(function () {
        $.ajax({
            url:'/user/list',
            type:'POST',
            success:function (result) {
                console.log(result.map.data.list);
            }
        })
    })

    layui.use(['table','layer','form'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.$;


        //表格数据显示
        table.render({
            elem: '#demo',
            cellMinWidth: 140,
            url: '/user/list', //数据接口
            parseData: function(result){ //res 即为原始返回的数据
                return {
                    "code": result.code,
                    "data": result.map.data.list, //解析数据列表
                    "count":result.map.data.total,
                };
            },
            page: true,//开启分页
            cols: [[ //表头
                {type: 'checkbox', fixed: true}
                ,{field: 'uid', title: 'ID', align:'center',unresize: true, sort: true, fixed: 'left'}
                ,{field: 'username', title: '账号',align:'center'}
                ,{field: 'usercode', title: '姓名',align:'center'}
                ,{field: 'gender', title: '性别',align:'center'}
                ,{field: 'phone', title: '电话',align:'center'}
                ,{field: 'memo', title: '角色',align:'center'}
                ,{field: 'createtime', title: '入司时间', align:'center',
                    templet :function (data){
                        return timeTransform(data.createtime);
                    }
                }

                ,{field:'right', title: '操作',align:'center',fixed: 'right',toolbar:"#barDemo"}
            ]],
            done:function (res,curr,count) {
                $("[data-field='gender']").children().each(function () {
                    if($(this).text()=='1'){
                        $(this).text("男")
                    }else if($(this).text()=='0'){
                        $(this).text("女")
                    }
                });
            }
        });

        //搜索
        $('#search').on('click', function(){
            var demoReload = $('#demoReload');
            //执行重载
            table.reload('demo', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    usercode: demoReload.val(),
                }
            });
        });

        //新增
        $("#addBtn").click(function () {
            layer.open({
                title: '客户添加',
                type: 2,
                area: ['30%','71%'],

                content: getUrl()+'layui/user/add.jsp' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
            });
        });

        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            id = obj.data.id;
            //删除
            if(layEvent === 'del'){
                var id = obj.data.uid;
                layer.confirm('真的删除行么', function(index){

                    $.ajax({
                        url:"/user/delete",
                        dataType:"json",
                        data:{
                            id:id
                        },
                        success:function (result) {
                            if(result.code===0){
                                layer.msg(result.msg, {
                                    icon: 1,
                                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                }, function(){
                                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                    layer.close(index);
                                });
                            }
                            else{
                                layer.msg('操作失败', {
                                    icon: 1,
                                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                }, function(){
                                    parent.window.location.reload();
                                });
                            }
                        }
                    });

                });
            }
            else if(layEvent === 'edit'){ //编辑
                layer.open({
                    title: '修改',
                    type: 1,
                    area: ['35%','70%'],
                    content : $('#updateForm'),
                    success : function() {
                        //console.log(data);
                        $('#uid').val(data.uid);
                        $('#username').val(data.username);   //回显
                        $("#usercode").val(data.usercode);
                        $("#password").val(data.password);
                        $('#phone').val(data.phone);

                        if(data.gender=='1'){
                            $("#sexOne").attr("checked","checked")
                        }else if(data.gender=='0'){
                            $("#sexZero").attr("checked","checked")
                        }

                        form.render();
                    }
                });
            }
        });

        //编辑保存
        form.on('submit(formDemo)', function(data){
            //console.log(JSON.stringify(data.field));
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




</script>
</body>
</html>