<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>数据字典</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/general.css">
</head>
<body>
<div class="layui-fluid">
    <div class="layui-col-md12">
        <div class="layui-card">
            <div class="layui-card-header" style="height: 60px">
                <div class="demoTable" style="padding-top: 10px">
                    搜索：
                    <div class="layui-inline">
                        <input class="layui-input" name="id" id="demoReload" autocomplete="off" placeholder="类型名称...">
                    </div>
                    <button id="search" class="layui-btn" data-type="reload">查询</button>
                </div>
            </div>
            <div class="layui-card-body" style="margin-bottom: 20px">
                <div>
                    <button id="addBtn" class="layui-btn"><i class="layui-icon">&#xe608;</i> 添加</button>
                    <%--<button class="layui-btn layui-btn-danger" data-type="getCheckData" id="deletList"><i class="layui-icon">&#xe640;</i>批量删除</button>--%>
                </div>

                <table class="layui-hide" id="demo" lay-filter="test" ></table>

                <!--工具条-->
                <script type="text/html" id="barDemo">
                    <!--<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail">查看</a>-->
                    <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
                    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
                </script>
            </div>
        </div>
    </div>
</div>
<!--编辑表单  隐藏-->
<div class="layui-row" id="updateForm" style="display:none;margin:40px 30px 0 0">
    <form class="layui-form">

        <div class="layui-form-item" style="display:none;width: 0;height: 0">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-block">
                <input type="text" name="dictId" id="dictId" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">类型编码</label>
            <div class="layui-input-block">
                <input type="text" name="dictTypeCode" id="dictTypeCode" required  lay-verify="required"  class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">类型名称</label>
            <div class="layui-input-block">
                <input type="text" name="dictTypeName" id="dictTypeName" required  lay-verify="required"  class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">项目名称</label>
            <div class="layui-input-block">
                <input type="text" name="dictItemName" id="dictItemName" required  lay-verify="required"  class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">排序字段</label>
            <div class="layui-input-block">
                <input type="text" name="dictSort" id="dictSort" required  lay-verify="required"  class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" name="dictMemo" id="dictMemo" required  lay-verify="required"  class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
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
        // $.ajax({
        //     url:"/dict/findAll",
        //     type:"POST",
        //     dataType:"json",
        //     //async:false,
        //     success:function (result) {
        //         console.log(result);
        //     }
        // });
    });

    layui.use(['table','layer','form'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.$;



        //表格数据显示
        table.render({
            elem: '#demo',
            //cellMinWidth: 20,
            url: '/dict/findAll', //数据接口
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
                ,{field: 'dictId', title: 'ID', align:'center',unresize: true, sort: true, fixed: true}
                ,{field: 'dictTypeCode', title: '类型编码',align:'center', sort: true}
                ,{field: 'dictTypeName', title: '类型名称',align:'center', sort: true}
                ,{field: 'dictItemName', title: '项目名称',align:'center', sort: true}
                ,{field: 'dictSort', title: '排序字段',align:'center', sort: true}
                ,{field: 'dictMemo', title: '备注',align:'center'}
                ,{field:'right', title: '操作',align:'center',toolbar:"#barDemo"}
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
                    dictTypeName: demoReload.val()
                }
            });
        });


        //新增
        $("#addBtn").click(function () {
            layer.open({
                title: '新增',
                type: 2,
                area: ['30%','60%'],

                content: getUrl()+'layui/dictionary/add.jsp' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
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
                var id = obj.data.dictId;
                layer.confirm('真的删除行么',{
                    btn: ['确认', '取消'],
                    offset: '300px'
                }, function(index){

                    $.ajax({
                        url:"/dict/delete",
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
                    title: '更新',
                    type: 1,
                    area: ['30%','60%'],
                    content : $('#updateForm'),
                    success : function(layero, index) {
                        // layer.iframeAuto(index);
                        // console.log(data)
                        $('#dictId').val(data.dictId);
                        $('#dictTypeCode').val(data.dictTypeCode);   //回显的操作最重要的一步就是这个啦，其他的也是差不多的
                        $('#dictTypeName').val(data.dictTypeName);
                        $("#dictItemName").val(data.dictItemName);
                        $("#dictSort").val(data.dictSort);
                        $("#dictMemo").val(data.dictMemo);
                    }
                });
            }
        });

        //编辑保存
        form.on('submit(formDemo)', function(data){
            //console.log(JSON.stringify(data.field));
            $.ajax({
                url:'/dict/update',
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