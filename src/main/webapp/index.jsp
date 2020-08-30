<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/layui/css/layui.css">
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/layui/layui.js"></script>

    <title>CRM</title>

    <style>
        .demoli li{
            padding: 0 0 0 15px;
        }
        .layui-nav-tree .layui-nav-item a{
            line-height: 53px;
            height: 50px;
            text-align: left;
        }
        .layui-nav-tree .layui-nav-item dd a{
            line-height: 39px;
            height: 40px;
            margin-top: 5px;
            padding-left: 41px;
        }
        .layui-layout-admin .layui-body{
            bottom: 0;
        }
        #iFrame1{
            width: 100%;
            min-height: 836px;
        }
    </style>
</head>
<body class="layui-layout-body" >
<div class="layui-layout layui-layout-admin">
    <div class="layui-header ">
        <div class="layui-logo">CRM客户管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <shiro:hasRole name="admin">
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        </shiro:hasRole>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:">
                    <img src="/images/alita1.jpg" class="layui-nav-img">
                    <cite>${user.usercode}</cite>
                </a>
                <dl class="layui-nav-child">
                    <a href="javascript:" data-url="layui/dictionary/dictionary.jsp" data-title="数据字典" data-id="55" class="site-demo-active" data-type="tabAdd">

                    <dd><a href="javascript:" data-url="layui/user/msg.jsp" data-title="基本资料" data-id="001" class="site-demo-active" data-type="tabAdd">基本资料</a></dd>
                    <dd><a href="#">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/logout" >退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll aheight">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">


                <li class="layui-nav-item layui-nav-itemed">

                    <a class="" href="javascript:;" >
                        <i class="layui-icon layui-icon-home"></i>&nbsp;
                        主页
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:" id="divObj" data-url="layui/admin.jsp" data-title="控制台"  data-id="11" class="site-demo-active" data-type="tabAdd" >控制台</a></dd>
                        <dd><a href="#">主页一</a></dd>
                        <dd><a href="#">主页二</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:" data-url="layui/customer/customer.jsp" data-title="客户" data-id="22" class="site-demo-active" data-type="tabAdd">
                        <i class="layui-icon layui-icon-group"></i>&nbsp;
                        客户
                    </a>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:" data-url="layui/linkman/linkman.jsp" data-title="联系人" data-id="33" class="site-demo-active" data-type="tabAdd">
                        <i class="layui-icon layui-icon-dialogue"></i>&nbsp;
                        联系人
                    </a>
                </li>

                <shiro:hasRole name="admin">
                <li class="layui-nav-item">
                    <a href="javascript:" data-url="layui/dictionary/dictionary.jsp" data-title="数据字典" data-id="55" class="site-demo-active" data-type="tabAdd">
                        <i class="layui-icon layui-icon-read"></i>&nbsp;
                        数据字典
                    </a>
                </li>
                </shiro:hasRole>

                <li class="layui-nav-item">
                    <a href="javascript:" data-url="layui/knowledge/knowledge.jsp" data-title="知识库" data-id="44" class="site-demo-active" data-type="tabAdd">
                        <i class="layui-icon layui-icon-template"></i>&nbsp;
                        知识库
                    </a>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:" data-url="layui/documentary/documentary.jsp" data-title="跟单" data-id="66" class="site-demo-active" data-type="tabAdd">
                        <i class="layui-icon layui-icon-survey"></i>&nbsp;
                        跟单
                    </a>
                </li>


               <shiro:hasRole name="admin">
                   <li class="layui-nav-item">
                       <a class="" href="javascript:;" >
                           <i class="layui-icon layui-icon-set"></i>&nbsp;
                           设置
                       </a>
                       <dl class="layui-nav-child">
                           <dd><a href="#" data-url="layui/user/user.jsp" data-title="用户维护"  data-id="1" class="site-demo-active" data-type="tabAdd" >用户维护</a></dd>
                           <dd><a href="#" data-url="layui/role/role.jsp" data-title="角色维护"  data-id="2" class="site-demo-active" data-type="tabAdd">角色维护</a></dd>
                       </dl>
                   </li>
               </shiro:hasRole>



            </ul>

        </div>
    </div>

    <div class="layui-body" style="overflow-y: hidden; ">
        <!-- 内容主体区域 -->
        <div class="layui-tab layui-tab-brief" lay-filter="demo" lay-allowclose="true" style="margin: 0;">
            <ul class="layui-tab-title demoli">
            </ul>
            <ul class="rightmenu" style="display: none;position: absolute;">
                <li data-type="closethis">关闭当前</li>
                <li data-type="closeall">关闭所有</li>
            </ul>
            <div class="layui-tab-content" style="padding: 0px;">
            </div>
        </div>



    </div>

</div><!--last-->

<script>

    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

        $(function() {
            $("#divObj").click();
        });

        //li标签的点击事件
        $('.layui-nav-item').click(function(){
            $(this).siblings('li').attr('class','layui-nav-item');
        })

        //触发事件
        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function(url,id,name) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: name,
                    content: '<iframe data-frameid="'+id+'" scrolling="auto" id="iFrame1" name="iFrame1" frameborder="0" src="http://localhost:8080/'+url+'" ></iframe>',
                    id: id //规定好的id
                })
                CustomRightClick(id); //给tab绑定右击事件
                //FrameWH();  //计算ifram层的大小
            },
            tabChange: function(id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            }
            , tabDeleteAll: function (ids) {//删除所有
                $.each(ids, function (i,item) {
                    element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                })
            }
        };


        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-demo-active').on('click', function() {
            var dataid = $(this);

            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
            } else {
                //否则判断该tab项是否以及存在

                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                })
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });

        function CustomRightClick(id) {
            //取消右键  rightmenu属性开始是隐藏的 ，当右击的时候显示，左击的时候隐藏
            $('.layui-tab-title li').on('contextmenu', function () { return false; })
            $('.layui-tab-title,.layui-tab-title li').click(function () {
                $('.rightmenu').hide();
            });
            //桌面点击右击
            $('.layui-tab-title li').on('contextmenu', function (e) {
                var popupmenu = $(".rightmenu");
                popupmenu.find("li").attr("data-id",id); //在右键菜单中的标签绑定id属性

                //判断右侧菜单的位置
                l = ($(document).width() - e.clientX) < popupmenu.width() ? (e.clientX - popupmenu.width()) : e.clientX;
                t = ($(document).height() - e.clientY) < popupmenu.height() ? (e.clientY - popupmenu.height()) : e.clientY;
                popupmenu.css({ left: l, top: t }).show(); //进行绝对定位
                //alert("右键菜单")
                return false;
            });
        }

        $(".rightmenu li").click(function () {

            //右键菜单中的选项被点击之后，判断type的类型，决定关闭所有还是关闭当前。
            if ($(this).attr("data-type") == "closethis") {
                //如果关闭当前，即根据显示右键菜单时所绑定的id，执行tabDelete
                active.tabDelete($(this).attr("data-id"))
            } else if ($(this).attr("data-type") == "closeall") {
                var tabtitle = $(".layui-tab-title li");
                var ids = new Array();
                $.each(tabtitle, function (i) {
                    ids[i] = $(this).attr("lay-id");
                })
                //如果关闭所有 ，即将所有的lay-id放进数组，执行tabDeleteAll
                active.tabDeleteAll(ids);
            }

            $('.rightmenu').hide(); //最后再隐藏右键菜单
        })
        function FrameWH() {
            var h = $(window).height() ;
            $("iframe").css("height",h+"px");
        }

        $(window).resize(function () {
            FrameWH();
        })


        $("#demo1").click(function () {
            alert("注销成功")
        })


    });
</script>
</body>
</html>
