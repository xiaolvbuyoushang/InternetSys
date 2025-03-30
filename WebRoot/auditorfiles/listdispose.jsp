<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="model.Dispose" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>网络应急响应平台系统 - 处置记录列表</title>
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
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

        -->
    </style>
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<SCRIPT language=JavaScript>
    function deleteRecord(taskId) {
        // 添加删除记录的逻辑
        if (confirm("确定要删除该记录吗？")) {
            window.location.href = "DisposeServlet?flag=deleteDispose&taskid=" + taskId;
        }
    }

    function updateDispose(taskId) {
        window.location.href = "auditorfiles/updateDispose.jsp?taskid=" + taskId;
    }
</SCRIPT>

<body>
<%
    String u = (String) session.getAttribute("myName");
    if (u == null) {
        response.sendRedirect("admin/login.jsp?err=1");
        return;
    }
%>

<%
    @SuppressWarnings("unchecked")
    List<Dispose> result = (List<Dispose>) request.getAttribute("result");
    int pageNow = Integer.parseInt((String) request.getAttribute("pageNow"));
    String s_page = (String) request.getAttribute("pageCount");
    int pageCount = Integer.parseInt(s_page);
%>

<c:if test="${not empty result}">
    <c:set var="filteredResult" value="${result}" />
    <c:remove var="filteredResult" />
    <c:forEach var="dispose" items="${result}">
        <c:if test="${dispose.status == '1'}">
            <c:set var="filteredResult" value="${filteredResult} ${dispose}" />
        </c:if>
    </c:forEach>
</c:if>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="30">
<%--            <form name="fom" id="fom" method="post" action="DisposeServlet?pageNow=1&flag=findDispose">--%>
<%--                <table width="100%" border="0" cellspacing="0" cellpadding="0">--%>
<%--                    <tr>--%>
<%--                        <td height="62" background="images/nav04.gif">--%>
<%--                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">--%>
<%--                                <tr>--%>
<%--                                    <td width="24"><img src="images/ico07.gif" width="20" height="18"/></td>--%>
<%--                                    <td width="519">查看内容：按漏洞审核状态：--%>
<%--                                        <input name="findDispose" type="text" size="12"/>--%>
<%--                                        <button type="submit" class="right-button02" onclick="">查询</button>--%>
<%--                                    </td>--%>
<%--                                    <td width="679" align="left">--%>
<%--                                        <a href="#" onclick="">--%>
<%--                                            <input name="Submit" type="button" class="right-button07" value="高级搜索"/>--%>
<%--                                        </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </table>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                </table>--%>
<%--            </form>--%>
        </td>
    </tr>
    <tr>
        <td>
            <table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="20"><span class="newfont07">选择：<a href="#" class="right-font08"
                                                                              onclick="selectAll();">全选</a>-<a href="#"
                                                                                                               class="right-font08"
                                                                                                               onclick="unselectAll();">反选</a></span>
<%--                                    <input name="Submit" type="button" class="right-button08" value="删除所选漏洞"/>--%>
<%--                                    <input name="Submit2" type="button" class="right-button08" value="添加漏洞"--%>
<%--                                           onclick="link();"/></td>--%>
                            </tr>
                            <tr>
                                <td height="40" class="font42">
                                    <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                           class="newfont03">
                                        <tr class="CTitle">
                                            <td height="22" colspan="10" align="center" style="font-size:16px">处置记录列表</td>
                                        </tr>
                                        <tr bgcolor="#EEEEEE">
                                            <td width="4%" align="center" height="30">选择</td>
                                            <td width="4%">漏洞ID</td>
                                            <td width="4%">漏洞类型</td>
                                            <td width="8%">发布时间</td>
                                            <td width="4%">审核状态</td>
                                            <td width="10%">审核意见</td>
                                            <td width="10%">漏洞内容</td>
                                            <td width="4%">处置人</td>
                                            <td width="4%">漏洞等级</td>
                                            <td width="8%">操作</td>
                                            <td width="10%">处置建议</td>
                                        </tr>
                                        <%
                                            for (Dispose dispose : result) {
                                        %>
                                        <tr bgcolor="#FFFFFF">
                                            <td height="20"><input type="checkbox" name="delid"/></td>
                                            <td><%= dispose.getTaskid() %></td>
                                            <td><%= dispose.getTaskType() %></td>
                                            <td><%= dispose.getAssignDate() %></td>
                                            <td><%= dispose.getStatus() %></td>
                                            <td><%= dispose.getAuditComment() %></td>
                                            <td><%= dispose.getVulnerabilityContent() %></td>
                                            <td><%= dispose.getAuditorID() %></td>
                                            <td><%= dispose.getLevel() %></td>
                                            <td>
<%--                                                <a href="javascript:deleteRecord('<%= dispose.getTaskid() %>')">删除</a>--%>
                                                <a href="javascript:updateDispose('<%= dispose.getTaskid() %>')">处置漏洞</a>
                                            </td>
                                            <td><%= dispose.getBasis() %></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="6"><img src="images/spacer.gif" width="1" height="1"/></td>
                            </tr>
                            <tr>
                                <td height="33">
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
                                           class="right-font08">
                                        <tr>
                                            <td width="50%">共 <span class="right-text09"><%= pageCount %></span> 页 | 第
                                                <span class="right-text09"><%= pageNow %></span> 页
                                            </td>
                                            <td width="49%" align="right">
                                                [<a href="DisposeServlet?flag=fenye&pageNow=<%= 1 %>"
                                                    class="right-font08">首页</a> |
                                                <a href="DisposeServlet?flag=fenye&pageNow=<%= pageNow - 1 %>"
                                                   class="right-font08">上一页</a> |
                                                <a href="DisposeServlet?flag=fenye&pageNow=<%= pageNow + 1 %>"
                                                   class="right-font08">下一页</a> |
                                                <a href="DisposeServlet?flag=fenye&pageNow=<%= pageCount %>"
                                                   class="right-font08">末页</a>]
                                                转至：
                                            </td>
                                            <td width="1%">
                                                <table width="20" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="1%"><input name="textfield3" type="text"
                                                                              class="right-textfield03" size="1"/></td>
                                                        <td width="87%"><input name="Submit23222" type="submit"
                                                                               class="right-button06" value=" "/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
