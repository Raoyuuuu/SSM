<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>知识库</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">

    <script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${APP_PATH}/js/global.js" ></script>
    <style>
        .modal-backdrop {
            filter: alpha(opacity=0)!important;
            opacity: 0!important;
        }

    </style>
</head>
<body>
<!--新增模态框-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addModalLabel">客户新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="custName" id="custName_add"  placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户来源</label>
                        <div class="col-sm-3">
                            <!--部门提交部门id即可-->
                            <select class="form-control" name="custSource" id="custSource_add"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户行业</label>
                        <div class="col-sm-3">
                            <!--部门提交部门id即可-->
                            <select class="form-control" name="custIndustry" id="custIndustry_add"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户级别</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="custLevel" id="custLevel_add"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">移动电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="custMobile" id="mobile_add"  placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="custEmail" id="email_add"  placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!--搭建显示页面-->
<div class="container">
    <!--标题-->
    <div class="row" id="">
        <div class="col-md-12">
            <h1>知识库</h1>
        </div>
    </div>

    <!--按钮-->
    <div class="row" style="margin-bottom: 20px;margin-top: 40px">
        <div class="col-md-4">
            <button class="btn btn-info" id="cust_add_modal_btn">新建内容</button>
        </div>
    </div>
    <!--显示表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover " id="kno_table">
                <thead>
                <tr class="info">
                    <th>分类</th>
                    <th>文章标题</th>
                    <th>创建人</th>
                    <th>状态</th>
                    <th>发布时间</th>
                    <th>更新时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
    <!--显示分页数据-->
    <div class="row">
        <!--分页文字-->
        <div class="col-md-6" id="page_info">

        </div>
        <!--分页条-->
        <div class="col-md-6" id="page_nav">

        </div>
    </div>

</div>

<script type="text/javascript">

    var totalRecord,currentPage;

    $(function(){
        //去首页
        to_page(1);
    });

    //抽取通用的获取分页数据的方法
    function to_page(pn){
        $.ajax({

            url:getUrl()+'/knobase/getAllKno',
            data:"pn="+pn,
            type:"POST",
            beforeSend: function (XMLHttpRequest) {
                XMLHttpRequest.setRequestHeader("kt-token", "r7udp5ujqrwho10buv6gbfshxua3b4b307y7eo2c0jipzno8c33u6ctfbsdv6lsxs1euqio");
            },
            success:function (result) {
                console.log(result)
                //解析并显示员工信息
                kno_table(result);
                //解析并显示左边分页信息
                // page_info(result);
                // //解析并显示右边分页条信息
                // page_nav(result);
            }
        });
    }

    //表单数据显示
    function kno_table(result) {
        //初始化
        $("#kno_table tbody").empty();

        var kno = result.map.pageInfo.list;
        console.log(kno);
        // $.each(customers,function (index,item) {
        //     var checkBoxTd = $("<td><input type='checkbox' class='check_item'></td>");
        //     var custIdTd = $("<td></td>").append(item.custId);
        //     var custNameTd = $("<td></td>").append(item.custName);
        //     var custSourceTd = $("<td></td>").append(item.baseDictSource.dictItemName);
        //     var custIndustryTd = $("<td></td>").append(item.baseDictIndustry.dictItemName);
        //     var custLevelTd = $("<td></td>").append(item.baseDictLevel.dictItemName);
        //     var custMobileTd = $("<td></td>").append(item.custMobile);
        //     var custEmailTd = $("<td></td>").append(item.custEmail);
        //
        //     var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
        //         .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
        //         .append("编辑");
        //     editBtn.attr("edit-id",item.custId);
        //
        //     var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm del_btn")
        //         .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
        //         .append("删除");
        //     delBtn.attr("del-id",item.custId);
        //
        //     var btnTd =$("<td></td>").append(editBtn).append(" ").append(delBtn);
        //     $("<tr></tr>").append(checkBoxTd)
        //         .append(custIdTd)
        //         .append(custNameTd)
        //         .append(custSourceTd)
        //         .append(custIndustryTd)
        //         .append(custLevelTd)
        //         .append(custMobileTd)
        //         .append(custEmailTd)
        //         .append(btnTd)
        //         .appendTo("#customer_table tbody");
        // });
    }
</script>
</body>
</html>
