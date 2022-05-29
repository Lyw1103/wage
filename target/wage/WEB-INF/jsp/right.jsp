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
        <li><a href="#">员工管理</a></li>
        <li><a href="#">员工列表</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li id="insert" class="click toolbarli"><span><img src="${ctx}/static/images/t01.png"/></span>添加</li>
            <li id="update" class="click toolbarli"><span><img src="${ctx}/static/images/t02.png"/></span>修改</li>
            <li id="delete" class="toolbarli"><span><img src="${ctx}/static/images/t03.png"/></span>删除</li>
            <li id="dimission" class="toolbarli"><span><img src="${ctx}/static/images/ulist.png"/></span>离职</li>
            <li id="reload" class="toolbarli"><span><img src="${ctx}/static/images/dp.png"/></span>刷新</li>
        </ul>
        <div class="demoTable">
            <form class="form-horizontal" style="margin: 0px 0px 8px 1px;" role="form" id="doctorAdviceForm3">
                <div class="form-row h-left">
                    <div>
                        <label class="control-label lable-left">工号：</label>
                        <select class="form-control form-input3" id="workernumberselect" autocomplete="off">
                            <option value="">--请选择--</option>
                            <c:forEach items="${requestScope.worker}" var="workerelect1">
                                <option value="${workerelect1.workernumber}">${workerelect1.workernumber}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label class="control-label lable-left">姓名：</label>
                        <select class="form-control form-input3" id="nameselect" autocomplete="off">
                            <option value="">--请选择--</option>
                            <c:forEach items="${requestScope.worker}" var="workerelect2">
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
                                <option value="本科">本科</option>
                                <option value="研究生">研究生</option>
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
                            <label class="col-form-label text-right col-4">基本工资:</label>
                            <select class="form-control form-input3" id="basesalaryid" autocomplete="off">
                                <option value="">--请选择--</option>
                                <c:forEach items="${requestScope.basesalary}" var="attendance1">
                                    <option value="${attendance1.basesalaryid}">${attendance1.basesalary}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label class="col-form-label text-right col-4">入职日期:</label>
                            <input id="onboardingdate" type="text" autocomplete="off" class="form-control" disabled>
                        </div>
                        <div class="col" style="visibility: hidden">
                            <label class="col-form-label text-right col-4">岗位:</label>
                            <select class="form-control form-input3" id="B1" autocomplete="off"></select>
                        </div>
                        <div class="col" style="visibility: hidden">
                            <label class="col-form-label text-right col-4">部门:</label>
                            <select class="form-control form-input3" id="B2" autocomplete="off"></select>
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
            url: "/wage/sysc/tablepage",
            page: true,//开启分页
            loading: true, //请求数据时，是否显示loading
            limits: [10, 15, 20, 25, 30, 35, 40, 45, 50],
            limit: 10, //每页默认显示的数量
            skin: 'row', //表格风格
            toolbar: true, //仅开启工具栏，不显示左侧模板(筛选列、打印、导出)
            // toolbar: 'default', //让工具栏左侧显示默认的内置模板(添加、修改、删除)
            cols: [
                [
                    {type: 'radio', title: '选择', align: 'center', width: 80},
                    {type: 'numbers', title: '序号', align: 'center'},
                    {field: 'workernumber', title: '工号', align: 'center', width: 110},
                    {field: 'name', title: '姓名', align: 'center', width: 70},
                    {field: 'sex', title: '性别', align: 'center', width: 50},
                    {field: 'age', title: '年龄', align: 'center', width: 50},
                    {
                        field: 'birthday', title: '出生年月', align: 'center', width: 100, templet: function (rowData) {
                            var Day = new Date(rowData.birthday);
                            var year = Day.getFullYear();
                            var month = (Day.getMonth() + 1) < 10 ? ('0' + (Day.getMonth() + 1)) : (Day.getMonth() + 1);
                            var day = Day.getDate() < 10 ? ('0' + Day.getDate()) : Day.getDate();
                            var birthday = year + "-" + month + "-" + day;
                            return birthday;
                        }
                    },
                    {field: 'card', title: '身份证号', align: 'center', width: 155},
                    {field: 'nation', title: '民族', align: 'center', width: 60},
                    {field: 'address', title: '家庭地址', align: 'center', width: 220},
                    {field: 'degree', title: '学历', align: 'center', width: 60},
                    {field: 'phone', title: '电话', align: 'center', width: 105},
                    {field: 'emergencycontacts', title: '紧急联系人', align: 'center', width: 80},
                    {field: 'emergencycontactsphone', title: '紧急联系人电话', align: 'center', width: 105},
                    {field: 'post', title: '岗位', align: 'center', width: 110},
                    {field: 'department', title: '部门', align: 'center', width: 90},
                    {field: 'basesalary', title: '基本工资', align: 'center', width: 90},
                    {field: 'onboardingdate', title: '入职日期', align: 'center', width: 140},
                    {
                        field: 'isincumbency', title: '是否在职', align: 'center', width: 80, templet: function (rowData) {
                            if (rowData.isincumbency == 0) {
                                return "在职";
                            } else {
                                return "已离职";
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
        $('#insert').click(function () {
            $('#medicineTitle').text("新增员工信息");//设置模态框标题
            $("#medicineForm input[type='reset']").click();//重置表单
            $("#bedModel1").modal();//弹出模态窗体
            $('#medicineForm [name="InsertAndUpdate"]').val(1);//设置为新增

            var Day = new Date();
            var year = Day.getFullYear();
            var month = (Day.getMonth() + 1) < 10 ? ('0' + (Day.getMonth() + 1)) : (Day.getMonth() + 1);
            var day = Day.getDate() < 10 ? ('0' + Day.getDate()) : Day.getDate();
            var hour = Day.getHours() < 10 ? ('0' + Day.getHours()) : Day.getHours();
            var minute = Day.getMinutes() < 10 ? ('0' + Day.getMinutes()) : Day.getMinutes();
            var seconds = Day.getSeconds() < 10 ? ('0' + Day.getSeconds()) : Day.getSeconds();
            //随机生成四位数
            var randnum = rand(1000, 9999);

            function rand(min, max) {
                return Math.floor(Math.random() * (max - min)) + min;
            }
            var workernumber = String(year) + String(month) + String(day) + String(randnum);//工号:当天年月日拼接，再拼接随机生成的四位数
            $('#workernumber').val(workernumber);
            var onboardingdate = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + seconds;//入职日期
            $('#onboardingdate').val(onboardingdate);
        });
        //修改
        $('#update').click(function () {
            var checkStatus1 = table.checkStatus('Table');
            console.log("输出checkStatus1---" + checkStatus1);
            var entities = checkStatus1.data;
            for (var i = 0; entities.length > i; i++) {//获取勾选的数据
                console.log(entities[i].isincumbency);
                var isincumbency = entities[i].isincumbency;
                if (isincumbency == "1") {
                    break;// 跳出当前循环
                }
            }
            if (entities.length == 1) {
                if (isincumbency == 0) {
                    $('#medicineTitle').text("修改员工信息");//设置模态框标题
                    $("#medicineForm input[type='reset']").click();//重置表单
                    $("#bedModel1").modal();//弹出模态窗体
                    $('#medicineForm [name="InsertAndUpdate"]').val(2);//设置为新增
                    //获取勾选的数据
                    for (var i = 0; entities.length > i; i++) {
                        var workerid = entities[i].workerid;
                        var basesalaryid = entities[i].basesalaryid;
                        var workernumber = entities[i].workernumber;
                        var name = entities[i].name;
                        var card = entities[i].card;
                        var sex = entities[i].sex;
                        var age = entities[i].age;
                        var nation = entities[i].nation;
                        var address = entities[i].address;
                        var degree = entities[i].degree;
                        var phone = entities[i].phone;
                        var emergencycontacts = entities[i].emergencycontacts;
                        var emergencycontactsphone = entities[i].emergencycontactsphone;
                        var post = entities[i].post;
                        var department = entities[i].department;
                        var onboardingdate = entities[i].onboardingdate;
                        //生日
                        var Day = new Date(entities[i].birthday);
                        var year = Day.getFullYear();
                        var month = (Day.getMonth() + 1) < 10 ? ('0' + (Day.getMonth() + 1)) : (Day.getMonth() + 1);
                        var day = Day.getDate() < 10 ? ('0' + Day.getDate()) : Day.getDate();
                        var birthday = year + "-" + month + "-" + day;
                    }
                    $('#medicineForm [ID="workerid"]').val(workerid);
                    $('#medicineForm [ID="basesalaryid"]').val(basesalaryid);
                    $('#medicineForm [ID="workernumber"]').val(workernumber);
                    $('#medicineForm [ID="name"]').val(name);
                    $('#medicineForm [ID="card"]').val(card);
                    $('#medicineForm [ID="sex"]').val(sex);
                    $('#medicineForm [ID="age"]').val(age);
                    $('#medicineForm [ID="birthday"]').val(birthday);
                    $('#medicineForm [ID="nation"]').val(nation);
                    $('#medicineForm [ID="address"]').val(address);
                    $('#medicineForm [ID="degree"]').val(degree);
                    $('#medicineForm [ID="phone"]').val(phone);
                    $('#medicineForm [ID="emergencycontacts"]').val(emergencycontacts);
                    $('#medicineForm [ID="emergencycontactsphone"]').val(emergencycontactsphone);
                    $('#medicineForm [ID="post"]').val(post);
                    $('#medicineForm [ID="department"]').val(department);
                    $('#medicineForm [ID="onboardingdate"]').val(onboardingdate);
                } else {
                    layer.open({
                        title: '提示',
                        content: '该员工已离职，不允许对它进行修改 !',
                        icon: 0,
                        anim: 6, //0-6的动画形式，-1不开启
                    });
                }
            } else {
                layer.open({
                    title: '提示',
                    content: '请勾选一条员工信息进行修改操作 !',
                    icon: 0,
                    anim: 6, //0-6的动画形式，-1不开启
                });
            }
        });
        //离职
        $('#dimission').click(function () {
            var checkStatus1 = table.checkStatus('Table');
            console.log("输出checkStatus1---" + checkStatus1);
            var entities = checkStatus1.data;
            for (var i = 0; entities.length > i; i++) {//获取勾选的数据
                console.log(entities[i].isincumbency);
                var incumbency = entities[i].isincumbency;
                var workerid = entities[i].workerid;
                if (incumbency == "1") {
                    break;// 跳出当前循环
                }
            }
            if (entities.length == 1) {
                if (incumbency == 0) {
                    var isincumbency = 1;
                    layer.open({
                        title: '提示',
                        content: '你确定要对该员工进行离职操作么 ?',
                        icon: 0,
                        yes: function () {
                            //表单提交
                            var layerIndex = layer.load();//打开加载层
                            $.post('${ctx}/sysc/edit', {
                                workerid: workerid,
                                isincumbency: isincumbency,
                            }, function (jsonMsg) {
                                layer.close(layerIndex);//关闭加载层
                                if (jsonMsg.state) {
                                    layer.open({
                                        title: '提示',
                                        content: '离职成功 !"',
                                        icon: 1,
                                        anim: 4,
                                        yes: function () {
                                            layer.close(layer.index); //关闭特定层
                                            setTimeout(function () {
                                                table.reload('Table', {
                                                    url: "/wage/sysc/tablepage"
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
                        content: '请勾选在职状态的员工对它进行离职操作 ! ',
                        icon: 0,
                        anim: 6, //0-6的动画形式，-1不开启
                    });
                }
            } else {
                layer.open({
                    title: '提示',
                    content: '请勾选一条在职状态的员工信息进行离职操作 !',
                    icon: 0,
                    anim: 6, //0-6的动画形式，-1不开启
                });
            }
        });
        //删除
        $('#delete').click(function () {
            var checkStatus1 = table.checkStatus('Table');
            console.log("输出checkStatus1---" + checkStatus1);
            var entities = checkStatus1.data;
            for (var i = 0; entities.length > i; i++) {//获取勾选的数据
                console.log(entities[i].isincumbency);
                var isincumbency = entities[i].isincumbency;
                var workerid = entities[i].workerid;
                if (isincumbency == "0") {
                    break;// 跳出当前循环
                }
            }
            if (entities.length == 1) {
                if (isincumbency == 1) {
                    var status = 1;
                    layer.open({
                        title: '提示',
                        content: '你确定要删除该员工么 ?',
                        icon: 0,
                        yes: function () {
                            //表单提交
                            var layerIndex = layer.load();//打开加载层
                            $.post('${ctx}/sysc/edit', {
                                workerid: workerid,
                                status: status,
                            }, function (jsonMsg) {
                                layer.close(layerIndex);//关闭加载层
                                if (jsonMsg.state) {
                                    layer.open({
                                        title: '提示',
                                        content: '删除成功"',
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
                        }
                    });
                } else {
                    layer.open({
                        title: '提示',
                        content: '该员工是在职状态，不允许对它进行删除操作 ! ',
                        icon: 0,
                        anim: 6, //0-6的动画形式，-1不开启
                    });
                }
            } else {
                layer.open({
                    title: '提示',
                    content: '请勾选一条离职状态的员工信息进行删除操作 !',
                    icon: 0,
                    anim: 6, //0-6的动画形式，-1不开启
                });
            }
        });
        //提交新增数据或修改数据
        $('#insertworker').click(function () {
            //判断是新增 还是修改
            var InsertAndUpdate = $('#medicineForm [name="InsertAndUpdate"]').val();
            //获取数据
            var basesalaryid = $('#basesalaryid').val();//基本工资id
            var workernumber = $('#workernumber').val();//工号
            var name = $('#name').val();//姓名
            var card = $('#card').val();//身份证号
            var sex = $('#sex').val();//性别
            var age = $('#age').val();//年龄
            var birthday = $('#birthday').val();//出生年月
            var nation = $('#nation').val();//民族
            var address = $('#address').val();//家庭地址
            var degree = $('#degree').val();//学历
            var phone = $('#phone').val();//电话
            var emergencycontacts = $('#emergencycontacts').val();//紧急联系人
            var emergencycontactsphone = $('#emergencycontactsphone').val();//紧急联系人电话
            var post = $('#post').val();//岗位
            var department = $('#department').val();//部门
            var onboardingdate = $('#onboardingdate').val();//入职日期
            //数据验证
            if (basesalaryid == "" ||workernumber == "" || name == "" || card == "" || sex == "" || age == "" || birthday == "" || nation == "" || address == "" || degree == "" || phone == "" || emergencycontacts == "" || emergencycontactsphone == "" || post == "" || department == "" || onboardingdate == "") {
                layer.alert("数据未填写完整，请填写完整后再进行修改操作 !", {icon: 2, anim: 6,});
                return;
            }
            var url = "";
            if (InsertAndUpdate === "1") {//新增
                var isincumbency = "0";//在职状态
                var status = "0";//状态
                var salaryitemid = "1";//工资项id
                var issuestate = "0";//发放状态
                url = '${ctx}/sysc/add';
            } else if (InsertAndUpdate === "2") {//修改
                var workerid = $('#workerid').val();//入职日期
                if (workerid === undefined || workerid === null || workerid === "") {
                    layer.alert("id获取异常!", {icon: 0,});
                    return;
                }
                url = '${ctx}/sysc/edit';
            } else {
                layer.alert("参数异常");
            }
            //表单提交
            var layerIndex = layer.load();//打开加载层
            $.post(url, {
                basesalaryid: basesalaryid,
                workerid: workerid,
                salaryitemid: salaryitemid,
                workernumber: workernumber,
                name: name,
                card: card,
                sex: sex,
                age: age,
                birthday: birthday,
                nation: nation,
                address: address,
                degree: degree,
                phone: phone,
                emergencycontacts: emergencycontacts,
                emergencycontactsphone: emergencycontactsphone,
                post: post,
                department: department,
                onboardingdate: onboardingdate,
                isincumbency: isincumbency,
                status: status,
                issuestate: issuestate,
            }, function (jsonMsg) {
                layer.close(layerIndex);//关闭加载层
                if (jsonMsg.state) {
                    if (InsertAndUpdate == "1") {
                        layer.open({
                            title: '提示',
                            content: '新增成功"',
                            icon: 1,
                            anim: 4,
                            yes: function () {
                                layer.close(layer.index); //关闭特定层
                                $('#bedModel1').modal('hide');//关闭开嘱模态框
                                setTimeout(function () {
                                    table.reload('Table', {
                                        url: "/wage/sysc/tablepage"
                                    });
                                }, 1000);//延迟
                            }
                        });
                    } else if (InsertAndUpdate == "2") {
                        layer.open({
                            title: '提示',
                            content: '修改成功"',
                            icon: 1,
                            anim: 4,
                            yes: function () {
                                layer.close(layer.index); //关闭特定层
                                $('#bedModel1').modal('hide');//关闭开嘱模态框
                                setTimeout(function () {
                                    table.reload('Table', {
                                        url: "/wage/sysc/tablepage"
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
        //点击刷新按钮，刷新页面
        $("#reload").click(function () {
            window.location.reload();//刷新页面
        });
        //验证身份证，回填年龄，性别,生日
        $('#card').blur(function () {
            //调用验证身份证的方法,并去空格
            var card = idCardNo(($("#card").val()).trim());
            if (card == false) {
                layer.alert("身份证有误或未填写完整，请检查!", {icon: 2, anim: 6,});
                $('#card').val("");
                $('#sex').val("");
                $('#age').val("");
                $('#birthday').val("");
                return;
            }
            //回填出生日期
            var birthday = getBirth(($("#card").val()).trim());
            $('#birthday').val(birthday);
            //回填年龄
            var age = getAge(($("#card").val()).trim());
            $('#age').val(age);
            //回填性别
            var sex = getSex(($("#card").val()).trim());
            $('#sex').val(sex);
        });
        //选择民族下拉框
        getNation();
        //鼠标样式
        $.shuicheMouse({
            type: 11,
            color: "rgba(187,67,128,1)"
        });
    });
</script>
</body>
</html>



