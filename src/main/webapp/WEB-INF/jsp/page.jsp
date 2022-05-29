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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link rel="icon" href="${ctx}/static/images/bfavicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="${ctx}/static/images/bfavicon.ico" type="image/x-icon"/>
    <link href="${ctx}/static/css/style.css" rel="stylesheet" type="text/css"/>
    <script src="${ctx}/static/js/jquery.min.js" charset="utf-8"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">主页面</a></li>
        <li><a href="#">首页</a></li>
    </ul>
</div>
<div class="mainindex">
    <div class="welinfo">
        <span><img src="${ctx}/static/images/sun.png" alt="天气"/></span>
        <b>Hi，${requestScope.loginUser.username}，欢迎使用信息管理系统</b>
    </div>
</div>

</body>
</html>



