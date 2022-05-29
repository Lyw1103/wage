<%--
  Created by IntelliJ IDEA.
  User: en
  Date: 2021/3/1
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="page"/>

<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta name="viewport" content="width=device-width" />
    <title>工资管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="stylesheet" href="${ctx}/static/css/common.css" media="all">
    <link rel="icon" href="${ctx}/static/images/bfavicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="${ctx}/static/images/bfavicon.ico" type="image/x-icon"/>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        if (window.top.location.href !== window.location.href) {
            window.top.location.href = window.location.href;
        }
    </script>
</head>
<body style="height:100%;background: url(${ctx}/static/images/loginbg3.png);background-color: rgb(28, 119, 172);" class="systemBackground">
<div class="dataLogin">
    <div class="dataLoginForm">
        <form name="dataLoginFormBox">
            <p class="p1"><span class="systemLogo"><img src="${ctx}/static/images/q2.png"></span><span class="systemName">工资管理系统</span></p>
            <p class="p2">账号&nbsp;&nbsp;<input class="text username" type="text" name="username" id="username"/></p>
            <p class="p3">密码&nbsp;&nbsp;<input class="text password" type="password" name="password" id="password"/></p>
            <p class="p4">验证&nbsp;&nbsp;<input class="text yzm" type="text" autocomplete="off" id="identityKey">
                <img alt="验证码" src="${ctx}/login/identity" id="identityKeyImg" onclick="reloadIdentityKeyImg()">
            </p>
            <p class="p5">
                <label><input class="submit loginSubmit button" id="btnSubmit" type="button" name="submit" value=" 登 录 " />&nbsp;&nbsp;</label>
            </p>
        </form>
    </div>
</div>
<script src="${ctx}/static/js/jquery.min.js" charset="utf-8"></script>
<script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(function (){
        var layer=layui.layer;
        $("#btnSubmit").click(function (){
            var userName=$("#username").val();
            var userPassword=$("#password").val();
            var identityKey=$("#identityKey").val();

            //数据校验
            if (userName===undefined || userName===null|| userName===""){
                layer.msg("请输入用户名",{icon:5})
                return;
            }
            if (userPassword===undefined || userPassword===null|| userPassword===""){
                layer.msg("请输入密码",{icon:5})
                return;
            }
            if (identityKey===undefined|| identityKey===null || identityKey===""){
                layer.msg("请输入验证码",{icon:5})
                return;
            }
            //表单提交
            var layerIndex=layer.load();//打开加载层
            $.post('${ctx}/login/doLogin',{
                username:userName,
                userpassword:userPassword,
                identityKey:identityKey
            },function (jsonMsg){
                layer.close(layerIndex);//关闭加载层
                if (jsonMsg.state){
                    //登录成功 页面跳转
                    window.location.replace('${ctx}/home')
                }else{
                    layer.msg(jsonMsg.msg,{icon:5});
                }
            },'json');

        });
    });

    //绑定登录的回车事件
    $(document).keyup(function (event){
        if(event.keyCode==13){
            $("#btnSubmit").trigger("click");
        }

    });

    function reloadIdentityKeyImg(){
        document.getElementById("identityKeyImg")
            .setAttribute("src","${ctx}/login/identity?t="+new Date().getTime());
    }
</script>
</body>
</html>