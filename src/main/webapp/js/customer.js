
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

    $("#addModal").modal({
        backdrop:"static",
    });
});