<%--
  Created by IntelliJ IDEA.
  User: en
  Date: 2021/3/4
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="page"/>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.5">
    <link rel="icon" href="${ctx}/static/images/bfavicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="${ctx}/static/images/bfavicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${ctx}/static/css/font.css">
    <link rel="stylesheet" href="${ctx}/static/css/xadmin.css">
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <title>首页</title>
    <style>
        #container {
            /*width:1410px;*/
            /*height:705px;*/
            /*position:relative;*/
            /*overflow:hidden;*/
            /*margin-left: 14px;*/
            /*margin-top: 8px;*/
            /*border-radius:10px;*/
        }

        .item {
            position: absolute;
        }

        #tabs {
            position: absolute;
            right: 30px;
            bottom: 20px;
        }

        .tab {
            float: left;
            margin-right: 10px;
            width: 6px;
            height: 6px;
            border: 3px solid rgba(184, 178, 182, .8);
            border-radius: 50%;
            background: #989196;
            cursor: pointer;
        }

        .active {
            background: #fff;
            border-color: #999497;
        }

        .btn {
            position: absolute;
            top: 50%;
            margin-top: -35px;
            width: 40px;
            height: 70px;
            color: #d6d3d5;
            font-size: 36px;
            line-height: 70px;
            text-align: center;
            cursor: pointer;
        }

        .btn:hover {
            background: rgba(127, 120, 125, 0.8);
        }

        .prev {
            position: absolute;
            left: 235px;
            border-radius: 0 5px 5px 0;
        }

        .next {
            position: absolute;
            right: 0;
            border-radius: 5px 0 0 5px;
        }
    </style>

</head>

<body>
<div>
    <%--导航条--%>
    <div class="x-nav">
        <span class="layui-breadcrumb"><h2 style="color: #1e71b1">首页</h2></span>
    </div>
</div>
<div id="container">
    <a class="item" href="#"><img style="width: 1305px;height: 530px;" src="${ctx}/static/images/lunbo1.jpg"/></a>
    <a class="item" href="#"><img style="width: 1305px;height: 530px;" src="${ctx}/static/images/lunbo2.jpg"/></a>
    <a class="item" href="#"><img style="width: 1305px;height: 530px;" src="${ctx}/static/images/lunbo3.jpg"/></a>
    <a class="item" href="#"><img style="width: 1305px;height: 530px;" src="${ctx}/static/images/lunbo4.jpg"/></a>
    <a class="item" href="#"><img style="width: 1800px;height: 530px;" src="${ctx}/static/images/lunbo5.jpg"/></a>
    <a class="item" href="#"><img style="width: 1305px;height: 530px;" src="${ctx}/static/images/lunbo6.jpg"/></a>
</div>

<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.SuperSlide.2.1.1.js"></script>
<script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
<script>
    $(document).ready(function () {
        var i = 0;
        var timer;

        //用jquery方法设置第一张图片显示，其余隐藏
        $('.item').eq(0).show().siblings('.item').hide();

        //调用showTime()函数（轮播函数）
        showTime();

        //当鼠标经过下面的数字时，触发两个事件（鼠标悬停和鼠标离开）
        $('.tab').hover(function () {
            //获取当前i的值，并显示，同时还要清除定时器
            i = $(this).index();
            Show();
            clearInterval(timer);
        }, function () {
            //
            showTime();
        });

// 创建一个showTime函数
        function showTime() {
            //定时器
            timer = setInterval(function () {
                //调用一个Show()函数
                Show();
                i++;
                //当图片是最后一张的后面时，设置图片为第一张
                if (i == 6) {
                    i = 0;
                }
            }, 2000);
        }

//创建一个Show函数
        function Show() {
            //在这里可以用其他jquery的动画
            $('.item').eq(i).fadeIn(300).siblings('.item').fadeOut(300);

            //给.tab创建一个新的Class为其添加一个新的样式，并且要在css代码中设置该样式
            $('.tab').eq(i).addClass('active').siblings('.tab').removeClass('active');

        }

    });
</script>
</body>
</html>
