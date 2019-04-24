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
        #art_table tr th{
            text-align: center;
        }
        #art_table tr td{
            text-align: center;
        }
        .container {
            margin: 0;
            padding: 0;
            width: 97%;
            height: 100%;
            background-color: #ffffff;
        }

    </style>
</head>
<body>

<!--搭建显示页面-->
<div class="container">
    <!--标题-->
    <div class="row" id="">
        <div class="col-md-12">
            <h1>知识库</h1>
        </div>
    </div>

    <!--搜索框-->
    <form class="form-inline" style="margin-top:10px;margin-left: 20px ">
        <div class="form-group">
            <label>标题</label>
            <input type="text" class="form-control" id="artTitle_search" placeholder="Enter Somethis....">
        </div>
        <div class="form-group" style="margin-left: 10px">
            <label>分类</label>
            <select class="form-control" name="search" id="search_select" style="text-align: center">
            </select>
        </div>
        <button type="button" class="btn btn-default" id="search">搜索</button>
    </form>

    <div style="width: 100%;height: 5px;background-color: #BDBDBD"></div>

    <!--按钮-->
    <div class="row" style="margin-bottom: 20px;margin-top: 20px;">
        <div class="col-md-4">
            <button class="btn btn-info"><a href="/views/addKno.jsp" target="_self" style="text-decoration: none">新建内容</a></button>
        </div>
    </div>
    <!--显示表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover " id="art_table">
                <thead>
                <tr>
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
        <div class="col-md-4 pull-right" id="page_nav">

        </div>
    </div>

</div>

<script type="text/javascript">

    var totalRecord,currentPage;

    $(function(){
        //去首页
        getAllItem();
        to_page(1);
    });

    //抽取通用的获取分页数据的方法
    function to_page(pn){
        $.ajax({

            url:getUrl()+'/getAll',
            //url:"/getAll",
            data:"pn="+pn,
            type:"POST",
             beforeSend: function (XMLHttpRequest) {
                 XMLHttpRequest.setRequestHeader("kt-token", "r7udp5ujqrwho10buv6gbfshxua3b4b307y7eo2c0jipzno8c33u6ctfbsdv6lsxs1euqio");
             },
            success:function (result) {
                console.log(result)
                //解析并显示员工信息
                art_table(result);
                //解析并显示左边分页信息
                page_info(result);
                // //解析并显示右边分页条信息
                page_nav(result);
            }
        });
    }

    //表单数据显示
    function art_table(result) {
        //初始化
        $("#art_table tbody").empty();

        var art = result.map.list.list;
        console.log(art);
        $.each(art,function (index,item) {
            //var checkBoxTd = $("<td><input type='checkbox' class='check_item'></td>");
            var custIdTd = $("<td></td>").append(item.artId).addClass("hidden");
            var custNameTd = $("<td></td>").append(item.baseItem.itemName);
            var custSourceTd = $("<td></td>").append(item.artTitle);
            var custIndustryTd = $("<td></td>").append(item.artAuthor);
            var custLevelTd = $("<td></td>").append(item.artState=="1"?"发布中":"发布成功");
            var custMobileTd = $("<td></td>").append(item.artCreateTime);
            var custEmailTd = $("<td></td>").append(item.artUpdateTime);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            editBtn.attr("edit-id",item.artId);

            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            delBtn.attr("del-id",item.artId);

            var btnTd =$("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>")
                .append(custIdTd)
                .append(custNameTd)
                .append(custSourceTd)
                .append(custIndustryTd)
                .append(custLevelTd)
                .append(custMobileTd)
                .append(custEmailTd)
                .append(btnTd)
                .appendTo("#art_table tbody");
        });
    }

    //左边分页信息
    function page_info(result) {
        //每次进来前清空一次
        $("#page_info").empty();

        var info = result.map.list;
        $("#page_info").append("当前"+info.pageNum+ "页，总"+info.pages+"页,总"+info.total+"条记录");
        totalRecord =info.total;
        currentPage = info.pageNum;
    }

    //右边分页条信息
    function page_nav(result) {
        //每次进来前清空一次
        $("#page_nav").empty();

        var nav = result.map.list;
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

    //根据id删除
    $(document).on("click",".del_btn",function () {
        var name = $(this).parents("tr").find("td:eq(2)").text();
        var artId = $(this).attr("del-id");
        if(confirm("确认删除【"+name+"】")){
            //发送请求
            $.ajax({
                url:getUrl()+"/delArt/"+artId,
                type:"DELETE",
                beforeSend: function (XMLHttpRequest) {
                    XMLHttpRequest.setRequestHeader("kt-token", "r7udp5ujqrwho10buv6gbfshxua3b4b307y7eo2c0jipzno8c33u6ctfbsdv6lsxs1euqio");
                },
                success:function (result) {
                    console.log(result)
                    //回到本页
                    to_page(currentPage);

                }
            });
        }
    });
    
    //点击编辑跳转
    $(document).on("click",".edit_btn",function () {
        var artId = $(this).attr("edit-id");
        window.parent.mainFrame.location.href="/views/editKno.jsp?edit_id="+artId;
    })

    //查询所有分类信息
    function getAllItem() {
        //初始化
        $("#search_select").empty();

        $.ajax({
            //url:"${APP_PATH}/getAllItem",
            url:getUrl()+"/getAllItem",
            type:"GET",
            beforeSend: function (XMLHttpRequest) {
                XMLHttpRequest.setRequestHeader("kt-token", "r7udp5ujqrwho10buv6gbfshxua3b4b307y7eo2c0jipzno8c33u6ctfbsdv6lsxs1euqio");
            },
            success:function (result) {
                //$("#artAuthor_add").val("吴晓晓");//这边可以通过全局获取当前登录人再赋值
                //console.log(result);
                var nuoption =$("<option></option>").append("-----请选择-----").attr("value"," ").attr("selected","selected");
                nuoption.appendTo("#search_select");
                var cates = result.map.cates;
                $.each(cates,function () {

                    var options =$("<option></option>").append(this.itemName).attr("value",this.itemId);

                    options.appendTo("#search_select");
                });


            }

        });
    }

    //条件查询
    $("#search").click(function () {
        var artTtile = $("#artTitle_search").val();
        var artCate = $("#search_select").val();
        //console.log(artTtile,artCate);
        $.ajax({
            url:getUrl()+"/getByArt",
            type:"POST",
            dataType:"json",
            data:{
                artTitle:artTtile,
                artCate:artCate
            },
            beforeSend: function (XMLHttpRequest) {
                XMLHttpRequest.setRequestHeader("kt-token", "r7udp5ujqrwho10buv6gbfshxua3b4b307y7eo2c0jipzno8c33u6ctfbsdv6lsxs1euqio");
            },
            success:function (result) {
                console.log(result)
                //解析并显示员工信息
                art_table(result);
                //解析并显示左边分页信息
                page_info(result);
                // //解析并显示右边分页条信息
                page_nav(result);
            }
        });
    });
</script>
</body>
</html>
