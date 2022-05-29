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
    <title>奖罚详情</title>
    <link rel="icon" href="${ctx}/static/images/bfavicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="${ctx}/static/images/bfavicon.ico" type="image/x-icon"/>
    <link href="${ctx}/static/css/style.css" rel="stylesheet" type="text/css"/>
    <script src="${ctx}/static/js/jquery.min.js" charset="utf-8"></script>
    <script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">奖罚管理</a></li>
        <li><a href="#">奖罚详情</a></li>
    </ul>
</div>
<div class="formbody">
    <div class="formtitle"><span>奖罚详情信息</span></div>
    <ul class="forminfo forminfo1">
        <li>
            <label>迟到罚金:</label>
            <c:forEach items="${requestScope.salaryitems}" var="salaryitems1">
                <input id="latearrivalpenalty" autocomplete="off" value="${salaryitems1.latearrivalpenalty}" type="text" class="dfinput"/>
            </c:forEach>
        </li>
        <li>
            <label>早退罚金:</label>
            <c:forEach items="${requestScope.salaryitems}" var="salaryitems1">
                <input id="earlyrefundpenalty" autocomplete="off" value="${salaryitems1.earlyrefundpenalty}" type="text" class="dfinput"/>
            </c:forEach>
        </li>
        <li>
            <label>出差补贴:</label>
            <c:forEach items="${requestScope.salaryitems}" var="salaryitems1">
                <input id="travelallowance" autocomplete="off" value="${salaryitems1.travelallowance}" type="text" class="dfinput"/>
            </c:forEach>
        </li>
        <li>
            <label>全勤奖:</label>
            <c:forEach items="${requestScope.salaryitems}" var="salaryitems1">
                <input id="attendanceaward" autocomplete="off" value="${salaryitems1.attendanceaward}" type="text" class="dfinput"/>
            </c:forEach>
        </li>
        <li>
            <label>餐饮补贴:</label>
            <c:forEach items="${requestScope.salaryitems}" var="salaryitems1">
                <input id="foodandbeveragesubsidies" autocomplete="off" value="${salaryitems1.foodandbeveragesubsidies}" type="text" class="dfinput"/>
            </c:forEach>
        </li>
        <li>
            <label>交通补贴:</label>
            <c:forEach items="${requestScope.salaryitems}" var="salaryitems1">
                <input id="transportationsubsidies" autocomplete="off" value="${salaryitems1.transportationsubsidies}" type="text" class="dfinput"/>
            </c:forEach>
        </li>
        <li>
            <label>平时加班工价:</label>
            <c:forEach items="${requestScope.salaryitems}" var="salaryitems1">
                <input id="overtimworkrates" autocomplete="off" value="${salaryitems1.overtimworkrates}" type="text" class="dfinput"/>
            </c:forEach>
        </li>
        <li>
            <label>周末加班工价:</label>
            <c:forEach items="${requestScope.salaryitems}" var="salaryitems1">
                <input id="weekendovertimerates" autocomplete="off" value="${salaryitems1.weekendovertimerates}" type="text" class="dfinput"/>
            </c:forEach>
        </li>
        <li style="display: none">
            <label>用户id</label>
            <c:forEach items="${requestScope.salaryitems}" var="salaryitems1">
                <input id="salaryitemid" autocomplete="off" value="${salaryitems1.salaryitemid}" type="text" class="dfinput"/>
            </c:forEach>
        </li>
        <li>
            <label>&nbsp;</label>
            <input id="btn" type="button" class="btn00" value="更新"/>
        </li>
    </ul>
</div>
<script type="text/javascript">
    var layerFormIndex, layer;
    layui.use(function () {
        $ = layui.$;
        layer = layui.layer;
        //修改密码
        $("#btn").click(function () {
            var latearrivalpenalty = $("#latearrivalpenalty").val();
            var earlyrefundpenalty = $("#earlyrefundpenalty").val();
            var travelallowance = $("#travelallowance").val();
            var attendanceaward = $("#attendanceaward").val();
            var foodandbeveragesubsidies = $("#foodandbeveragesubsidies").val();
            var transportationsubsidies = $("#transportationsubsidies").val();
            var overtimworkrates = $("#overtimworkrates").val();
            var weekendovertimerates = $("#weekendovertimerates").val();
            var salaryitemid = $("#salaryitemid").val();

            if (latearrivalpenalty === undefined || latearrivalpenalty === null || latearrivalpenalty === "") {
                layer.msg("请输入迟到罚金", {icon: 5})
                return;
            }
            if (earlyrefundpenalty === undefined || earlyrefundpenalty === null || earlyrefundpenalty === "") {
                layer.msg("请输入早退罚金", {icon: 5})
                return;
            }
            if (travelallowance === undefined || travelallowance === null || travelallowance === "") {
                layer.msg("请输入出差补贴:", {icon: 5})
                return;
            }
            if (attendanceaward === undefined || attendanceaward === null || attendanceaward === "") {
                layer.msg("请输入全勤奖", {icon: 5})
                return;
            }
            if (foodandbeveragesubsidies === undefined || foodandbeveragesubsidies === null || foodandbeveragesubsidies === "") {
                layer.msg("请输入餐饮补贴", {icon: 5})
                return;
            }
            if (transportationsubsidies === undefined || transportationsubsidies === null || transportationsubsidies === "") {
                layer.msg("请输入交通补贴", {icon: 5})
                return;
            }
            if (overtimworkrates === undefined || overtimworkrates === null || overtimworkrates === "") {
                layer.msg("请输入平时加班工价", {icon: 5})
                return;
            }
            if (weekendovertimerates === undefined || weekendovertimerates === null || weekendovertimerates === "") {
                layer.msg("请输入周末加班工价", {icon: 5})
                return;
            }
            if (salaryitemid === undefined || salaryitemid === null || salaryitemid === "") {
                layer.msg("参数异常userid", {icon: 5})
                return;
            }
            //表单提交
            var layerIndex = layer.load();//打开加载层
            $.post('${ctx}/sysd/edit', {
                latearrivalpenalty: latearrivalpenalty,
                earlyrefundpenalty: earlyrefundpenalty,
                travelallowance: travelallowance,
                attendanceaward: attendanceaward,
                foodandbeveragesubsidies: foodandbeveragesubsidies,
                transportationsubsidies: transportationsubsidies,
                overtimworkrates: overtimworkrates,
                weekendovertimerates: weekendovertimerates,
                salaryitemid: salaryitemid
            }, function (jsonMsg) {
                layer.close(layerIndex);//关闭加载层
                if (jsonMsg.state) {//正常
                    layer.open({
                        title: '提示',
                        content: '更新成功',
                        icon: 1,
                        anim: 4,
                        yes: function () {
                            layer.close(layer.index); //关闭特定层
                            setTimeout(function () {
                                window.location.reload();//刷新页面
                            }, 1000);//延迟
                        }
                    });
                } else {
                    layer.msg(jsonMsg.msg, {icon: 5});
                }
            }, 'json');
        });
    });
</script>
</body>
</html>


