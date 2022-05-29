<%--
  Created by IntelliJ IDEA.
  User: en
  Date: 2021/3/1
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="page"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>left</title>
    <link rel="icon" href="${ctx}/static/images/bfavicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${ctx}/static/images/bfavicon.ico" type="image/x-icon" />
    <link href="${ctx}/static/css/style.css" rel="stylesheet" type="text/css" />
    <script src="${ctx}/static/js/jquery.min.js" charset="utf-8"></script>
    <script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
</head>
<body style="background:#f0f9fd;">
<dl class="leftmenu">
    <dd>
        <div class="title">
            <span><img src="${ctx}/static/images/ico01.png" style="width: 16px;height: 16px;"/></span>主页面
        </div>
        <ul class="menuson">
            <li class="active"><cite></cite><a href="${ctx}/page" target="rightFrame">首页</a><i></i></li>
        </ul>
    </dd>

    <dd>
        <div class="title">
            <span><img src="${ctx}/static/images/i07.png" style="width: 16px;height: 16px;" /></span>员工管理
        </div>
        <ul class="menuson">
            <li><cite></cite><a href="${ctx}/right" target="rightFrame">员工列表</a><i></i></li>
        </ul>
    </dd>

    <dd><div class="title"><span><img src="${ctx}/static/images/d04.png" style="width: 16px;height: 16px;"/></span>考勤管理</div>
        <ul class="menuson">
            <li><cite></cite><a href="${ctx}/attendance" target="rightFrame">考勤列表</a><i></i></li>
        </ul>
    </dd>

    <dd><div class="title"><span><img src="${ctx}/static/images/i09.png" style="width: 16px;height: 16px;"/></span>奖罚管理</div>
        <ul class="menuson">
            <li><cite></cite><a href="${ctx}/salaryitems" target="rightFrame">奖罚详情</a><i></i></li>
        </ul>
    </dd>

    <dd><div class="title"><span><img src="${ctx}/static/images/money.png" style="width: 16px;height: 16px;"/></span>工资管理</div>
        <ul class="menuson">
            <li><cite></cite><a href="${ctx}/salarydetails" target="rightFrame">工资详情</a><i></i></li>
            <li><cite></cite><a href="${ctx}/basesalarymaintenance" target="rightFrame">基本工资维护</a><i></i></li>
        </ul>
    </dd>

    <dd><div class="title"><span><img src="${ctx}/static/images/t05.png" style="width: 16px;height: 16px;"/></span>系统设置</div>
        <ul class="menuson">
            <li><cite></cite><a href="${ctx}/password" target="rightFrame">修改密码</a><i></i></li>
            <li id="loginOut"><cite></cite><a href="${ctx}/logout" target="rightFrame">退出登录</a><i></i></li>
        </ul>
    </dd>
</dl>
<script type="text/javascript">
    $(function(){
        //导航切换
        $(".menuson li").click(function(){
            $(".menuson li.active").removeClass("active")
            $(this).addClass("active");
        });

        $('.title').click(function(){
            var $ul = $(this).next('ul');
            $('dd').find('ul').slideUp();
            if($ul.is(':visible')){
                $(this).next('ul').slideUp();
            }else{
                $(this).next('ul').slideDown();
            }
        });
    })
</script>
</body>
</html>


