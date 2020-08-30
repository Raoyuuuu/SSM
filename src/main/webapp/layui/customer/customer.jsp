<%@ page import="jdk.nashorn.internal.runtime.Undefined" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/general.css">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script >
        //鼠标悬停显示
        function show(t){
            var id = $(t).attr('data-d'); //获取显示内容
            $.ajax({
                url:'/linkman/list',
                type:'POST',
                data:{
                    ids:id
                },
                success:function (data) {
                    var item =data.map.data;
                    if(item!=null){
                        //小tips
                        layer.tips("职务："+item.position+"<br/>联系方式："+item.telephone+
                            "<br/>微信："+item.wechat, t, {
                            tips: [2, '#3595CC'],
                            time: 2000
                        })
                    }else{
                        layer.tips("职务："+"<br/>联系方式："+
                            "<br/>微信：", t, {
                            tips: [2, '#3595CC'],
                            time: 2000
                        })
                    }

                }
            });

        }
    </script>
    <style>
        .layui-badge{
            margin-top: 5px;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-col-md12">
        <div class="layui-card">
            <div class="layui-card-header" style="height: 60px">
                <div class="demoTable" style="padding-top: 10px">
                    搜索客户：
                    <div class="layui-inline">
                        <input class="layui-input" name="id" id="demoReload" autocomplete="off">
                    </div>
                    <button id="search" class="layui-btn" data-type="reload">搜索</button>
                </div>
            </div>
            <div class="layui-card-body" style="margin-bottom: 20px">
                <div>
                    <button id="addBtn" class="layui-btn"><i class="layui-icon">&#xe608;</i> 添加</button>
                    <button class="layui-btn layui-btn-danger" data-type="getCheckData" id="deletList"><i class="layui-icon">&#xe640;</i>批量删除</button>
                </div>

                <table class="layui-hide" id="demo" lay-filter="test" ></table>

                <!--工具条-->
                <script type="text/html" id="barDemo">
                    <!--<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail">查看</a>-->
                    <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
                    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
                </script>
                <script type="text/html" id="titleTipl">
                    <a href="javascript:;" data-d="{{d.cust_id}}" onmouseover="show(this)" style="color: #1E9FFF">
                        {{=d.name}}
                    </a>
                </script>

                <script type="text/html" id="state">
                    {{#  if(d.state === 41){ }}
                    <span class="layui-badge layui-bg-gray"> 结束跟单 </span>
                    {{#  } }}
                    {{#  if(d.state === 42){ }}
                    <span class="layui-badge layui-bg-blue"> 等待打款 </span>
                    {{#  } }}
                    {{#  if(d.state === 43){ }}
                    <span class="layui-badge layui-bg-green"> 确定细节 </span>
                    {{#  } }}
                    {{#  if(d.state === 44){ }}
                    <span class="layui-badge layui-bg-orange"> 有意向 </span>
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
            <label class="layui-form-label">客户ID</label>
            <div class="layui-input-block">
                <input type="text" name="cust_id" id="cust_id" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">客户名称</label>
            <div class="layui-input-block">
                <input type="text" name="cust_name" id="cust_name" required  lay-verify="required" placeholder="请输入客户名称" autocomplete="new-text" class="layui-input">
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

        <div class="layui-form-item" >
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
                <input type="text" id="cust_phone" name="cust_phone" required  lay-verify="required" placeholder="phone"  class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="text" id="cust_email" name="cust_email" required  lay-verify="required" placeholder="CRM@126.com"  class="layui-input">
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
                <button class="layui-btn" id="updateBtn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script src="/static/layui/layui.js"></script>
<script src="/static/js/global.js"></script>

<script>

    layui.use(['table','layer','form'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.$;

        //异步加载编辑中数据字典项数据
        $.ajax({
            url:'/dict/list',
            type:'GET',
            success:function (data) {
                var lists = data.map.data;
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

        //表格数据显示
        table.render({
            elem: '#demo',
            cellMinWidth: 150,
            url: '/customer/findAll', //数据接口
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
                ,{field: 'cust_id', title: 'ID', align:'center',unresize: true, sort: true, fixed: 'left'}
                ,{field: 'cust_name', title: '客户名称',align:'center',style:'font-weight: bold',event:'custShow'}
                ,{field: 'name', title: '联系人',align:'center',templet:'#titleTipl'}

                ,{field: 'cust_phone', title: '电话',align:'center'}
                ,{field: 'cust_email', title: '邮箱',align:'center'}
                ,{field: 'cust_create_time', title: '录入时间', align:'center',
                    templet :function (data){
                        return timeTransform(data.cust_create_time);
                    }
                }
                ,{field: 'nextTime', title: '跟进时间',align:'center',
                    templet :function (data){
                        return timeTransform(data.nextTime);
                    }
                }
                ,{field: 'state', title: '跟进状态',align:'center',templet:'#state'}
                ,{field: 'cust_operator', title: '创建人',align:'center'}
                ,{field: 'cust_source_name', type:'a',title: '来源',align:'center', sort: true}
                ,{field: 'cust_industry_name', title: '行业',align:'center', sort: true}
                ,{field: 'cust_type_name', title: '类型',align:'center',sort: true}
                ,{field:'right', title: '操作',align:'center',fixed: 'right',toolbar:"#barDemo"}
            ]]
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
                    cust_name: demoReload.val()
                }
            });
        });

        //新增
        $("#addBtn").click(function () {
            layer.open({
                title: '客户添加',
                type: 2,
                area: ['30%','65%'],

                content: getUrl()+'layui/customer/add.jsp' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
            });
        });

        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            id = obj.data.cust_id;
            //删除
            if(layEvent === 'del'){
                var id = obj.data.cust_id;
                layer.confirm('真的删除行么', function(index){

                    $.ajax({
                        url:"/customer/delete",
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
            else if(layEvent==='custShow'){
                layer.open({
                    title:data.cust_name,
                    type: 2,
                    area: ['45%','90%'],

                    content: getUrl()+'layui/customer/msg.jsp?cust_id='+data.cust_id //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            }
            else if(layEvent === 'edit'){ //编辑
                layer.open({
                    title: '客户修改',
                    type: 1,
                    area: ['30%','65%'],
                    content : $('#updateForm'),
                    success : function(layero, index) {
                        // layer.iframeAuto(index);
                        // console.log(data)
                        $('#cust_id').val(data.cust_id);
                        $('#cust_name').val(data.cust_name);   //回显的操作最重要的一步就是这个啦，其他的也是差不多的
                        $('#cust_phone').val(data.cust_phone);
                        $("#cust_source").val(data.cust_source);
                        $("#cust_industry").val(data.cust_industry);
                        $("#cust_type").val(data.cust_type);
                        $("#cust_email").val(data.cust_email);

                        form.render('select');
                    }
                });
            }
        });

        //编辑保存
        form.on('submit(formDemo)', function(data){
            //console.log(JSON.stringify(data.field));
            $.ajax({
                url:'/customer/update',
                type:"POST",
                dataType:"json",
                data:data.field,
                async:false,
                success:function (result) {
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
        if(v!=null){
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
        else{
            return ' ';
        }
    }


</script>
</body>
</html>