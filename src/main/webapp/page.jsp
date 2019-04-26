<%@ page language="java"  contentType="text/html;charset=UTF-8"  %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>CRM后台管理系统</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/assets/css/ie10-viewport-bug-workaround.css">
    <link rel="stylesheet" href="${APP_PATH}/static/css/dashboard.css">
<style>
    body{
    overflow-y: hidden;
    }
</style>

</head>
<body>
<!--顶部导航栏--->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">CRM客户关系管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="#">Profile</a></li>
                <li><a href="#">Help</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>
<!--主体部分-->
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar" >
                <li><a href="#" ><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;快捷新增</a></li>
            </ul>
            <ul class="nav nav-sidebar" style="margin-top: -10px;">
                <li class="active"><a href="${APP_PATH}/wellcome.jsp" target="mainFrame">工作台 <span class="sr-only">(current)</span></a></li>
                <li><a href="${APP_PATH}/index.jsp" target="mainFrame">用户管理</a></li>
                <li><a href="${APP_PATH}/views/customer.jsp" target="mainFrame">客户管理</a></li>
                <li><a href="#">联系人管理</a></li>
                <li><a href="#">合同</a></li>
                <li><a href="#">产品</a></li>
                <li><a href="#">回款</a></li>
                <li><a href="#">工作报告</a></li>
                <li><a href="#">跟进记录</a></li>
                <li><a href="#">费用报销</a></li>
                <li><a href="${APP_PATH}/views/knowledge.jsp" target="mainFrame">知识库</a></li>
                <li><a href="#sub1" data-toggle="collapse">更多<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
                    <ul id="sub1" class="nav collapse">
                        <li><a href="#">权限</a></li>
                        <li><a href="#">日志</a></li>
                        <li><a href="#">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!--内容显示-->
        <div class="col-md-10 col-md-offset-2 main" style="padding: 0 0 0 15px;height: 100%">
            <iframe src="wellcome.jsp" id="mainFrame" name="mainFrame" frameborder="0" width="100%" height="100%"  frameBorder="0"></iframe>

        </div>
    </div>
</div>




<script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>
