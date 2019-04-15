<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">

    <script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add" placeholder="raoyu@126.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-3">
                            <!--部门提交部门id即可-->
                            <select class="form-control" name="dId" id="dept_add_select"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!--搭建显示页面-->
<div class="container">
    <!--标题-->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
        </div>
    </div>
    <!--显示表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover " id="emps_table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>


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

    $(function(){
        //去首页
        to_page(1);

    });

    var totalRecord;
    //抽取通用的获取分页数据的方法
    function to_page(pn){
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                //console.log(result);
                //解析并显示员工信息
                emps_table(result);
                //解析并显示左边分页信息
                page_info(result);
                //解析并显示右边分页条信息
                page_nav(result);
            }

        });
    }

    function emps_table(result) {
        //每次进来前清空一次
        $("#emps_table tbody").empty();

        var emps = result.map.pageInfo.list;
        $.each(emps,function (index,item) {
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            var btnTd =$("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");

        })
    }

    //左边分页信息
    function page_info(result) {
        //每次进来前清空一次
        $("#page_info").empty();

        var info = result.map.pageInfo;
        $("#page_info").append("当前"+info.pageNum+ "页，总"+info.pages+"页,总"+info.total+"条记录");
        totalRecord =info.total;
    }

    //分页条
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
    $("#emp_add_modal_btn").click(function () {
        //清除表单数据和样式
        reset_form("#empAddModal form");

        //发送Ajax请求查询部门信息
        getAllDept();
        //弹出模态框
        $("#empAddModal").modal({
            backdrop:"static",
        });
    });

    //查出所有的部门信息
    function getAllDept() {
        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            success:function (result) {
                var depts = result.map.depts;
                //console.log(result);
                //部门信息显示在下拉列表中
                //$("#dept_add_select")
                //遍历map: {depts: [{deptId: 1, deptName: "事业部"}, {deptId: 2, deptName: "人事部"}]}
                //this代表当前遍历对象
                $.each(depts,function () {
                    var options = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    options.appendTo("#dept_add_select");
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

    //表单校验
    function validate_add_form(){
        //拿到要校验的表单数据，使用正则表达式
        var empName = $("#empName_add").val();
        var regName =/(^[a-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(empName)){
            //alert("格式错误！用户名为2-5位中文，或者6-16位英文和数字组合");
            //清空之前的样式
            validate_add_msg("#empName_add","error","用户名为2-5位中文，或者3-16位英文和数字组合");
            // $("#empName_add").parent().addClass('has-error');
            // $("#empName_add").next("span").text("格式错误！用户名为2-5位中文，或者3-16位英文和数字组合");
            return false;
        }else{
            validate_add_msg("#empName_add","success","");
            // $("#empName_add").parent().addClass('has-success');
            // $("#empName_add").next("span").text("");
        };

        var email = $("#email_add").val();
        var regEmail =/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            //alert("邮箱格式错误");
            if(!regEmail.test(email)){
                //alert("格式错误！用户名为2-5位中文，或者3-16位英文和数字组合");
                validate_add_msg("#email_add","error","邮箱格式错误!");
                // $("#email_add").parent().addClass('has-error');
                // $("#email_add").next("span").text("邮箱格式错误!");
                return false;
            }else{
                validate_add_msg("#email_add","success","");
                // $("#email_add").parent().addClass('has-success');
                // $("#email_add").next("span").text("");
            };
            return false;
        };
        return true;
    }

    //校验用户名是否重复
    $("#empName_add").change(function () {
        //发生ajax请求校验用户名是否可用
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkUser",
            data:"empName="+empName,
            type:"POST",
            success:function (result) {
                if(result.code==100){
                    validate_add_msg("#empName_add","success","用户名可用");
                    //保存成功给保存按钮添加一个样式 给表单校验用
                    $("#emp_save_btn").attr("ajaxVlidate","success");
                }else{
                    validate_add_msg("#empName_add","error",result.map.va_msg);
                    $("#emp_save_btn").attr("ajaxVlidate","error");
                }
            }
        });
    });

    //点击保存员工信息
    $("#emp_save_btn").click(function () {
        //1先对填入数据进行校验
        if(!validate_add_form()){
            return false;
        }
        //判断用户名校验是否可用 不可用就不给保存
        if($(this).attr("ajaxVlidate")=="error"){
            return false;
        }
        //2 模态框填写的表单数据交给服务器进行保存
        // 发生Ajax请求保存员工
        $.ajax({
            url:"${APP_PATH}/saveEmp",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function (result) {
                if(result.code==100){
                    //alert(result.msg);
                    //员工保存成功后关闭模态框 并且来到最后一页
                    $("#empAddModal").modal('hide');
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
                    if(undefined!=result.map.errorFields.empName){
                        //显示名字错误信息
                        validate_add_msg("#empName_add","error",result.map.errorFields.empName);
                    }
                    //console.log(result.map.errorFields);
                }

            }
        })

    });


</script>
</body>
</html>
<style>

</style>