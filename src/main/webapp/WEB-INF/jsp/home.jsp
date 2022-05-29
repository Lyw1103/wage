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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>工资管理系统</title>
    <link rel="icon" href="${ctx}/static/images/bfavicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="${ctx}/static/images/bfavicon.ico" type="image/x-icon"/>
</head>
<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
    <frame src="${ctx}/top" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame"/>
    <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
        <frame src="${ctx}/left" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame"/>
        <frame src="${ctx}/page" name="rightFrame" id="rightFrame" title="rightFrame"/>
    </frameset>
</frameset>
<noframes>
    <body>
    <script src="${ctx}/static/js/jquery.min.js" charset="utf-8"></script>
    <script src="${ctx}/static/bootstrap-4.4.1-dist/js/bootstrap.bundle.js" charset="utf-8"></script>
    <script src="${ctx}/static/bootstrap-4.4.1-dist/js/bootstrap.js" charset="utf-8"></script>
    <script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/xadmin.js"></script>
    <script type="text/javascript">
        var layerFormIndex, layer;
        layui.use(function () {
            $ = layui.$;
            layer = layui.layer;
            form = layui.form;
            //修改密码
            $("#saveUserType").click(function () {
                var password = $("#password").val();
                var newPassword1 = $("#newPassword1").val();
                var newPassword2 = $("#newPassword2").val();
                var userid = $("#userid").val();

                if (password === undefined || password === null || password === "") {
                    layer.msg("请输入原密码", {icon: 5})
                    return;
                }
                if (newPassword1 === undefined || newPassword1 === null || newPassword1 === "") {
                    layer.msg("请输入新密码", {icon: 5})
                    return;
                }
                if (newPassword2 != newPassword1) {
                    layer.msg("新密码与确认新密码不一致", {icon: 5})
                    return;
                }
                if (userid === undefined || userid === null || userid === "") {
                    layer.msg("参数异常userid", {icon: 5})
                    return;
                }
                //表单提交
                var layerIndex = layer.load();//打开加载层
                $.post('${ctx}/resetPassword?method=resetPassword', {
                    password: password,
                    newPassword1: newPassword1,
                    userid: userid
                }, function (jsonMsg) {
                    layer.close(layerIndex);//关闭加载层
                    if (jsonMsg.state) {//正常
                        layer.open({
                            title: '提示',
                            content: '密码修改成功,请重新登录!',
                            icon: 0,
                            yes: function (index, layero) {
                                $.post('${ctx}/login/loginOut?method=loginOut', function () {
                                    window.location.reload();//刷新页面
                                });
                            }
                        });
                    } else {
                        layer.msg(jsonMsg.msg, {icon: 5});
                    }
                }, 'json');
            });
        });

        //退出系统
        function loginOut() {
            layer.open({
                title: '提示',
                content: '你确定要退出系统吗?',
                icon: 0,
                yes: function (index, layero) {
                    $.post('${ctx}/login/loginOut?method=loginOut', function () {
                        window.location.reload();//刷新页面
                    });
                }
            });
        }

        //弹出模态窗体
        function UpdateBtn() {
            $("#insertUserType input[type='reset']").click();//重置表单
            $("#insertRole").modal();//弹出模态窗体
        }
    </script>
    </body>
</noframes>
</html>
