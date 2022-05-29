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
        <li><a href="#">基本工资维护</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li id="insert" class="click toolbarli"><span><img src="${ctx}/static/images/t01.png"/></span>新增基本工资</li>
            <li id="update" class="click toolbarli"><span><img src="${ctx}/static/images/t02.png"/></span>修改</li>
            <li id="reload" class="toolbarli"><span><img src="${ctx}/static/images/dp.png"/></span>刷新</li>
        </ul>
    </div>
    <table class="tablelist layui-table" lay-filter="Table" id="Table"></table>
</div>
<%--模态框--%>
<div class="modal fade" id="bedModel1" style="width: 500px;height: 500px;position: absolute;left: 600px;">
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
                        <div class="col" style="margin-left: -17px;">
                            <label class="col-form-label text-right col-4">基本工资:</label>
                            <input id="basesalary" type="text" autocomplete="off" class="form-control" style="width: 180px;">
                        </div>
                    </div>
                    <input id="basesalaryid" name="basesalaryid" type="hidden">
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
            url: "/wage/sysf/tablepage",
            page: true,//开启分页
            loading: true, //请求数据时，是否显示loading
            limits: [10, 15, 20, 25, 30, 35, 40, 45, 50],
            limit: 10, //每页默认显示的数量
            skin: 'row', //表格风格
            toolbar: true, //仅开启工具栏，不显示左侧模板(筛选列、打印、导出)
            // toolbar: 'default', //让工具栏左侧显示默认的内置模板(添加、修改、删除)
            cols: [
                [
                    {type: 'radio', title: '选择', align: 'center', width: 272},
                    {type: 'numbers', title: '序号', align: 'center', width: 272},
                    {field: 'basesalaryid', title: '基本工资类型', align: 'center', width: 600, templet: function (rowData) {
                            var basesalaryid=rowData.basesalaryid;
                            return "基本工资类型"+" - "+basesalaryid;
                        }
                    },
                    {field: 'basesalary', title: '基本工资', align: 'center', width: 600},
                ]
            ],
            page: false,   //是否开启分页
        });
        //新增
        $('#insert').click(function () {
            $('#medicineTitle').text("新增基本工资");//设置模态框标题
            $("#medicineForm input[type='reset']").click();//重置表单
            $("#bedModel1").modal();//弹出模态窗体
            $('#medicineForm [name="InsertAndUpdate"]').val(1);//设置为新增
        });
        //修改
        $('#update').click(function () {
            var checkStatus1 = table.checkStatus('Table');
            console.log("输出checkStatus1---" + checkStatus1);
            var entities = checkStatus1.data;
            if (entities.length == 1) {
                    $('#medicineTitle').text("更新基本工资");//设置模态框标题
                    $("#medicineForm input[type='reset']").click();//重置表单
                    $("#bedModel1").modal();//弹出模态窗体
                    $('#medicineForm [name="InsertAndUpdate"]').val(2);//设置为修改
                    //获取勾选的数据
                    for (var i = 0; entities.length > i; i++) {
                        var basesalaryid = entities[i].basesalaryid;
                        var basesalary = entities[i].basesalary;

                    }
                    $('#medicineForm [ID="basesalaryid"]').val(basesalaryid);
                    $('#medicineForm [ID="basesalary"]').val(basesalary);

            } else {
                layer.open({
                    title: '提示',
                    content: '请勾选一条数据进行更新操作 !',
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
            var basesalary = $('#basesalary').val();
            //数据验证
            if (basesalary == "") {
                layer.alert("数据未填写完整，请填写完整后再进行更新操作 !", {icon: 2, anim: 6,});
                return;
            }
            var url = "";
            if (InsertAndUpdate === "1") {//新增
                url = '${ctx}/sysf/add';
            } else if (InsertAndUpdate === "2") {//修改
                var basesalaryid = $('#basesalaryid').val();//入职日期
                if (basesalaryid === undefined || basesalaryid === null || basesalaryid === "") {
                    layer.alert("id获取异常!", {icon: 0,});
                    return;
                }
                url = '${ctx}/sysf/edit';
            } else {
                layer.alert("参数异常");
            }
            //表单提交
            var layerIndex = layer.load();//打开加载层
            $.post(url, {
                basesalaryid: basesalaryid,
                basesalary: basesalary,
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
                                        url: "/wage/sysf/tablepage"
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
                                        url: "/wage/sysf/tablepage"
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
        //鼠标样式
        $.shuicheMouse({
            type: 11,
            color: "rgba(187,67,128,1)"
        });
    });

</script>
</body>
</html>



