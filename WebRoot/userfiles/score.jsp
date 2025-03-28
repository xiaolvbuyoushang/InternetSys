<%@page import="tools.TypeSelect" %>
<%@page import="model.User" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    // 获取当前应用的上下文路径
    String path = request.getContextPath();
    // 构建应用的基础路径
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>网络应急响应平台系统</title>
    <style type="text/css">
        <!--
        body {
            margin: 0;
            padding: 0;
            font-family: 'Microsoft YaHei', 'Helvetica Neue', Arial, sans-serif;
            background: var(--bg-dark);
            color: var(--text-light);
            line-height: 1.6;
        }

        .tabfont01 {
            font-family: "宋体";
            font-size: 9px;
            color: #555555;
            text-decoration: none;
            text-align: center;
        }

        .font051 {
            font-family: "宋体";
            font-size: 12px;
            color: #333333;
            text-decoration: none;
            line-height: 20px;
        }

        .font201 {
            font-family: "宋体";
            font-size: 12px;
            color: #FF0000;
            text-decoration: none;
        }

        .button {
            font-family: "宋体";
            font-size: 14px;
            height: 37px;
        }

        html {
            overflow-x: auto;
            overflow-y: auto;
            border: 0;
        }

        /* 居中表格 */
        .table-container {
            display: flex;
            justify-content: center;
            margin-top: 50px;
        }

        /* 表格样式 */
        table {
            width: 95%;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--text-light);
        }

        th {
            background-color: var(--accent-blue);
            color: white;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        /* 页面标题样式 */
        .page-title {
            text-align: center;
            font-size: 24px;
            color: var(--accent-blue);
            margin-bottom: 20px;
        }
        -->
    </style>

    <!-- 引入外部CSS样式文件 -->
    <link href="../css/css.css" rel="stylesheet" type="text/css"/>
    <script type="text/JavaScript">

    </script>
    <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-blue: #0A1F3D; /* 腾讯深蓝主色 */
            --accent-blue: #007BFF; /* 强调蓝色 */
            --hover-blue: #0056b3; /* 悬停蓝色 */
            --text-light: #F0F4F8; /* 浅色文字 */
            --bg-dark: #0A1F3D; /* 深色背景 */
        }
    </style>
</head>

<SCRIPT language=JavaScript>
    // 确认删除提示函数
    function delcheck() {
        return window.confirm("您真的要删除吗？");
    }

    // 打开高级搜索页面函数
    function sousuo() {
        window.open("../gaojisousuo.htm", "", "depended = 0, alwaysRaised = 1, width = 800, height = 510, location = 0, menubar = 0, resizable = 0, scrollbars = 0, status = 0, toolbar = 0");
    }

    // 全选函数
    function selectAll() {
        var obj = document.fom.elements;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].name == "delid") {
                obj[i].checked = true;
            }
        }
    }

    // 反选函数
    function unselectAll() {
        var obj = document.fom.elements;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].name == "delid") {
                if (obj[i].checked == true)
                    obj[i].checked = false;
                else
                    obj[i].checked = true;
            }
        }
    }

    // 表单提交到yuangong.htm的函数
    function link() {
        document.getElementById("fom").action = "../yuangong.htm";
        document.getElementById("fom").submit();
    }
</SCRIPT>

<body>
<%
    // 创建UserPro对象
    BeanProcess.UserPro userPro = new BeanProcess.UserPro();

    // 获取所有用户列表对象
    ArrayList<User> al = userPro.getAllUsers();
    if (al == null) {
        al = new ArrayList<User>(); // 设置默认值为空列表
    }

    // 按积分排序
    Collections.sort(al, new Comparator<User>() {
        public int compare(User u1, User u2) {
            return Integer.compare(u2.getUserPoints(), u1.getUserPoints());
        }
    });

    // 创建TypeSelect对象用于数据查询
    TypeSelect select = new TypeSelect();
%>

<!-- 页面标题 -->
<div class="page-title">
    用户积分排行榜
</div>

<!-- 表格容器 -->
<div class="table-container">
    <table>
        <thead>
            <tr>
                <th>排名</th>
                <th>用户ID</th>
                <th>用户名</th>
                <th>积分</th>
            </tr>
        </thead>
        <tbody>
            <%
                // 遍历用户列表
                for (int i = 0; i < al.size(); i++) {
                    User ub = (User) al.get(i);
            %>
            <tr>
                <td><%=i + 1%></td>
                <td><%=ub.getUserID()%></td>
                <td><%=ub.getUserName()%></td>
                <td><%=ub.getUserPoints()%></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
</body>

</html>
