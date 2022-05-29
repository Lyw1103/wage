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
        <li><a href="#">首页</a></li>
        <li><a href="#">工资管理</a></li>
        <li><a href="#">工资详情</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li id="issue" class="click toolbarli"><span><img src="${ctx}/static/images/t02.png"/></span>发放</li>
            <li id="reload" class="toolbarli"><span><img src="${ctx}/static/images/dp.png"/></span>刷新</li>
        </ul>
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
                    <div class="form-group row">
                        <div class="col">
                            <label class="col-form-label text-right col-4">工号:</label>
                            <input id="workernumber" type="text" autocomplete="off" class="form-control" disabled>
                        </div>
                        <div class="col">
                            <label class="col-form-label text-right col-4">姓名:</label>
                            <input id="name" type="text" autocomplete="off" class="form-control">
                        </div>
                        <div class="col">
                            <label class="col-form-label text-right col-4">身份证号:</label>
                            <input id="card" type="text" autocomplete="off" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label class="col-form-label text-right col-4">性别:</label>
                            <input id="sex" type="text" autocomplete="off" class="form-control">
                        </div>
                        <div class="col">
                            <label class="col-form-label text-right col-4">年龄:</label>
                            <input id="age" type="text" autocomplete="off" class="form-control">
                        </div>
                        <div class="col">
                            <label class="col-form-label text-right col-4">出生年月:</label>
                            <input id="birthday" type="date" autocomplete="off" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label class="col-form-label text-right col-4">民族:</label>
                            <select class="form-control" id="nation">
                                <option selected value="">--请选择--</option>
                            </select>
                        </div>
                        <div class="col">
                            <label class="col-form-label text-right col-4">家庭地址:</label>
                            <input id="address" type="text" autocomplete="off" class="form-control">
                        </div>
                        <div class="col">
                            <label class="col-form-label text-right col-4">学历:</label>
                            <select class="form-control form-input3" id="degree" autocomplete="off">
                                <option value="">--请选择--</option>
                                <option value="小学">小学</option>
                                <option value="高中">高中</option>
                                <option value="大专">大专</option>
                                <option value="本科">开发部</option>
                                <option value="研究生">本科</option>
                                <option value="硕士">硕士</option>
                                <option value="博士">博士</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label class="col-form-label text-right col-4">电话:</label>
                            <input id="phone" type="text" autocomplete="off" class="form-control">
                        </div>
                        <div class="col">
                            <label class="col-form-label text-right col-4">紧急联系人:</label>
                            <input id="emergencycontacts" type="text" autocomplete="off" class="form-control">
                        </div>
                        <div class="col">
                            <label class="col-form-label text-right col-4">紧急联系人电话:</label>
                            <input id="emergencycontactsphone" type="text" autocomplete="off" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label class="col-form-label text-right col-4">岗位:</label>
                            <select class="form-control form-input3" id="post" autocomplete="off">
                                <option value="">--请选择--</option>
                                <option value="经理">经理</option>
                                <option value="副经理">副经理</option>
                                <option value="调研人员">调研人员</option>
                                <option value="营销人员">营销人员</option>
                                <option value="人事专员">人事专员</option>
                                <option value="财务">财务</option>
                            </select>
                        </div>
                        <div class="col">
                            <label class="col-form-label text-right col-4">部门:</label>
                            <select class="form-control form-input3" id="department" autocomplete="off">
                                <option value="">--请选择--</option>
                                <option value="开发部">开发部</option>
                                <option value="设计部">设计部</option>
                                <option value="市场部">市场部</option>
                                <option value="营销部">营销部</option>
                                <option value="人事部">人事部</option>
                            </select>
                        </div>
                        <div class="col">
                            <label class="col-form-label text-right col-4">入职日期:</label>
                            <input id="onboardingdate" type="text" autocomplete="off" class="form-control" disabled>
                        </div>
                    </div>
                    <input id="workerid" name="workerid" type="hidden">
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
            url: "/wage/sysc/wagespage",
            page: true,//开启分页
            loading: true, //请求数据时，是否显示loading
            limits: [10, 15, 20, 25, 30, 35, 40, 45, 50],
            limit: 10, //每页默认显示的数量
            skin: 'row', //表格风格
            toolbar: true, //仅开启工具栏，不显示左侧模板(筛选列、打印、导出)
            // toolbar: 'default', //让工具栏左侧显示默认的内置模板(添加、修改、删除)
            cols: [
                [//标题栏  // colspan即横跨的单元格数，这种情况下不用设置field和width   //rowspan即纵向跨越的单元格数,这种情况下不用设置field和width
                    {align: 'center', title: '员工信息', colspan: 6},
                    {align: 'center', title: '工资类型', colspan: 2},
                    {align: 'center', title: '补贴', colspan: 3},
                    {align: 'center', title: '加班工资', colspan: 2},
                    {align: 'center', title: '奖罚金', colspan: 3},
                    {align: 'center', title: '实发工资', colspan:2},
                ],
                [
                    {type: 'radio', title: '选择', align: 'center', width: 80},
                    {type: 'numbers', title: '序号', align: 'center'},
                    {field: 'workernumber', title: '工号', align: 'center', width: 110},
                    {field: 'name', title: '姓名', align: 'center', width: 70},
                    {field: 'card', title: '身份证号', align: 'center', width: 155},
                    {field: 'post', title: '岗位', align: 'center', width: 110},
                    {field: 'payable', title: '应发工资', align: 'center', width: 100,templet: function (rowData) {
                            var basesalary=rowData.basesalary;//基本工资
                            var foodandbeveragesubsidies=rowData.foodandbeveragesubsidies;//餐饮补贴
                            var transportationsubsidies=rowData.transportationsubsidies;//交通补贴
                            var travelallowanceday=rowData.travelallowanceday;//出差天数
                            var travelallowance=rowData.travelallowance;//出差补贴
                            var usuallyovertime=rowData.usuallyovertime;//平时加班(小时)
                            var overtimworkrates=rowData.overtimworkrates;//平时加班工价(元)
                            var weekly=rowData.weekly;//周末加班(小时)
                            var weekendovertimerates=rowData.weekendovertimerates;//周末加班工价(元)
                            var sickleave=rowData.sickleave;//病假
                            var thingsfake=rowData.thingsfake;//事假
                            var latearrivals=rowData.latearrivals;//迟到次数
                            var earlyarrivals=rowData.earlyarrivals;//早退次数
                            var absences=rowData.absences;//缺勤天数
                            var attendanceaward=rowData.attendanceaward;//全勤
                            if(sickleave==0||sickleave==""||thingsfake==0||thingsfake==""||latearrivals==0||latearrivals==""||earlyarrivals==0||earlyarrivals==""||absences==0||absences==""){
                                return parseInt(basesalary) + parseInt(foodandbeveragesubsidies) + parseInt(transportationsubsidies) + parseInt(travelallowanceday * travelallowance) + parseInt(usuallyovertime * overtimworkrates) + parseInt(weekly * weekendovertimerates) + parseInt(attendanceaward);
                            }else {
                                return parseInt(basesalary) + parseInt(foodandbeveragesubsidies) + parseInt(transportationsubsidies) + parseInt(travelallowanceday * travelallowance) + parseInt(usuallyovertime * overtimworkrates) + parseInt(weekly * weekendovertimerates);
                            }
                        }},
                    {field: 'basesalary', title: '基本工资', align: 'center', width: 100},
                    {field: 'foodandbeveragesubsidies', title: '餐饮', align: 'center', width: 80,templet: function (rowData) {
                            var foodandbeveragesubsidies=rowData.foodandbeveragesubsidies;//餐饮补贴
                            return foodandbeveragesubsidies;
                        }},
                    {field: 'transportationsubsidies', title: '交通', align: 'center', width: 80,templet: function (rowData) {
                            var transportationsubsidies=rowData.transportationsubsidies;//交通补贴
                                return transportationsubsidies;
                        }},
                    {field: 'travelallowance', title: '出差', align: 'center', width: 80,templet: function (rowData) {
                            var travelallowanceday=rowData.travelallowanceday;//出差天数
                            var travelallowance=rowData.travelallowance;//出差补贴
                            if(travelallowanceday==0||travelallowanceday==""){
                                return 0;
                            }else {
                                return travelallowanceday * travelallowance;
                            }
                        }},
                    {field: 'usuallyovertime', title: '平时加班', align: 'center', width: 100,templet: function (rowData) {
                            var usuallyovertime=rowData.usuallyovertime;//平时加班(小时)
                            var overtimworkrates=rowData.overtimworkrates;//平时加班工价(元)
                            return usuallyovertime * overtimworkrates;
                        }},
                    {field: 'department', title: '周末加班', align: 'center', width: 100,templet: function (rowData) {
                            var weekly=rowData.weekly;//周末加班(小时)
                            var weekendovertimerates=rowData.weekendovertimerates;//周末加班工价(元)
                            return weekly * weekendovertimerates;
                        }},
                    {field: 'attendanceaward', title: '全勤', align: 'center', width: 100,templet: function (rowData) {
                            var sickleave=rowData.sickleave;//病假
                            var thingsfake=rowData.thingsfake;//事假
                            var latearrivals=rowData.latearrivals;//迟到次数
                            var earlyarrivals=rowData.earlyarrivals;//早退次数
                            var absences=rowData.absences;//缺勤天数
                            var attendanceaward=rowData.attendanceaward;//全勤
                            if(sickleave==0||sickleave==""||thingsfake==0||thingsfake==""||latearrivals==0||latearrivals==""||earlyarrivals==0||earlyarrivals==""||absences==0||absences==""){
                                return attendanceaward;
                            }else {
                                return 0;
                            }
                        }},
                    {field: 'latearrivalpenalty', title: '迟到罚金', align: 'center', width: 100,templet: function (rowData) {
                            var latearrivals=rowData.latearrivals;//迟到次数
                            var latearrivalpenalty=rowData.latearrivalpenalty;//迟到罚金
                            if(latearrivals==0||latearrivals==""){
                               return 0;
                            }else {
                                return latearrivals * latearrivalpenalty;
                            }
                        }},
                    {field: 'earlyrefundpenalty', title: '早退罚金', align: 'center', width: 100,templet: function (rowData) {
                            var earlyarrivals=rowData.earlyarrivals;//早退次数
                            var earlyrefundpenalty=rowData.earlyrefundpenalty;//早退罚金
                            if(earlyarrivals==0||earlyarrivals==""){
                                return 0;
                            }else {
                                return earlyarrivals * earlyrefundpenalty;
                            }
                        }},
                    {field: 'basesalary', title: '实发工资', align: 'center', width: 120,templet: function (rowData) {
                            var basesalary=rowData.basesalary;//基本工资
                            var foodandbeveragesubsidies=rowData.foodandbeveragesubsidies;//餐饮补贴
                            var transportationsubsidies=rowData.transportationsubsidies;//交通补贴
                            var travelallowanceday=rowData.travelallowanceday;//出差天数
                            var travelallowance=rowData.travelallowance;//出差补贴
                            var usuallyovertime=rowData.usuallyovertime;//平时加班(小时)
                            var overtimworkrates=rowData.overtimworkrates;//平时加班工价(元)
                            var weekly=rowData.weekly;//周末加班(小时)
                            var weekendovertimerates=rowData.weekendovertimerates;//周末加班工价(元)
                            var sickleave=rowData.sickleave;//病假
                            var thingsfake=rowData.thingsfake;//事假
                            var latearrivals=rowData.latearrivals;//迟到次数
                            var latearrivalpenalty=rowData.latearrivalpenalty;//迟到罚金
                            var earlyarrivals=rowData.earlyarrivals;//早退次数
                            var earlyrefundpenalty=rowData.earlyrefundpenalty;//早退罚金
                            var absences=rowData.absences;//缺勤天数
                            var attendanceaward=rowData.attendanceaward;//全勤
                            if(sickleave==0||sickleave==""||thingsfake==0||thingsfake==""||latearrivals==0||latearrivals==""||earlyarrivals==0||earlyarrivals==""||absences==0||absences==""){
                                return parseInt(basesalary) + parseInt(foodandbeveragesubsidies) + parseInt(transportationsubsidies) + parseInt(travelallowanceday * travelallowance) + parseInt(usuallyovertime * overtimworkrates) + parseInt(weekly * weekendovertimerates) + parseInt(attendanceaward) + parseInt(latearrivals * latearrivalpenalty) + parseInt(earlyarrivals * earlyrefundpenalty);
                            }else {
                                return parseInt(basesalary) + parseInt(foodandbeveragesubsidies) + parseInt(transportationsubsidies) + parseInt(travelallowanceday * travelallowance) + parseInt(usuallyovertime * overtimworkrates) + parseInt(weekly * weekendovertimerates) + parseInt(latearrivals * latearrivalpenalty) + parseInt(earlyarrivals * earlyrefundpenalty);
                            }
                        }},
                    {field: 'issuestate', title: '发放状态', align: 'center', width: 100,templet: function (rowData) {
                            if(rowData.issuestate==0){
                                return "未发";
                            }else {
                                return "已发";
                            }
                        }},
                ]
            ],
            page: false,   //是否开启分页
        });
        //修改
        $('#issue').click(function () {
            var checkStatus1 = table.checkStatus('Table');
            console.log("输出checkStatus1---" + checkStatus1);
            var entities = checkStatus1.data;
            for (var i = 0; entities.length > i; i++) {//获取勾选的数据
                console.log(entities[i].isincumbency);
                var workerid = entities[i].workerid;
                var issue = entities[i].issuestate;
                if (issue == "1") {
                    break;// 跳出当前循环
                }
            }
            if(issue==0){
                if (entities.length == 1) {
                    layer.open({
                        title: '提示',
                        content: '你确定要对该员工进行发放工资操作吗 ?',
                        icon: 0,
                        yes: function () {
                            var issuestate = "1";
                            //数据验证
                            if (workerid == "") {
                                layer.alert("获取id异常 !", {icon: 2, anim: 6,});
                                return;
                            }
                            //表单提交
                            var layerIndex = layer.load();//打开加载层
                            $.post('${ctx}/sysc/edit', {
                                workerid: workerid,
                                issuestate: issuestate,
                            }, function (jsonMsg) {
                                layer.close(layerIndex);//关闭加载层
                                if (jsonMsg.state) {
                                    layer.open({
                                        title: '提示',
                                        content: '发放成功 !',
                                        icon: 1,
                                        anim: 4, //0-6的动画形式，-1不开启
                                        yes: function () {
                                            layer.close(layer.index); //关闭特定层
                                            setTimeout(function () {
                                                table.reload('Table', {
                                                    url: "/wage/sysc/wagespage"
                                                });
                                            }, 1000);//延迟
                                        }
                                    });
                                } else {
                                    layer.msg(jsonMsg.msg, {icon: 5});
                                }
                            }, 'json');
                        }
                    });
                } else {
                    layer.open({
                        title: '提示',
                        content: '请勾选数据 !',
                        icon: 0,
                        anim: 6, //0-6的动画形式，-1不开启
                    });
                }
            }else {
                layer.open({
                    title: '提示',
                    content: '请勾选一条未发状态的数据进行发放操作 !',
                    icon: 0,
                    anim: 6, //0-6的动画形式，-1不开启
                });
            }
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



