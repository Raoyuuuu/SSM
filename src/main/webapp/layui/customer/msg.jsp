<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="margin:40px;">
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<style>
    .form-group{
        margin-bottom: 0px;
    }
</style>
<body>
<!--客户信息-->
<div class="panel panel-success">
    <div class="panel-heading">
        <h3 class="panel-title">基本资料</h3>
    </div>
    <div class="panel-body">
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label">电话：</label>
                <div class="col-sm-10">
                    <p class="form-control-static" id="telephone"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">邮箱：</label>
                <div class="col-sm-10">
                    <p class="form-control-static" id="email"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">网址：</label>
                <div class="col-sm-10">
                    <p class="form-control-static" id="local">--</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">公司名称：</label>
                <div class="col-sm-10">
                    <p class="form-control-static" id="name"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">公司地址：</label>
                <div class="col-sm-10">
                    <p class="form-control-static" id="address">--</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">公司类型：</label>
                <div class="col-sm-10">
                    <p class="form-control-static" id="type"></p>
                </div>
            </div>

        </form>
    </div>
</div>

<!--客户对应联系人信息-->
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">联系人</h3>
    </div>
    <div class="panel-body">
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label">姓名：</label>
                <div class="col-sm-10">
                    <p class="form-control-static" id="linkName"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">性别：</label>
                <div class="col-sm-10">
                    <p class="form-control-static" id="gender"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">职务：</label>
                <div class="col-sm-10">
                    <p class="form-control-static" id="position"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">电话：</label>
                <div class="col-sm-10">
                    <p class="form-control-static" id="phone"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">微信：</label>
                <div class="col-sm-10">
                    <p class="form-control-static" id="wechat"></p>
                </div>
            </div>

        </form>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        var cust_id=GetQueryString("cust_id");

        GetCustomerList(cust_id);
        GetLinkman(cust_id);
    });


    //获取通过url地址栏传过来的id
    function GetQueryString(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return unescape(r[2]); return null;
    }

    //获取客户基本信息
    function GetCustomerList(id){
        $.ajax({
            url:'/customer/list',
            type:'POST',
            data:{
                cust_id:id
            },
            success:function (result) {
                var data = result.map.data;
                $.each(data,function () {
                    $("#telephone").append(this.cust_phone);
                    $("#email").append(this.cust_email);
                    $("#type").append(this.cust_industry);
                    $("#name").append(this.cust_name);
                });


            }
        });
    }

    //获取对应联系人信息
    function GetLinkman(id){
        $.ajax({
            url:'/linkman/list',
            type:'POST',
            data:{
                ids:id
            },
            success:function (data) {
                var date = data.map.data
                console.log(data.map.data);
                if(date!=null){
                    $("#linkName").append(date.name);
                    $("#position").append(date.position);
                    $("#phone").append(date.telephone);
                    $("#wechat").append(date.wechat);
                    if(date.sex=='0'){
                        $("#gender").append("女");
                    }else if(date.sex=='1'){
                        $("#gender").append("男");
                    }
                }
            }
        });

    }
</script>
</body>
</html>
