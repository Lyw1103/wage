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

<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>right</title>
    <link rel="icon" href="${ctx}/static/images/bfavicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="${ctx}/static/images/bfavicon.ico" type="image/x-icon"/>
    <link href="${ctx}/static/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/lib/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-4.4.1-dist/css/bootstrap.css">
    <link rel="stylesheet" href="${ctx}/static/bootstrap-4.4.1-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="${ctx}/static/bootstrap-4.4.1-dist/css/bootstrap-reboot.css">
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">考勤管理</a></li>
        <li><a href="#">考勤列表</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li id="attendance" class="click toolbarli"><span><img src="${ctx}/static/images/i09.png"
                                                                   style="width: 24px;height: 24px;"/></span>新增考勤
            </li>
            <li id="update" class="click toolbarli"><span><img src="${ctx}/static/images/t02.png"
                                                               style="width: 24px;height: 24px;"/></span>更改考勤
            </li>
            <li id="audit" class="toolbarli"><span><img src="${ctx}/static/images/ico04.png"
                                                        style="width: 24px;height: 24px;"/></span>审核考勤
            </li>
            <li id="reload" class="toolbarli"><span><img src="${ctx}/static/images/dp.png"
                                                         style="width: 24px;height: 24px;"/></span>刷新
            </li>
        </ul>
        <div class="demoTable">
            <form class="form-horizontal" style="margin: 0px 0px 8px 1px;" role="form" id="doctorAdviceForm3">
                <div class="form-row h-left">
                    <div>
                        <label class="control-label lable-left">工号：</label>
                        <select class="form-control form-input3" id="workernumberselect" autocomplete="off">
                            <option value="">--请选择--</option>
                            <c:forEach items="${requestScope.attendance}" var="workerelect1">
                                <option value="${workerelect1.workernumber}">${workerelect1.workernumber}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label class="control-label lable-left">姓名：</label>
                        <select class="form-control form-input3" id="nameselect" autocomplete="off">
                            <option value="">--请选择--</option>
                            <c:forEach items="${requestScope.attendance}" var="workerelect2">
                                <option value="${workerelect2.name}">${workerelect2.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label class=" lable-left">部门：</label>
                        <select class="form-control form-input3" id="departmentselect" autocomplete="off">
                            <option value="">--请选择--</option>
                            <option value="开发部">开发部</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <table class="tablelist layui-table" lay-filter="Table" id="Table"></table>
</div>
<%--模态框--%>
<div class="modal fade" id="bedModel1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="medicineTitle"></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="medicineForm">
                    <%--标识是新增1还是修改0--%>
                    <input type="hidden" name="InsertAndUpdate" value="1">
                    <input type="reset" hidden/>
                    <div class="modal-body">
                        <h4 style="text-align: center">员工信息</h4>
                        <div class="form-group row">
                            <div class="col">
                                <label class="col-form-label text-right col-4">姓名:</label>
                                <select class="form-control form-input3" id="name" autocomplete="off">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${requestScope.attendance}" var="attendance1">
                                        <option value="${attendance1.name}">${attendance1.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col">
                                <label class="col-form-label text-right col-4">工号:</label>
                                <select class="form-control form-input3" id="workernumber" autocomplete="off">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${requestScope.attendance}" var="attendance1">
                                        <option value="${attendance1.workernumber}">${attendance1.workernumber}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col">
                                <label class="col-form-label text-right col-4">身份证号:</label>
                                <input id="card" type="text" autocomplete="off" class="form-control" disabled>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col">
                                <label class="col-form-label text-right col-4">岗位:</label>
                                <input id="post" type="text" autocomplete="off" class="form-control" disabled>
                            </div>
                            <div class="col">
                                <label class="col-form-label text-right col-4">部门:</label>
                                <input id="department" type="text" autocomplete="off" class="form-control" disabled>
                            </div>
                            <div class="col" style="visibility: hidden">
                                <label class="col-form-label text-right col-4">占位:</label>
                                <input id="A3" type="text" autocomplete="off" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="modal-body">
                        <h4 style="text-align: center">考勤信息</h4>
                        <div class="form-group row">
                            <div class="col">
                                <label class="col-form-label text-right col-4">病假:</label>
                                <input id="sickleave" type="text" autocomplete="off" class="form-control">
                            </div>
                            <div class="col">
                                <label class="col-form-label text-right col-4">事假:</label>
                                <input id="thingsfake" type="text" autocomplete="off" class="form-control">
                            </div>
                            <div class="col">
                                <label class="col-form-label text-right col-4">平时加班:</label>
                                <input id="usuallyovertime" type="text" autocomplete="off" placeholder="单位:小时"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col">
                                <label class="col-form-label text-right col-4">周末加班:</label>
                                <input id="weekly" type="text" autocomplete="off" placeholder="单位:小时"
                                       class="form-control">
                            </div>
                            <div class="col">
                                <label class="col-form-label text-right col-4">节假日加班:</label>
                                <input id="overtimeonholidays" type="text" autocomplete="off" placeholder="单位:天"
                                       class="form-control">
                            </div>
                            <div class="col">
                                <label class="col-form-label text-right col-4">迟到次数:</label>
                                <input id="latearrivals" type="text" autocomplete="off" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col">
                                <label class="col-form-label text-right col-4">早退次数:</label>
                                <input id="earlyarrivals" type="text" autocomplete="off" class="form-control">
                            </div>
                            <div class="col">
                                <label class="col-form-label text-right col-4">缺勤天数:</label>
                                <input id="absences" type="text" autocomplete="off" class="form-control">
                            </div>
                            <div class="col">
                                <label class="col-form-label text-right col-4">出差天数:</label>
                                <input id="travelallowanceday" type="text" autocomplete="off" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col">
                                <label class="col-form-label text-right col-4">考勤时间:</label>
                                <input id="attendancetime" type="text" autocomplete="off" class="form-control" disabled>
                            </div>
                            <div class="col" style="visibility: hidden">
                                <label class="col-form-label text-right col-4">占位:</label>
                                <input id="A4" type="text" autocomplete="off" class="form-control">
                            </div>
                            <div class="col" style="visibility: hidden">
                                <label class="col-form-label text-right col-4">占位:</label>
                                <input id="A5" type="text" autocomplete="off" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="modal-body" id="aduitdiv">
                        <h4 style="text-align: center">考勤审核</h4>
                        <div class="form-group row">
                            <div class="col">
                                <label class="col-form-label text-right col-4">审核:</label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="state" type="radio"
                                                                     autocomplete="off"
                                                                     class="form-check-input form-check-label"
                                                                     value="0">待审核
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="state" type="radio"
                                                                     autocomplete="off"
                                                                     class="form-check-input form-check-label"
                                                                     value="1">审核通过
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="state" type="radio"
                                                                     autocomplete="off"
                                                                     class="form-check-input form-check-label"
                                                                     value="2">审核不通过
                            </div>
                            <div class="col" style="visibility: hidden">
                                <label class="col-form-label text-right col-4">占位:</label>
                                <input id="A1" type="text" autocomplete="off" class="form-control">
                            </div>
                            <div class="col" style="visibility: hidden">
                                <label class="col-form-label text-right col-4">占位:</label>
                                <input id="A2" type="text" autocomplete="off" class="form-control" disabled>
                            </div>
                        </div>
                    </div>
                    <input id="attendanceid" type="hidden">
                    <input id="workerid" type="hidden">
                    <div class="form-group text-center">
                        <button type="button" class="btn btn-outline-primary mr-2" id="insertworker">确定</button>
                        <button type="button" class="btn btn-outline-secondary ml-2" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${ctx}/static/js/jquery.min.js" charset="utf-8"></script>
<script src="${ctx}/static/bootstrap-4.4.1-dist/js/bootstrap.bundle.js" charset="utf-8"></script>
<script src="${ctx}/static/bootstrap-4.4.1-dist/js/bootstrap.js" charset="utf-8"></script>
<script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
<script src="${ctx}/static/js/mouse.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/static/common/IDCardHelper.js"></script>
<script>
    var $, layerFormIndex, layer;
    //加载和初始化layui模块
    layui.use(function () {
        $ = layui.$;
        layer = layui.layer;
        var table = layui.table,
            form = layui.form;
        //左表格
        var Table = table.render({
            elem: "#Table",//table的ID HTML元素的ID
            id: 'Table',
            url: "/wage/syse/tablepage",
            page: true,//开启分页
            loading: true, //请求数据时，是否显示loading
            limits: [10, 15, 20, 25, 30, 35, 40, 45, 50],
            limit: 10, //每页默认显示的数量
            skin: 'row', //表格风格
            toolbar: true, //仅开启工具栏，不显示左侧模板(筛选列、打印、导出)
            // toolbar: 'default', //让工具栏左侧显示默认的内置模板(添加、修改、删除)
            cols: [
                [//标题栏  // colspan即横跨的单元格数，这种情况下不用设置field和width   //rowspan即纵向跨越的单元格数,这种情况下不用设置field和width
                    {align: 'center', title: '员工信息', colspan: 7},
                    {align: 'center', title: '请假', colspan: 2},
                    {align: 'center', title: '加班小时', colspan: 3},
                    {align: 'center', title: '考勤详情', colspan: 6},
                ],
                [
                    {type: 'radio', title: '选择', align: 'center', width: 80},
                    {type: 'numbers', title: '序号', align: 'center'},
                    {field: 'name', title: '姓名', align: 'center', width: 70},
                    {field: 'workernumber', title: '工号', align: 'center', width: 110},
                    {field: 'post', title: '岗位', align: 'center', width: 110},
                    {field: 'department', title: '部门', align: 'center', width: 110},
                    {field: 'card', title: '身份证号', align: 'center', width: 187},
                    {field: 'sickleave', title: '病假', align: 'center', width: 80},
                    {field: 'thingsfake', title: '事假', align: 'center', width: 80},
                    {field: 'usuallyovertime', title: '平时加班', align: 'center', width: 90},
                    {field: 'weekly', title: '周未加班', align: 'center', width: 90},
                    {field: 'overtimeonholidays', title: '节假日加班', align: 'center', width: 90},
                    {field: 'latearrivals', title: '迟到次数', align: 'center', width: 90},
                    {field: 'earlyarrivals', title: '早退次数', align: 'center', width: 90},
                    {field: 'absences', title: '缺勤天数', align: 'center', width: 90},
                    {field: 'travelallowanceday', title: '出差天数', align: 'center', width: 90},
                    {field: 'attendancetime', title: '考勤时间', align: 'center', width: 140},
                    {
                        field: 'state', title: '考勤状态', align: 'center', width: 95, templet: function (rowData) {
                            if (rowData.state == 0) {
                                return "待审核考勤";
                            } else if (rowData.state == 1) {
                                return "考勤通过";
                            } else if (rowData.state == 2) {
                                return "考勤不通过";
                            }

                        }
                    },
                ]
            ],
            page: false,   //是否开启分页
        });
        //条件查询
        $("#workernumberselect").change(function (e) {
            var workernumber = $("#workernumberselect").val();
            var name = $("#nameselect").val();
            var department = $("#departmentselect").val();
            //表格重载
            table.reload('Table', {
                where: {
                    workernumber: workernumber,
                    name: name,
                    department: department,
                }//设定异步数据接口的额外参数
            });
        });
        $("#nameselect").change(function (e) {
            var workernumber = $("#workernumberselect").val();
            var name = $("#nameselect").val();
            var department = $("#departmentselect").val();
            //表格重载
            table.reload('Table', {
                where: {
                    workernumber: workernumber,
                    name: name,
                    department: department,
                }//设定异步数据接口的额外参数
            });
        });
        $("#departmentselect").change(function (e) {
            var workernumber = $("#workernumberselect").val();
            var name = $("#nameselect").val();
            var department = $("#departmentselect").val();
            //表格重载
            table.reload('Table', {
                where: {
                    workernumber: workernumber,
                    name: name,
                    department: department,
                }//设定异步数据接口的额外参数
            });
        });
        //新增
        $('#attendance').click(function () {
            $('#medicineTitle').text("新增考勤信息");//设置模态框标题
            $("#medicineForm input[type='reset']").click();//重置表单
            $("#bedModel1").modal();//弹出模态窗体
            $('#medicineForm [name="InsertAndUpdate"]').val(1);//设置为新增
            $('#aduitdiv').attr("hidden", true);
            $('#name').attr("disabled", false);
            $('#workernumber').attr("disabled", false);
            $('#sickleave').attr("disabled", false);
            $('#thingsfake').attr("disabled", false);
            $('#usuallyovertime').attr("disabled", false);
            $('#weekly').attr("disabled", false);
            $('#overtimeonholidays').attr("disabled", false);
            $('#latearrivals').attr("disabled", false);
            $('#earlyarrivals').attr("disabled", false);
            $('#absences').attr("disabled", false);
            $('#travelallowanceday').attr("disabled", false);

            var Day = new Date();
            var year = Day.getFullYear();
            var month = (Day.getMonth() + 1) < 10 ? ('0' + (Day.getMonth() + 1)) : (Day.getMonth() + 1);
            var day = Day.getDate() < 10 ? ('0' + Day.getDate()) : Day.getDate();
            var hour = Day.getHours() < 10 ? ('0' + Day.getHours()) : Day.getHours();
            var minute = Day.getMinutes() < 10 ? ('0' + Day.getMinutes()) : Day.getMinutes();
            var seconds = Day.getSeconds() < 10 ? ('0' + Day.getSeconds()) : Day.getSeconds();
            var attendancetime = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + seconds;
            $('#attendancetime').val(attendancetime);//考勤时间
        });
        //修改
        $('#update').click(function () {
            var checkStatus1 = table.checkStatus('Table');
            console.log("输出checkStatus1---" + checkStatus1);
            var entities = checkStatus1.data;
            for (var i = 0; entities.length > i; i++) {//获取勾选的数据
                console.log(entities[i].state);
                var state = entities[i].state;
                if (state == "1" || state == "2") {
                    break;// 跳出当前循环
                }
            }
            if (entities.length == 1) {
                if (state == 0) {
                    $('#medicineTitle').text("更改考勤信息");//设置模态框标题
                    $("#medicineForm input[type='reset']").click();//重置表单
                    $("#bedModel1").modal();//弹出模态窗体
                    $('#medicineForm [name="InsertAndUpdate"]').val(2);//设置为修改
                    $('#aduitdiv').attr("hidden", true);
                    $('#name').attr("disabled", true);
                    $('#workernumber').attr("disabled", true);
                    $('#sickleave').attr("disabled", false);
                    $('#thingsfake').attr("disabled", false);
                    $('#usuallyovertime').attr("disabled", false);
                    $('#weekly').attr("disabled", false);
                    $('#overtimeonholidays').attr("disabled", false);
                    $('#latearrivals').attr("disabled", false);
                    $('#earlyarrivals').attr("disabled", false);
                    $('#absences').attr("disabled", false);
                    $('#travelallowanceday').attr("disabled", false);
                    //获取勾选的数据
                    for (var i = 0; entities.length > i; i++) {
                        var workerid = entities[i].workerid;
                        var attendanceid = entities[i].attendanceid;
                        var workernumber = entities[i].workernumber;
                        var name = entities[i].name;
                        var card = entities[i].card;
                        var post = entities[i].post;
                        var department = entities[i].department;
                        var sickleave = entities[i].sickleave;
                        var thingsfake = entities[i].thingsfake;
                        var usuallyovertime = entities[i].usuallyovertime;
                        var weekly = entities[i].weekly;
                        var overtimeonholidays = entities[i].overtimeonholidays;
                        var latearrivals = entities[i].latearrivals;
                        var earlyarrivals = entities[i].earlyarrivals;
                        var absences = entities[i].absences;
                        var travelallowanceday = entities[i].travelallowanceday;
                        var attendancetime = entities[i].attendancetime;
                    }
                    $('#medicineForm [ID="attendanceid"]').val(attendanceid);
                    $('#medicineForm [ID="workerid"]').val(workerid);
                    $('#medicineForm [ID="workernumber"]').val(workernumber);
                    $('#medicineForm [ID="name"]').val(name);
                    $('#medicineForm [ID="card"]').val(card);
                    $('#medicineForm [ID="post"]').val(post);
                    $('#medicineForm [ID="department"]').val(department);
                    $('#medicineForm [ID="sickleave"]').val(sickleave);
                    $('#medicineForm [ID="thingsfake"]').val(thingsfake);
                    $('#medicineForm [ID="usuallyovertime"]').val(usuallyovertime);
                    $('#medicineForm [ID="weekly"]').val(weekly);
                    $('#medicineForm [ID="overtimeonholidays"]').val(overtimeonholidays);
                    $('#medicineForm [ID="latearrivals"]').val(latearrivals);
                    $('#medicineForm [ID="earlyarrivals"]').val(earlyarrivals);
                    $('#medicineForm [ID="absences"]').val(absences);
                    $('#medicineForm [ID="travelallowanceday"]').val(travelallowanceday);
                    $('#medicineForm [ID="attendancetime"]').val(attendancetime);
                } else {
                    layer.open({
                        title: '提示',
                        content: '请选择待审核考勤状态下的考勤信息进行修改操作 !',
                        icon: 0,
                        anim: 6, //0-6的动画形式，-1不开启
                    });
                }
            } else {
                layer.open({
                    title: '提示',
                    content: '请勾选一条考勤信息进行修改操作 !',
                    icon: 0,
                    anim: 6, //0-6的动画形式，-1不开启
                });
            }
        });
        //审核
        $('#audit').click(function () {
            var checkStatus1 = table.checkStatus('Table');
            console.log("输出checkStatus1---" + checkStatus1);
            var entities = checkStatus1.data;
            for (var i = 0; entities.length > i; i++) {//获取勾选的数据
                console.log(entities[i].state);
                var state = entities[i].state;
                if (state == "1" || state == "2") {
                    break;// 跳出当前循环
                }
            }
            if (entities.length == 1) {
                if (state == 0) {
                    $('#medicineTitle').text("审核考勤信息");//设置模态框标题
                    $("#medicineForm input[type='reset']").click();//重置表单
                    $("#bedModel1").modal();//弹出模态窗体
                    $('#medicineForm [name="InsertAndUpdate"]').val(3);//设置为修改
                    $('#aduitdiv').attr("hidden", false);
                    $('#name').attr("disabled", true);
                    $('#workernumber').attr("disabled", true);
                    $('#sickleave').attr("disabled", true);
                    $('#thingsfake').attr("disabled", true);
                    $('#usuallyovertime').attr("disabled", true);
                    $('#weekly').attr("disabled", true);
                    $('#overtimeonholidays').attr("disabled", true);
                    $('#latearrivals').attr("disabled", true);
                    $('#earlyarrivals').attr("disabled", true);
                    $('#absences').attr("disabled", true);
                    $('#travelallowanceday').attr("disabled", true);
                    //获取勾选的数据
                    for (var i = 0; entities.length > i; i++) {
                        var workerid = entities[i].workerid;
                        var attendanceid = entities[i].attendanceid;
                        var workernumber = entities[i].workernumber;
                        var name = entities[i].name;
                        var card = entities[i].card;
                        var post = entities[i].post;
                        var department = entities[i].department;
                        var sickleave = entities[i].sickleave;
                        var thingsfake = entities[i].thingsfake;
                        var usuallyovertime = entities[i].usuallyovertime;
                        var weekly = entities[i].weekly;
                        var overtimeonholidays = entities[i].overtimeonholidays;
                        var latearrivals = entities[i].latearrivals;
                        var earlyarrivals = entities[i].earlyarrivals;
                        var absences = entities[i].absences;
                        var travelallowanceday = entities[i].travelallowanceday;
                        var attendancetime = entities[i].attendancetime;
                    }
                    $('#medicineForm [ID="attendanceid"]').val(attendanceid);
                    $('#medicineForm [ID="workerid"]').val(workerid);
                    $('#medicineForm [ID="workernumber"]').val(workernumber);
                    $('#medicineForm [ID="name"]').val(name);
                    $('#medicineForm [ID="card"]').val(card);
                    $('#medicineForm [ID="post"]').val(post);
                    $('#medicineForm [ID="department"]').val(department);
                    $('#medicineForm [ID="sickleave"]').val(sickleave);
                    $('#medicineForm [ID="thingsfake"]').val(thingsfake);
                    $('#medicineForm [ID="usuallyovertime"]').val(usuallyovertime);
                    $('#medicineForm [ID="weekly"]').val(weekly);
                    $('#medicineForm [ID="overtimeonholidays"]').val(overtimeonholidays);
                    $('#medicineForm [ID="latearrivals"]').val(latearrivals);
                    $('#medicineForm [ID="earlyarrivals"]').val(earlyarrivals);
                    $('#medicineForm [ID="absences"]').val(absences);
                    $('#medicineForm [ID="travelallowanceday"]').val(travelallowanceday);
                    $('#medicineForm [ID="attendancetime"]').val(attendancetime);
                } else {
                    layer.open({
                        title: '提示',
                        content: '请勾选一条待审核考勤状态下的考勤信息进行审核操作 !',
                        icon: 0,
                        anim: 6, //0-6的动画形式，-1不开启
                    });
                }
            } else {
                layer.open({
                    title: '提示',
                    content: '请勾选一条考勤信息进行审核操作 !',
                    icon: 0,
                    anim: 6, //0-6的动画形式，-1不开启
                });
            }
        });
        //提交新增数据或修改数据或审核
        $('#insertworker').click(function () {
            //判断是新增 还是修改
            var InsertAndUpdate = $('#medicineForm [name="InsertAndUpdate"]').val();
            //获取数据
            var workerid = $('#workerid').val();
            var workernumber = $('#workernumber').val();
            var name = $('#name').val();
            var card = $('#card').val();
            var post = $('#post').val();
            var department = $('#department').val();
            var sickleave = $('#sickleave').val();
            var thingsfake = $('#thingsfake').val();
            var usuallyovertime = $('#usuallyovertime').val();
            var weekly = $('#weekly').val();
            var overtimeonholidays = $('#overtimeonholidays').val();
            var latearrivals = $('#latearrivals').val();
            var earlyarrivals = $('#earlyarrivals').val();
            var absences = $('#absences').val();
            var travelallowanceday = $('#travelallowanceday').val();
            var attendancetime = $('#attendancetime').val();
            //数据验证
            if (workerid == "" || workernumber == "" || name == "" || card == "" || post == "" || department == "" || sickleave == "" || thingsfake == "" || usuallyovertime == "" || weekly == "" || overtimeonholidays == "" || latearrivals == "" || earlyarrivals == "" || absences == "" || travelallowanceday == "" || attendancetime == "") {
                layer.alert("数据未填写完整，请填写完整后再进行修改操作 !", {icon: 2, anim: 6,});
                return;
            }
            var url = "";
            if (InsertAndUpdate === "1") {//新增
                var state = "0";//状态
                url = '${ctx}/syse/add';
            } else if (InsertAndUpdate === "2") {//修改
                var attendanceid = $('#attendanceid').val();
                if (attendanceid === undefined || attendanceid === null || attendanceid === "") {
                    layer.alert("id获取异常!", {icon: 0,});
                    return;
                }
                url = '${ctx}/syse/edit';
            } else if (InsertAndUpdate === "3") {//审核
                var attendanceid = $('#attendanceid').val();
                var state = $("input[name='state']:checked").val();//审核状态
                if (attendanceid === undefined || attendanceid === null || attendanceid === "") {
                    layer.alert("id获取异常!", {icon: 0,anim: 6, });
                    return;
                }
                if (state === undefined || state === null || state === "") {
                    layer.alert("审核状态获取异常!", {icon: 0,anim: 6, });
                    return;
                }
                url = '${ctx}/syse/edit';
            } else{
                layer.alert("参数异常");
            }
            //表单提交
            var layerIndex = layer.load();//打开加载层
            $.post(url, {
                attendanceid: attendanceid,
                workerid: workerid,
                workernumber: workernumber,
                name: name,
                card: card,
                post: post,
                department: department,
                sickleave: sickleave,
                thingsfake: thingsfake,
                usuallyovertime: usuallyovertime,
                weekly: weekly,
                overtimeonholidays: overtimeonholidays,
                latearrivals: latearrivals,
                earlyarrivals: earlyarrivals,
                absences: absences,
                travelallowanceday: travelallowanceday,
                attendancetime: attendancetime,
                state: state,
            }, function (jsonMsg) {
                layer.close(layerIndex);//关闭加载层
                if (jsonMsg.state) {
                    if (InsertAndUpdate == "1") {
                        layer.open({
                            title: '提示',
                            content: '新增考勤成功"',
                            icon: 1,
                            anim: 4,
                            yes: function () {
                                layer.close(layer.index); //关闭特定层
                                $('#bedModel1').modal('hide');//关闭开嘱模态框
                                setTimeout(function () {
                                    table.reload('Table', {
                                        url: "/wage/syse/tablepage"
                                    });
                                }, 1000);//延迟
                            }
                        });
                    } else if (InsertAndUpdate == "2") {
                        layer.open({
                            title: '提示',
                            content: '修改考勤成功"',
                            icon: 1,
                            anim: 4,
                            yes: function () {
                                layer.close(layer.index); //关闭特定层
                                $('#bedModel1').modal('hide');//关闭开嘱模态框
                                setTimeout(function () {
                                    table.reload('Table', {
                                        url: "/wage/syse/tablepage"
                                    });
                                }, 1000);//延迟
                            }
                        });
                    } else if (InsertAndUpdate == "3") {
                        layer.open({
                            title: '提示',
                            content: '审核考勤成功"',
                            icon: 1,
                            anim: 4,
                            yes: function () {
                                layer.close(layer.index); //关闭特定层
                                $('#bedModel1').modal('hide');//关闭开嘱模态框
                                setTimeout(function () {
                                    table.reload('Table', {
                                        url: "/wage/syse/tablepage"
                                    });
                                }, 1000);//延迟
                            }
                        });
                    }
                } else {
                    layer.msg(jsonMsg.msg, {icon: 5});
                }
            }, 'json');
        });
        //姓名  失去焦点事件
        $("#name").blur(function (e) {
            var name = $("#name").val();
            //表单提交
            $.post('${ctx}/sysc/queryById', {
                name: name,
            }, function (jsonMsg) {
                if (jsonMsg.state) {
                    $("#workernumber").val(jsonMsg.data.workernumber);
                    $("#card").val(jsonMsg.data.card);
                    $("#post").val(jsonMsg.data.post);
                    $("#department").val(jsonMsg.data.department);
                    $("#workerid").val(jsonMsg.data.workerid);
                } else {
                    layer.alert("查询数据为空")
                    return;
                }
            }, 'json');
        });
        //工号  失去焦点事件
        $("#workernumber").blur(function (e) {
            var workernumber = $("#workernumber").val();
            //表单提交
            $.post('${ctx}/sysc/queryById', {
                workernumber: workernumber,
            }, function (jsonMsg) {
                if (jsonMsg.state) {
                    $("#name").val(jsonMsg.data.name);
                    $("#card").val(jsonMsg.data.card);
                    $("#post").val(jsonMsg.data.post);
                    $("#department").val(jsonMsg.data.department);
                    $("#workerid").val(jsonMsg.data.workerid);
                } else {
                    layer.alert("查询数据为空")
                    return;
                }
            }, 'json');
        });
        //点击刷新按钮，刷新页面
        $("#reload").click(function () {
            window.location.reload();//刷新页面
        });
        //鼠标样式
        $.shuicheMouse({
            type: 11,
            color: "rgba(187,67,128,1)"
        });
    });

</script>
</body>
</html>



