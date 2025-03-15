<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // 获取应用的上下文路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    // 处理跳转逻辑
    String redirect = request.getParameter("redirect");
    if ("login".equals(redirect)) {
        response.sendRedirect(path + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>系统首页</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <style>
        .nav-box {
            margin-top: 100px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 300px;
        }

        .nav-link {
            display: block;
            margin: 15px 0;
            padding: 10px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<div class="nav-box" align="center">
    <h3>系统功能导航</h3>
    <a href="<%=basePath%>/login.jsp" class="nav-link">登陆</a>
    <a href="UserProcessServlet?pageNow=1&flag=fenye" class="nav-link">用户管理</a>
    <a href="user/adduser.jsp" class="nav-link">新增用户</a>
    <a href="LogProcessServlet?pageNow=1&flag=fenye" class="nav-link">日志管理</a>
    <a href="TaskProcessServlet?pageNow=1&flag=fenye" class="nav-link">事件管理</a>
    <a href="CompanyProcessServlet?pageNow=1&flag=fenye" class="nav-link">资产管理</a>
</div>
</body>
</html>