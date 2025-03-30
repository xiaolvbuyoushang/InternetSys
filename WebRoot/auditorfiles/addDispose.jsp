<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>网络应急响应平台系统 - 添加漏洞处置</title>
    <link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all"/>
</head>

<body class="ContentBody">
<form name="disposeForm" id="disposeForm" method="post" action="../DisposeServlet?flag=addDispose">
    <div class="MainDiv">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title">添加漏洞处置页面</th>
            </tr>
            <tr>
                <td class="CPanel">
                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                        <tr>
                            <td align="left"></td>
                        </tr>
                        <TR>
                            <TD width="100%">
                                <fieldset style="height:100%;">
                                    <legend>添加漏洞处置</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
                                        <tr>
                                            <td nowrap align="right" width="13%">漏洞ID：</td>
                                            <td><input name="taskid" class="text" style="width:250px" type="text" size="40" required/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right">处置状态：</td>
                                            <td>
                                                <select name="disposeStatus" required>
                                                    <option value="">==请选择==</option>
                                                    <option value="pending">待处理</option>
                                                    <option value="processing">处理中</option>
                                                    <option value="resolved">已解决</option>
                                                    <option value="closed">已关闭</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right">处置人ID：</td>
                                            <td><input name="auditorID" class="text" style="width:250px" type="text" size="40" required/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" height="120px">处置依据:</td>
                                            <td colspan="3"><textarea id="basis" name="basis" rows="5" cols="80" required></textarea></td>
                                        </tr>
                                    </table>
                                    <br/>
                                </fieldset>
                            </TD>
                        </TR>
                    </TABLE>
                </td>
            </tr>
            <TR>
                <TD colspan="2" align="center" height="50px">
                    <button type="submit" class="button">保存</button>
                    <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
                </TD>
            </TR>
        </TABLE>
    </div>
</form>
</body>
</html>
