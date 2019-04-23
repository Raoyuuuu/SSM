<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
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
    <link rel="stylesheet" href="${APP_PATH}/static/css/summernote.css">

    <script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${APP_PATH}/static/js/summernote.min.js"></script>
    <script src="${APP_PATH}/static/js/summernote-zh-CN.js"></script>
    <script src="${APP_PATH}/js/global.js" ></script>
    <style>
        .container{
            margin: 0;
            padding: 40px 0 0 0;
        }
    </style>
</head>
<body>
<h1>新建内容</h1>
<div class="container">
    <form id="add_form"  class="form-horizontal required-validate" action="#" enctype="multipart/form-data" method="post" onsubmit="return iframeCallback(this, pageAjaxDone)">
        <div class="form-group">
            <label class="col-sm-2 control-label">文章标题</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" name="artTitle" id="artTitle_add" placeholder="Enter Something....">
                <span class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">选择分类</label>
            <div class="col-sm-2">
                <!--部门提交部门id即可-->
                <select class="form-control" name="artCate" id="artCate_add_select"></select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label hidden">发布人</label>
            <div class="col-sm-5">
                <%--<p class="form-control-static hidden" name="artAuthor" id="artAuthor_add"></p>--%>
                <input type="text" class="form-control hidden" name="artAuthor" id="artAuthor_add">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label hidden">状态</label>
            <div class="col-sm-5">
                <input type="text" class="form-control hidden" name="artState" id="artState_add" placeholder="Enter Something....">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label hidden">发布时间</label>
            <div class="col-sm-5">
                <input type="text" class="form-control hidden" name="artCreateTime" id="artCreateTime_add" placeholder="Enter Something....">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label hidden">更新时间</label>
            <div class="col-sm-5">
                <input type="text" class="form-control hidden" name="artUpdateTime" id="artUpdateTime_add" placeholder="Enter Something....">
            </div>
        </div>
        <div class="form-group" style="margin-top: 20px">
            <%--<label class="col-md-2 control-label">项目详情</label>--%>
            <div class="col-md-offset-2 col-md-8">
                <div id="summernote" name="description" placeholder="请对项目进行详细的描述，使更多的人了解你的">${deal.description}</div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-4 col-sm-8">
                <button type="button" id="art_add_btn" class="btn btn-info " style="width: 150px;">发布</button>
                <button type="button" id="cancle_btn" class="btn btn-default " style="width: 150px;">取消</button>
                <button type="button" id="images" class="btn btn-default " style="width: 150px;">显示</button>
            </div>

        </div>
    </form>
    <div id="html"></div>


</div>
<script type="text/javascript">
    //var file,data;
    var path;
    $(function(){

        //$("#add_form").empty();
        //获取所有分类
        getAllItem();

    });
    $('#summernote').each(function() {
        var $this = $(this);
        var placeholder = $this.attr("placeholder") || '';
        var url = $this.attr("action") || '';
        $this.summernote({
            lang : 'zh-CN',
            placeholder : placeholder,
            minHeight : 300,
            dialogsFade : true,// Add fade effect on dialogs
            dialogsInBody : true,// Dialogs can be placed in body, not in
// summernote.
            disableDragAndDrop : false,// default false You can disable drag
// and drop
            callbacks : {
                onImageUpload : function(files) {
                    var $files = $(files);
                    $files.each(function() {
                        var file = this;
                        var data = new FormData();
                        data.append("file", file);
                        $.ajax({
                            data : data,
                            type : "POST",
                            dataType : "json",
                            //url:"${APP_PATH}/execUpload",
                            url : getUrl()+"/execUpload",
                            beforeSend: function (XMLHttpRequest) {
                                XMLHttpRequest.setRequestHeader("kt-token", "r7udp5ujqrwho10buv6gbfshxua3b4b307y7eo2c0jipzno8c33u6ctfbsdv6lsxs1euqio");
                            },
                            cache : false,
                            contentType : false,
                            processData : false,

                            success : function(data) {
                                 path =data.path;
                               // $('#summernote').summernote('insertImage', 'http://localhost:8080/statics/'+path);

                                console.log(data);

                            },
                            error:function(){
                                alert("上传失败");
                            }
                        });
                    });
                }
            }
        });
    });

    //查询所有分类信息
    function getAllItem() {
        //初始化
        $("#artCate_add_select").empty();

        $.ajax({
            //url:"${APP_PATH}/getAllItem",
            url:getUrl()+"/getAllItem",
            type:"GET",
            beforeSend: function (XMLHttpRequest) {
                XMLHttpRequest.setRequestHeader("kt-token", "r7udp5ujqrwho10buv6gbfshxua3b4b307y7eo2c0jipzno8c33u6ctfbsdv6lsxs1euqio");
            },
            success:function (result) {
                $("#artAuthor_add").val("吴晓晓");//这边可以通过全局获取当前登录人再赋值
                //console.log(result);
                var cates = result.map.cates;
                $.each(cates,function () {
                    var options =$("<option></option>").append(this.itemName).attr("value",this.itemId);
                    options.appendTo("#artCate_add_select");
                });
            }

        });
    }

    //发布按钮点击保存
    $("#art_add_btn").click(function () {
        //1先对填入数据进行校验
        if(!validate_add()){
            return false;
        }
         //获取当前时间
         var time = CurentTime();
         var artCreateTime = time;
         var artUpdateTime = time;
         var artState =1;
         var artTitle =$("#artTitle_add").val();
         var artCate =$("#artCate_add_select").val();
         var markupStr = $('#summernote').summernote('code');
         if(markupStr=="<p><br></p>"){
             alert("请输入内容")
             return false;
         }

         var artAuthor ="吴晓晓";
         var artUrl ="http://localhost:8080/statics/"+path;
         //console.log(artCreateTime,artUpdateTime,artTitle,artCate,artState,markupStr);
         $.ajax({
             url:getUrl()+"/saveArt",
             type:"POST",
             dataType:"json",
             async:false,
             data:{
                 artCate:artCate,
                 artTitle:artTitle,
                 artContent:markupStr,
                 artAuthor:artAuthor,
                 artState:artState,
                 artCreateTime:artCreateTime,
                 artUpdateTime:artUpdateTime,
                 artUrl:artUrl,
             },
             beforeSend: function (XMLHttpRequest) {
                 XMLHttpRequest.setRequestHeader("kt-token", "r7udp5ujqrwho10buv6gbfshxua3b4b307y7eo2c0jipzno8c33u6ctfbsdv6lsxs1euqio");
             },
             success:function (result) {
                 if(result.code==100){
                     alert("添加成功")
                     history.back();
                 }else{
                     alert("添加失败")
                 }
             }

         });

    });

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

    //表单校验 移开马上验证
    $("#artTitle_add").change(function () {
        var custName = $("#artTitle_add").val();
        var regName =/(^[a-z0-9_-]{2,16}$)|(^[\u2E80-\u9FFF]{2,15})/;
        if(!regName.test(custName)){
            validate_add_msg("#artTitle_add","error","2-15位中文，或者2-16位英文和数字组合");

        }else{
            validate_add_msg("#artTitle_add","success","");
        };
    });

    //提交时验证
    function validate_add(){
        var custName = $("#artTitle_add").val();
        var regName =/(^[a-z0-9_-]{2,16}$)|(^[\u2E80-\u9FFF]{2,15})/;
        if(!regName.test(custName)){
            validate_add_msg("#artTitle_add","error","2-15位中文，或者2-16位英文和数字组合");
            return false;
        }else{
            validate_add_msg("#artTitle_add","success","");
        };
        return true;
    }


    //点击显示图片  因为本地文件禁止拿到 所以临时用这个方法测试
    $("#images").click(function () {
        $('#summernote').summernote('insertImage', 'http://localhost:8080/statics/'+path);
        var markupStr = $('#summernote').summernote('code');
        $("#html").html(markupStr)
    });

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

    //取消按钮事件
    $("#cancle_btn").click(function () {
        history.back();
    });
</script>
</body>
</html>
