<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>网络应急响应平台系统</title>
</head>
<%
    String name = (String) request.getSession().getAttribute("myName");
%>
<frameset rows="59,*" cols="*" frameborder="no" border="0" framespacing="0">
    <frame src="adminfiles/top.jsp?uanme=<%=name %>" name="topFrame" scrolling="No" noresize="noresize" id="topFrame"
           title="topFrame"/>
    <frameset cols="213,*" frameborder="no" border="0" framespacing="0">
        <frame src="adminfiles/left.jsp" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame"
               title="leftFrame"/>
        <frame src="adminfiles/mainfra.jsp" name="mainFrame" id="mainFrame" title="mainFrame"/>
    </frameset>
</frameset>
<noframes>
    <body>
    </body>
</noframes>
</html>

