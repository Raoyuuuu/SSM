<%@ page contentType="text/html;charset=UTF-8"  language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>客户管理</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">

    <script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <%--<script src="${APP_PATH}/js/customer.js" ></script>--%>
    <style>
        .modal-backdrop {
            filter: alpha(opacity=0)!important;
            opacity: 0!important;
        }
    </style>

</head>
<body>
<!-- 修改模态框 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="updateModalLabel">客户修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="custName" id="custName_update"  placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户来源</label>
                        <div class="col-sm-3">
                            <!--部门提交部门id即可-->
                            <select class="form-control" name="custSource" id="custSource_update"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户行业</label>
                        <div class="col-sm-3">
                            <!--部门提交部门id即可-->
                            <select class="form-control" name="custIndustry" id="custIndustry_update"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户级别</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="custLevel" id="custLevel_update"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">移动电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="custMobile" id="mobile_update"  placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="custEmail" id="email_update"  placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

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
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-客户管理</h1>
        </div>
    </div>

    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-primary" id="cust_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="cust_del_all_btn">删除</button>
        </div>
    </div>
    <!--显示表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover " id="customer_table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="checkAll"></th>
                    <th>#</th>
                    <th>客户姓名</th>
                    <th>客户来源</th>
                    <th>所属行业</th>
                    <th>客户级别</th>
                    <th>移动电话</th>
                    <th>邮箱</th>
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
            url:'/customers',
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                console.log(result)
                //解析并显示员工信息
                customer_table(result);
                //解析并显示左边分页信息
                page_info(result);
                //解析并显示右边分页条信息
                page_nav(result);
            }
        });
    }

    //表单数据显示
    function customer_table(result) {
        //初始化
        $("#customer_table tbody").empty();

        var customers = result.map.pageInfo.list;
        $.each(customers,function (index,item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'></td>");
            var custIdTd = $("<td></td>").append(item.custId);
            var custNameTd = $("<td></td>").append(item.custName);
            var custSourceTd = $("<td></td>").append(item.baseDictSource.dictItemName);
            var custIndustryTd = $("<td></td>").append(item.baseDictIndustry.dictItemName);
            var custLevelTd = $("<td></td>").append(item.baseDictLevel.dictItemName);
            var custMobileTd = $("<td></td>").append(item.custMobile);
            var custEmailTd = $("<td></td>").append(item.custEmail);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            editBtn.attr("edit-id",item.custId);

            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            delBtn.attr("del-id",item.custId);

            var btnTd =$("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(custIdTd)
                .append(custNameTd)
                .append(custSourceTd)
                .append(custIndustryTd)
                .append(custLevelTd)
                .append(custMobileTd)
                .append(custEmailTd)
                .append(btnTd)
                .appendTo("#customer_table tbody");
        });
    }

    //左边分页信息
    function page_info(result) {
        //初始化
        $("#page_info").empty();
        var info = result.map.pageInfo;
        $("#page_info").append("当前"+info.pageNum+ "页，总"+info.pages+"页,总"+info.total+"条记录");
        totalRecord =info.total;
        currentPage = info.pageNum;
    }

    //右边分页条信息
    function page_nav(result) {
        //每次进来前清空一次
        $("#page_nav").empty();

        var nav = result.map.pageInfo;
        //构建元素
        var ul =$("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
        //添加判断信息 没有上一页的信息  首页和上一页不能点击
        if(nav.hasPreviousPage==false){
            firstPageLi.addClass("disabled");
            prePage.addClass("disabled");
        }else{
            //为元素添加点击事件 上一页和首页
            firstPageLi.click(function () {
                to_page(1);
            });
            prePage.click(function () {
                to_page(nav.pageNum-1);
            });
        }

        var nextPage = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lasttPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        //添加判断信息 没有下一页的信息  尾页和下一页不能点击
        if(nav.hasNextPage==false){
            nextPage.addClass("disabled");
            lasttPageLi.addClass("disabled");
        }else{
            //为元素添加点击事件 下一页和尾页
            nextPage.click(function () {
                to_page(nav.pageNum+1);
            });
            lasttPageLi.click(function () {
                to_page(nav.pages);
            });
        }


        //添加首页和前一页的提示
        ul.append(firstPageLi).append(prePage);
        //1 2 3 4 5   给ul添加页码提示
        $.each(nav.navigatepageNums,function (index,item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            //添加当前页被选中的条件
            if(nav.pageNum==item){
                numLi.addClass("active");
            }
            //给numLi绑定点击事件跳转到相应页数
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加尾页和后一页
        ul.append(nextPage).append(lasttPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav");
    }

    //表单重置的方法
    function reset_form(e){
        //清空数据
        $(e)[0].reset();
        //清空样式
        $(e).find("*").removeClass("has-success has-error");
        $(e).find(".help-block").text("");

    }

    //点击新增弹出模态框
    $("#cust_add_modal_btn").click(function () {
        //清除表单数据
        reset_form("#addModal form");
        //获取字典数据
        getSource("#custSource_add");
        getIndustry("#custIndustry_add");
        getLevel("#custLevel_add")
        $("#addModal").modal({
            backdrop:"static",
        });
    });

    //获取字典数据填充下拉框
    function getSource(ele) {
        $(ele).empty();
        $.ajax({
            url:"/getAllDict",
            type:"GET",
            success:function (result) {
                var lists = result.map.list;
                //console.log(lists);
                $.each(lists,function () {
                    if(this.dictTypeCode==002){
                        var options = $("<option></option>").append(this.dictItemName).attr("value",this.dictId);
                        options.appendTo(ele);
                    }

                });
            }
        });
    }
    function getIndustry(ele) {
        $(ele).empty();
        $.ajax({
            url:"/getAllDict",
            type:"GET",
            success:function (result) {
                var lists = result.map.list;
                //console.log(lists);
                $.each(lists,function () {
                    if(this.dictTypeCode==001){
                        var options = $("<option></option>").append(this.dictItemName).attr("value",this.dictId);
                        options.appendTo(ele);
                    }
                });
            }
        });
    }
    function getLevel(ele) {
        $(ele).empty();
        $.ajax({
            url:"/getAllDict",
            type:"GET",
            success:function (result) {
                var lists = result.map.list;
                //console.log(lists);
                $.each(lists,function () {
                    if(this.dictTypeCode==006){
                        var options = $("<option></option>").append(this.dictItemName).attr("value",this.dictId);
                        options.appendTo(ele);
                    }
                });
            }
        });
    }
    //抽取校验信息提示
    function validate_add_msg(ele,status,msg){
        //初始化 清除元素的校验状态 防止class=“has-success has-error”重复添加
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success"==status){
            $(ele).parent().addClass('has-success');
            $(ele).next("span").text(msg);
        }else if("error"==status){
            $(ele).parent().addClass('has-error');
            $(ele).next("span").text(msg);
        };
    }

    //表单校验移开后开始校验
    $("#custName_add").change(function () {
        var custName = $("#custName_add").val();
        var regName =/(^[a-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(custName)){
            validate_add_msg("#custName_add","error","用户名为2-5位中文，或者6-16位英文和数字组合");

        }else{
            validate_add_msg("#custName_add","success","");
        };
    });
    $("#email_add").change(function () {
        var email = $("#email_add").val();
        var regEmail =/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            validate_add_msg("#email_add","error","邮箱格式错误!");

        }else{
            validate_add_msg("#email_add","success","");
        }
    });

    //提交表单校验
    function validate_add_form(){
        var custName = $("#custName_add").val();
        var regName =/(^[a-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(custName)){
            validate_add_msg("#custName_add","error","用户名为2-5位中文，或者6-16位英文和数字组合");
            return false;
        }else{
            validate_add_msg("#custName_add","success","");
        };

        var email = $("#email_add").val();
        var regEmail =/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            validate_add_msg("#email_add","error","邮箱格式错误!");
            return false;
        }else{
            validate_add_msg("#email_add","success","");
        }
        return true;
    }

    //点击保存客户信息
    $("#save_btn").click(function () {
        console.log($("#addModal form").serialize());
        //1先对填入数据进行校验
        if(!validate_add_form()){
            return false;
        }
        //2 模态框填写的表单数据交给服务器进行保存
        // 发生Ajax请求保存员工
        $.ajax({
            url:"${APP_PATH}/saveCust",
            type:"POST",
            data:$("#addModal form").serialize(),
            success:function (result) {
                if(result.code==100){
                    //员工保存成功后关闭模态框 并且来到最后一页
                    $("#addModal").modal('hide');
                    //给一个比总条数多的数字  分页插件指挥跳转到最后一页 但是不保险
                    //to_page(999);
                    //定义一个totalrecord  在保存/解析并显示左边分页信息 page_info(result);
                    // 里面将总记录数拿出来 totalRecord =info.total;
                    to_page(totalRecord);
                }else{
                    //显示校验失败信息
                    if(undefined!=result.map.errorFields.email){
                        //显示邮箱错误信息
                        validate_add_msg("#email_add","error",result.map.errorFields.email);
                    }
                    if(undefined!=result.map.errorFields.custName){
                        //显示名字错误信息
                        validate_add_msg("#custName_add","error",result.map.errorFields.custName);
                    }
                    //console.log(result.map.errorFields);
                }

            }
        })

    });

    //用这种方法为编辑按钮绑定事件 弹出员工修改模态框
    $(document).on("click",".edit_btn",function () {
        //清除表单数据
        reset_form("#updateModal form");
        //获取字典数据
        getSource("#custSource_update");
        getIndustry("#custIndustry_update");
        getLevel("#custLevel_update");
        // //弹出模态框 把员工id传递给模态框的更新按钮
        // $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        $("#updateModal").modal({
            backdrop:"static"
        });
    });
</script>


</body>
</html>
