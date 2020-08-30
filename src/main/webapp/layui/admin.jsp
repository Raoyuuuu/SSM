<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<html>
<head>
    <meta charset="utf-8">
    <title>layuiAdmin 控制台主页一</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/static/layui/css/admin.css" media="all">
    <script src="/static/js/echarts.min.js"></script>
</head>
<style>
    body{
        overflow-y: scroll;
        max-height: 690px;
    }
</style>
<body>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header">快捷方式</div>
                        <div class="layui-card-body">
                            <div class="layui-carousel layadmin-carousel layadmin-shortcut">

                                    <ul class="layui-row layui-col-space10">
                                        <li class="layui-col-xs3">
                                            <a lay-href="home/homepage1.html">
                                                <i class="layui-icon layui-icon-console"></i>
                                                <cite>主页一</cite>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs3">
                                            <a lay-href="home/homepage2.html">
                                                <i class="layui-icon layui-icon-chart"></i>
                                                <cite>主页二</cite>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs3">
                                            <a lay-href="component/layer/list.html">
                                                <i class="layui-icon layui-icon-template-1"></i>
                                                <cite>弹层</cite>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs3">
                                            <a layadmin-event="im">
                                                <i class="layui-icon layui-icon-chat"></i>
                                                <cite>聊天</cite>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs3">
                                            <a lay-href="component/progress/index.html">
                                                <i class="layui-icon layui-icon-find-fill"></i>
                                                <cite>进度条</cite>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs3">
                                            <a lay-href="app/workorder/list.html">
                                                <i class="layui-icon layui-icon-survey"></i>
                                                <cite>跟单</cite>
                                            </a>
                                        </li>
                                        <shiro:hasRole name="admin">
                                        <li class="layui-col-xs3">
                                            <a lay-href="user/user/list.html">
                                                <i class="layui-icon layui-icon-user"></i>
                                                <cite>用户</cite>
                                            </a>
                                        </li>
                                        </shiro:hasRole>

                                        <shiro:hasRole name="admin">
                                        <li class="layui-col-xs3">
                                            <a lay-href="set/system/website.html">
                                                <i class="layui-icon layui-icon-set"></i>
                                                <cite>设置</cite>
                                            </a>
                                        </li>
                                        </shiro:hasRole>

                                    </ul>

                            </div>

                        </div>
                    </div>
                </div>

                <div class="layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header">待办事项</div>
                        <div class="layui-card-body">

                            <div class="layui-carousel layadmin-carousel layadmin-backlog">

                                    <ul class="layui-row layui-col-space10">
                                        <li class="layui-col-xs6">
                                            <a lay-href="app/content/comment.html" class="layadmin-backlog-body">
                                                <h3>待跟进业务</h3>
                                                <p><cite>66</cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs6">
                                            <a lay-href="app/forum/list.html" class="layadmin-backlog-body">
                                                <h3>跟进状态</h3>
                                                <p><cite>12</cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs6">
                                            <a lay-href="template/goodslist.html" class="layadmin-backlog-body">
                                                <h3>知识库</h3>
                                                <p><cite>99</cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs6">
                                            <a href="javascript:;" onclick="layer.tips('不跳转', this, {tips: 3});" class="layadmin-backlog-body">
                                                <h3>新增联系人</h3>
                                                <p><cite>20</cite></p>
                                            </a>
                                        </li>
                                    </ul>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card">
                    <div class="layui-card-header">数据概览</div>
                    <div class="layui-card-body">
                        <div id="main" style="width: 100%;height:300px;"></div>
                        <%--<div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-dataview">--%>
                        <%--<div carousel-item id="LAY-index-dataview">--%>
                        <%--<div><i class="layui-icon layui-icon-loading1 layadmin-loading"></i></div>--%>
                        <%--<div></div>--%>
                        <%--<div></div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                    </div>
                </div>

                    <div class="layui-card">
                        <div class="layui-card-header">数据概览</div>
                        <div class="layui-card-body">
                            <div id="main1" style="width: 100%;height:300px;"></div>
                        </div>
                    </div>

                    <%--<div class="layui-card">--%>
                        <%--<div class="layui-tab layui-tab-brief layadmin-latestData">--%>
                            <%--<ul class="layui-tab-title">--%>
                                <%--<li class="layui-this">今日热搜</li>--%>
                                <%--<li>今日热帖</li>--%>
                            <%--</ul>--%>
                            <%--<div class="layui-tab-content">--%>
                                <%--<div class="layui-tab-item layui-show">--%>
                                    <%--<table id="LAY-index-topSearch"></table>--%>
                                <%--</div>--%>
                                <%--<div class="layui-tab-item">--%>
                                    <%--<table id="LAY-index-topCard"></table>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                </div>
            </div>
        </div>

        <div class="layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header">版本信息</div>
                <div class="layui-card-body layui-text">
                    <table class="layui-table">
                        <colgroup>
                            <col width="100">
                            <col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <td>当前版本</td>
                            <td>
                                CRM客户关系管理系统1.0
                            </td>
                        </tr>
                        <tr>
                            <td>基于框架</td>
                            <td>
                                SSM+Layui
                            </td>
                        </tr>
                        <tr>
                            <td>主要特色</td>
                            <td>响应式 / 清爽 / 极简</td>
                        </tr>
                        <tr>
                            <td>获取渠道</td>
                            <td>
                                Layui：
                                <a href="http://www.layui.com" target="_blank" style="text-decoration:none">http://www.layui.com</a>
                                <br/>
                                SSM：
                                <a href="https://spring.io/" target="_blank" style="text-decoration:none">https://spring.io</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="layui-card">
                <div class="layui-card-header">效果报告</div>
                <div class="layui-card-body layadmin-takerates">
                    <div class="layui-progress" lay-showPercent="yes">
                        <h3>转化率（日同比 28% <span class="layui-edge layui-edge-top" lay-tips="增长" lay-offset="-15"></span>）</h3>
                        <div class="layui-progress-bar" lay-percent="65%"></div>
                    </div>
                    <div class="layui-progress" lay-showPercent="yes">
                        <h3>签到率（日同比 11% <span class="layui-edge layui-edge-bottom" lay-tips="下降" lay-offset="-15"></span>）</h3>
                        <div class="layui-progress-bar" lay-percent="32%"></div>
                    </div>
                </div>
            </div>

            <div class="layui-card">
                <div class="layui-card-header">实时监控</div>
                <div class="layui-card-body layadmin-takerates">
                    <div class="layui-progress" lay-showPercent="yes">
                        <h3>CPU使用率</h3>
                        <div class="layui-progress-bar" lay-percent="58%"></div>
                    </div>
                    <div class="layui-progress" lay-showPercent="yes">
                        <h3>内存占用率</h3>
                        <div class="layui-progress-bar layui-bg-red" lay-percent="90%"></div>
                    </div>
                </div>
            </div>

            <div class="layui-card">
                <div class="layui-card-header">产品动态</div>
                <div class="layui-card-body">
                    <div class="layui-carousel layadmin-carousel layadmin-news" data-autoplay="true" data-anim="fade" lay-filter="news">
                        <div carousel-item>
                            <div><a href="http://fly.layui.com/docs/2/" target="_blank" class="layui-bg-red">layuiAdmin 快速上手文档</a></div>
                            <div><a href="http://fly.layui.com/vipclub/list/layuiadmin/" target="_blank" class="layui-bg-green">layuiAdmin 会员讨论专区</a></div>
                            <div><a href="http://www.layui.com/admin/#get" target="_blank" class="layui-bg-blue">获得 layui 官方后台模板系统</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="/static/layui/layui.js"></script>
<script src="/static/js/jquery-3.3.1.min.js"></script>

<script  type="text/javascript">
var arr=[];
var arr2=[];
var arrNum=[];
var industryName;
    $(function () {
        //柱状图
        var myChart1 = echarts.init(document.getElementById('main1'));
        myChart1.setOption({
            title: {
                text: '客户行业',
                x:'center'
            },
            color: ['#3398DB'],
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis : {
                data:[]
            },
            yAxis : {},
            series : [
                {
                    name:'数量',
                    type:'bar',
                    barWidth: '60%',
                    data:[]
                }
            ]
        });

        $.ajax({
            url:'/customer/list',
            type:'POST',
            success:function (result) {
                var data = result.map.data;
                var industryTotal = [];  // 存最终数据结果

                // 数据按照名称进行归类
                var nameContainer = {}; // 针对键name进行归类的容器
                $.each(data, function () {
                    nameContainer[this.cust_industry] = nameContainer[this.cust_industry] || [];
                    nameContainer[this.cust_industry].push(this);
                });

                //console.log(nameContainer); // 按照名称归类完成：{ apple: Array(2), banana: Array(2) }

                // 统计不同数据的数量
                industryName = Object.keys(nameContainer); // 获取种类：["apple", "banana"]
                console.log(industryName);

                $.each(industryName, function (i, nameitem) {
                    //console.log(nameContainer[nameitem].length);
                    arrNum.push(nameContainer[nameitem].length);
                });
                console.log(arrNum);

                myChart1.setOption({
                    xAxis: {
                        data:industryName
                    },
                    series: [{
                        // 根据名字对应到相应的系列
                        name: '数量',
                        data: arrNum
                    }]
                });
            }

        });

        $.ajax({
            url:'/customer/list',
            type:'POST',
            success:function (result) {
                var data = result.map.data;
                //console.log(data);
                var phone = 0;//电话营销
                var network = 0;//网络营销
                var promotion = 0;//推广活动
                var direct = 0;//直接访问
                var videoAdve = 0;//视频广告

                $.each(data,function () {
                    if(this.sourceId===6){
                        phone++;
                    }
                    if(this.sourceId===7){
                        network++;
                    }
                    if(this.sourceId===35){
                        promotion++;
                    }
                    if(this.sourceId===37){
                        direct++;
                    }
                    if(this.sourceId===45){
                        videoAdve++;
                    }


                });

                var myChart = echarts.init(document.getElementById('main'));
                // 指定图表的配置项和数据
                var option = {
                    title : {
                        text: '客户来源',
                        subtext: '',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: ['直接访问','电话营销','网络营销','视频广告','推广活动']
                    },
                    series : [
                        {
                            name: '来源',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '60%'],
                            data:[
                                {value:direct, name:'直接访问'},
                                {value:videoAdve, name:'视频广告'},
                                {value:phone, name:'电话营销'},
                                {value:network, name:'网络营销'},
                                {value:promotion, name:'推广活动'}
                            ],
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                },
                                normal:{
                                    color:function(params) {
                                        //自定义颜色
                                        var colorList = [
                                            '#01AAED', '#5FB878', '#2F4056', '#FF5722', '#009688'
                                        ];
                                        return colorList[params.dataIndex]
                                    }
                                }
                            }
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }
        });
    })





</script>
</body>
</html>

