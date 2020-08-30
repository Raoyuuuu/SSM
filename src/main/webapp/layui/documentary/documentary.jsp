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
                    跟单搜索：
                    <div class="layui-inline">
                        <input class="layui-input" name="id" id="demoReload" placeholder="跟单对象" autocomplete="off">
                    </div>
                    <button id="search" class="layui-btn" data-type="reload">搜索</button>
                </div>
            </div>
            <div class="layui-card-body" style="margin-bottom: 20px">
                <div>
                    <button id="addBtn" class="layui-btn"><i class="layui-icon">&#xe608;</i>新增跟单</button>
                </div>

                <table class="layui-hide" id="demo" lay-filter="test" ></table>

                <!--工具条-->
                <script type="text/html" id="barDemo">
                    <a class="layui-btn layui-btn-normal layui-btn-sm " lay-event="edit">修改</a>
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
                <input type="text" name="dctId" id="dctId" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">客户名称：</label>
            <div class="layui-input-block">
                <select name="dctNo" id="dctNo" lay-verify="required" lay-search="">
                    <option value=""></option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">跟单方式：</label>
            <div class="layui-input-block">
                <select name="dctWay" id="dctWay" lay-verify="required">
                    <option value=""></option>
                </select>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">跟单状态：</label>
            <div class="layui-input-block">
                <select name="dctState" id="dctState" lay-verify="required">
                    <option value=""></option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">跟单时间：</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" id="dctNextTime" name="dctNextTime" autocomplete="off" placeholder="yyyy-MM-dd HH:mm:ss">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">跟单对象：</label>
            <div class="layui-input-block">
                <input type="text" id="dctObject" name="dctObject" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">备注：</label>
            <div class="layui-input-block">
                <input type="text" id="dctRemark" name="dctRemark" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">跟单人：</label>
            <div class="layui-input-block">
                <input type="text" name="dctPersonnel"  value="${user.usercode}"  class="layui-input layui-disabled">
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

    layui.use(['table','layer','form','laydate'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
        var $ = layui.$;

        //时间日期组件
        laydate.render({
            elem: '#dctNextTime', //指定元素
            type: 'datetime'
        });

        //异步加载编辑中对应客户
        $.ajax({
            url:'/customer/list',
            type:'POST',
            success:function (result) {
                var lists = result.map.data;
                $.each(lists,function () {
                    var options = $("<option></option>").append(this.cust_name).attr("value",this.cust_id);
                    options.appendTo("#dctNo");

                    form.render("select");

                });
            }
        });

        //异步加载编辑中数据字典项数据
        $.ajax({
            url:'/dict/list',
            type:'GET',
            success:function (data) {
                var lists = data.map.data;
                $.each(lists,function () {
                    if(this.dictTypeCode=="010"){
                        var options = $("<option></option>").append(this.dictItemName).attr("value",this.dictId);
                        options.appendTo("#dctWay");
                    }
                    if(this.dictTypeCode=="011"){
                        var options = $("<option></option>").append(this.dictItemName).attr("value",this.dictId);
                        options.appendTo("#dctState");
                    }

                    form.render("select");
                });
            }
        });

        //表格数据显示
        table.render({
            elem: '#demo',
            cellMinWidth: 140,
            url: '/documentary/findAll', //数据接口
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
                ,{field: 'dctId', title: 'ID', align:'center',unresize: true, sort: true, fixed: 'left'}
                ,{field: 'customer', title: '客户名称',align:'center'}
                ,{field: 'Way', title: '跟单方式',align:'center'}
                ,{field: 'State', title: '跟单状态',align:'center'}
                ,{field: 'dctObject', title: '跟单对象',align:'center'}
                ,{field: 'dctNextTime', title: '下次联系', align:'center',
                    templet :function (data){
                        return timeTransform(data.dctNextTime);
                    }
                }
                ,{field: 'dctRemark', title: '备注',align:'center'}
                ,{field: 'dctPersonnel', title: '跟单人',align:'center'}
                ,{field: 'dctCreateTime', title: '跟单时间',align:'center',
                    templet :function (data){
                        return timeTransform(data.dctCreateTime);
                    }
                }

                ,{field:'right', title: '操作',align:'center',fixed: 'right',toolbar:"#barDemo"}
            ]],
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
                    dctObject: demoReload.val(),
                    //dctPersonnel: demoReload.val(),
                }
            });
        });

        //新增
        $("#addBtn").click(function () {
            layer.open({
                title: '客户添加',
                type: 2,
                area: ['35%','76%'],

                content: getUrl()+'layui/documentary/add.jsp' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
            });
        });

        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            //删除
            if(layEvent === 'del'){
                var id = obj.data.dctId;
                layer.confirm('真的删除行么', function(index){

                    $.ajax({
                        url:"/documentary/delete",
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
                    area: ['35%','76%'],
                    content : $('#updateForm'),
                    success : function() {
                        $('#dctId').val(data.dctId);

                        $("#dctNo").val(data.dctNo);
                        $("#dctWay").val(data.dctWay);
                        $('#dctState').val(data.dctState);

                        $("#dctNextTime").val(data.dctNextTime);
                        $("#dctObject").val(data.dctObject);
                        $("#dctRemark").val(data.dctRemark);
                        $("#dctPersonnel").val(data.dctPersonnel);

                        form.render();
                    }
                });
            }
        });

        //编辑保存
        form.on('submit(formDemo)', function(data){
            //console.log(JSON.stringify(data.field));
            console.log(data.field);
            $.ajax({
                url:'/documentary/update',
                type:"POST",
                dataType:"json",
                data:data.field,
                //async:false,
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

        //批量删除
        $("#deletList").click(function () {
            layer.msg('此功能暂未开通');
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