<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    // 获取应用的上下文路径
    String path = request.getContextPath();
    // 构造基础URL路径，用于后续的页面引用
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    // 立即重定向到/html/index.php
    response.sendRedirect(path + "/WEB-INF/views/index.jsp");
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <%--    // 设置页面的基础URL路径--%>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
    <%--    // 禁止页面缓存，确保每次访问都是最新的数据--%>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <%--	// 设置页面的关键词，用于SEO优化--%>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <%--	// 设置页面的描述，用于SEO优化--%>
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<br><br><br><br>
<center>
    <%
        // 获取从其他页面或Servlet传递过来的信息
        String result = (String) request.getAttribute("info");


        // 输出欢迎信息
//    		out.println("Welcome: "+result);
//    		out.println("<br><br>");
//	    	// 输出管理用户的链接
//	    	out.println("<a href='UserProcessServlet?pageNow=1&flag=fenye'>管理用户</a><br>");
//	    	// 输出增加用户的链接
//	    	out.println("<a href='user/adduser.jsp'>增加用户</a><br>");
//	    	// 输出管理日志的链接
//	    	out.println("<a href='LogProcessServlet?pageNow=1&flag=fenye'>管理日志</a><br>");
//	    	// 输出管理事件的链接
//	    	out.println("<a href='TaskProcessServlet?pageNow=1&flag=fenye'>管理事件</a><br>");
//	    	// 输出管理单位的链接
//	    	out.println("<a href='CompanyProcessServlet?pageNow=1&flag=fenye'>管理单位</a><br>");

    %><br><br>
    <br>
</center>
</body>
</html>
