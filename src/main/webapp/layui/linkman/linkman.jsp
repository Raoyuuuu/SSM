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
                    联系人搜索：
                    <div class="layui-inline">
                        <input class="layui-input" name="id" id="demoReload" autocomplete="off">
                    </div>
                    <button id="search" class="layui-btn" data-type="reload">搜索</button>
                </div>
            </div>
            <div class="layui-card-body" style="margin-bottom: 20px">
                <div>
                    <button id="addBtn" class="layui-btn"><i class="layui-icon">&#xe608;</i> 添加</button>
                </div>

                <table class="layui-hide" id="demo" lay-filter="test" ></table>

                <!--工具条-->
                <script type="text/html" id="barDemo">
                    <a class="layui-btn layui-btn-normal layui-btn-sm " lay-event="edit">编辑</a>
                    <a class="layui-btn layui-btn-warm layui-btn-sm" lay-event="del">删除</a>
                </script>
            </div>
        </div>
    </div>
</div>
<!--编辑表单  隐藏-->
<div class="layui-row" id="updateForm" style="display:none;margin:40px 30px 0 0">
    <form class="layui-form" id="update_form">
        <div class="layui-form-item" style="display:none;width: 0;height: 0">
            <label class="layui-form-label">联系人ID</label>
            <div class="layui-input-block">
                <input type="text" name="id" id="id" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" id="name" required  lay-verify="required" placeholder=""  class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" id="sexOne" value="1" title="男">
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
                <select name="custNo" id="custNo" >
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

    layui.use(['table','layer','form'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.$;

        //异步加载编辑中对应客户
        $.ajax({
            url:'/customer/list',
            type:'GET',
            success:function (data) {
                var lists = data.map.data;
                console.log(lists);
                $.each(lists,function () {

                var options = $("<option></option>").append(this.cust_name).attr("value",this.cust_id);
                options.appendTo("#custNo");

                form.render("select");

                });
            }
        });

        //表格数据显示
        table.render({
            elem: '#demo',
            cellMinWidth: 140,
            url: '/linkman/findAll', //数据接口
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
                ,{field: 'id', title: 'ID', align:'center',unresize: true, sort: true, fixed: 'left'}
                ,{field: 'name', title: '姓名',align:'center'}
                ,{field: 'sex', title: '性别',align:'center'}
                ,{field: 'position', title: '职务',align:'center'}
                ,{field: 'cust_name', title: '对应客户',align:'center'}
                ,{field: 'telephone', title: '电话',align:'center'}
                ,{field: 'wechat', title: '微信',align:'center'}
                ,{field: 'create_time', title: '录入时间', align:'center',
                    templet :function (data){
                        return cust_create_time(data.create_time);
                    }
                 }
                ,{field: 'operator', title: '创建人',align:'center'}
                ,{field: 'remark', title: '备注',align:'center'}

                ,{field:'right', title: '操作',align:'center',fixed: 'right',toolbar:"#barDemo"}
            ]],
            done:function (res,curr,count) {
                $("[data-field='sex']").children().each(function () {
                    if($(this).text()=='1'){
                        $(this).text("男")
                    }else if($(this).text()=='0'){
                        $(this).text("女")
                    }
                })
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
                    name: demoReload.val(),
                }
            });
        });

        //新增
        $("#addBtn").click(function () {
            layer.open({
                title: '客户添加',
                type: 2,
                area: ['35%','70%'],

                content: getUrl()+'layui/linkman/add.jsp' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
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
                var id = obj.data.cust_id;
                layer.confirm('真的删除行么', function(index){

                    $.ajax({
                        url:"/linkman/delete",
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
                        console.log(data);
                        $('#id').val(data.id);
                        $('#name').val(data.name);   //回显的操作最重要的一步就是这个啦，其他的也是差不多的
                        $("#custNo").val(data.cust_no);
                        $("#position").val(data.position);
                        $('#telephone').val(data.telephone);
                        $("#wechat").val(data.wechat);
                        $("#operator").val(data.operator);
                        $("#remark").val(data.remark);

                        if(data.sex=='1'){
                            $("#sexOne").attr("checked","checked")
                        }else if(data.sex=='0'){
                            $("#sexZero").attr("checked","checked")
                        }

                        form.render();
                    }
                });
            }
        });

        //编辑保存
        form.on('submit(formDemo)', function(data){
            console.log(JSON.stringify(data.field));
            $.ajax({
                url:'/linkman/update',
                type:"POST",
                dataType:"json",
                data:data.field,
                async:false,
                success:function (result) {
                    console.log(result);
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

        //批量删除
        $("#deletList").click(function () {
            layer.msg('此功能暂未开通');
        });
    });




    //时间戳转换
    function cust_create_time(v){
        var date = new Date(v);
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        m = m<10?'0'+m:m;
        var d = date.getDate();
        d = d<10?("0"+d):d;
        var h = date.getHours();
        h = h<10?("0"+h):h;
        var M = date.getMinutes();
        M = M<10?("0"+M):M;
        var str = y+"-"+m+"-"+d+" "+h+":"+M;
        return str;
    }


</script>
</body>
</html>