<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>知识库</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/general.css">
</head>
<style>
    .layui-layedit{
        margin-left: 111px;
        margin-bottom: 20px;
    }
</style>
<body>
<!--主页面-->
<div class="layui-fluid">
    <div class="layui-col-md12">
        <div class="layui-card">
            <div class="layui-card-header" style="height: 60px">
                <div class="demoTable" style="padding-top: 10px">
                    搜索：
                    <div class="layui-inline">
                        <input class="layui-input" name="id" id="demoReload" autocomplete="off" placeholder="标题...">
                    </div>
                    <button id="search" class="layui-btn" data-type="reload">查询</button>
                </div>
            </div>
            <div class="layui-card-body" >
                <div>
                    <button id="addArt" class="layui-btn"><i class="layui-icon">&#xe608;</i> 添加</button>
                    <button class="layui-btn layui-btn-danger" data-type="getCheckData" id="deletList"><i class="layui-icon">&#xe640;</i>批量删除</button>
                </div>

                <table class="layui-hide" id="demo" lay-filter="test" ></table>

                <!--工具条-->
                <script type="text/html" id="barDemo">
                    <a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="detail">查看</a>
                    <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
                    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
                </script>
            </div>
        </div>
    </div>
</div>

<!--编辑表单  隐藏-->
<div class="layui-row" id="updateForm" style="display:none;margin:40px 30px 0 0">
    <form class="layui-form" id="knoForm">

        <div class="layui-form-item" style="display:none;width: 0;height: 0">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-block">
                <input type="text" name="artId" id="artId" class="layui-input">
            </div>
        </div>


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
        <textarea id="artContent" name="artContent" style="display: none;"></textarea>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" style="margin-left:40%" id="update"  lay-submit lay-filter="formDemo">更新</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<div class="layui-row" id="html" style="display:none;margin: 20px"></div>

<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/layui/layui.js"></script>
<script src="/static/js/global.js"></script>
<script>

    $(function () {
        // $.ajax({
        //     url:"/customer/findAll",
        //     type:"POST",
        //     dataType:"json",
        //     //async:false,
        //     success:function (result) {
        //         console.log(result);
        //     }
        // });
    });

    layui.use(['table','layer','form','layedit'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.$;
        var layedit = layui.layedit;
        var index;
        layedit.set({
            uploadImage: {//图片上传
                url: '/uploadFile' //接口url
                ,type: 'POST' //默认post
            }
        });

        //表格数据显示
        table.render({
            elem: '#demo',
            //cellMinWidth: 20,
            url: '/knowledge/list', //数据接口
            parseData: function(result){ //res 即为原始返回的数据
                return {
                    "code": result.code,
                    "data": result.map.data.list, //解析数据列表
                    "count":result.map.data.total
                };
            },
            page: true,//开启分页
            cols: [[ //表头
                {type: 'checkbox', fixed: true}
                ,{field: 'artId', title: 'ID', align:'center',unresize: true, sort: true, fixed: true}
                ,{field: 'itemName', title: '分类',align:'center'}
                ,{field: 'artTitle', title: '标题',align:'center'}
                ,{field: 'artAuthor', title: '发布人',align:'center'}
                ,{field: 'artCreateTime', title: '发布时间',align:'center',
                    templet :function (data){
                        return cust_create_time(data.artCreateTime);
                    }
                }
                ,{field: 'artUpdateTime', title: '更新时间', align:'center',
                    templet :function (data){
                        return cust_create_time(data.artUpdateTime);
                    }
                }
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
                    artTitle:demoReload.val(),
                }
            });
        });

        //新增
        $("#addArt").click(function () {
            layer.open({
                title: '新增',
                type: 2,
                area: ['60%','70%'],
                content: getUrl()+'layui/knowledge/add.jsp' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
            });
        });

        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            // var tr = obj.tr; //获得当前行 tr 的DOM对象

            //查看
            if(obj.event === 'detail'){
                //console.log(data.artContent);
                //layer.msg('ID：'+ data.artId + ' 的查看操作');
                layer.open({
                    title: data.artTitle,
                    type: 1,
                    area: ['50%','60%'],
                    content : $('#html'),
                    success:function () {
                        $('#html').empty();
                        $('#html').append(data.artContent);
                    }
                });
            }
            //删除
            else if(layEvent === 'del'){
                var id = obj.data.artId;
                layer.confirm('删除行'+id, function(index){

                    $.ajax({
                        url:"/knowledge/delete",
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
                                    window.location.reload();
                                });
                            }
                        }
                    });

                });
            }
            //编辑
            else if(layEvent === 'edit'){
                var body = data.artContent;
                layer.open({
                    title: '更新',
                    type: 1,
                    area: ['60%','70%'],
                    content : $('#updateForm'),
                    success : function(layero, index) {
                        //console.log(data)
                        $("#artId").val(data.artId);
                        $("#artCate").val(data.artCate);
                        $("#artTitle").val(data.artTitle);
                        $("#artAuthor").val(data.artAuthor);
                        form.render('select');
                    }
                });
                //富文本编辑器
                index = layedit.build('artContent',{
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
                layedit.setContent(index,body);
            }
        });

        //编辑保存
        form.on('submit(formDemo)',function(data){
            //console.log(JSON.stringify(data.field));
            var artContent = layedit.getContent(index);
            var time = CurentTime();
            $.ajax({
                url:"/knowledge/update",
                type:"POST",
                dataType:"json",
                data:{
                    'artId':data.field.artId,
                    'artCate':data.field.artCate,
                    'artTitle':data.field.artTitle,
                    'artContent':artContent,
                    'artAuthor':data.field.artAuthor,
                    'artUpdateTime':time
                },
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