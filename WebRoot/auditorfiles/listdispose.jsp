<%@page import="model.Dispose" %>
<%@page import="tools.TypeSelect" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    // 获取应用的上下文路径
    String path = request.getContextPath();
    // 构建完整的URL路径
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>网络应急响应平台系统 - 漏洞处置记录</title>
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
    <script type="text/JavaScript">

    </script>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<SCRIPT language=JavaScript>
    // 打开高级搜索页面
    function sousuo() {
        window.open("gaojisousuo.htm", "", "depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
    }

    // 全选复选框
    function selectAll() {
        var obj = document.fom.elements;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].name == "delid") {
                obj[i].checked = true;
            }
        }
    }

    // 反选复选框
    function unselectAll() {
        var obj = document.fom.elements;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].name == "delid") {
                if (obj[i].checked == true) obj[i].checked = false;
                else obj[i].checked = true;
            }
        }
    }

    // 跳转到添加处置页面
    function link() {
        document.getElementById("fom").action = "adddispose.htm";
        document.getElementById("fom").submit();
    }

</SCRIPT>

<body>
<%
    // 检查用户是否登录，如果没有登录则重定向到登录页面
    String u = (String) session.getAttribute("myName");
    if (u == null) {
        // 内置对象（request, response, out, session）
        response.sendRedirect("login.jsp?err=1");
        return;
    }
%>

<%
    // 获取从Servlet传递过来的处置记录列表、当前页码、总页数等信息
    @SuppressWarnings("unchecked")
    List<Dispose> al = (List<Dispose>) request.getAttribute("result");
    int pageNow = Integer.parseInt((String) request.getAttribute("pageNow"));
    String s_page = (String) request.getAttribute("pageCount");
    int pageCount = Integer.parseInt(s_page);
    TypeSelect select = new TypeSelect();
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="30">
            <!-- 查询表单 -->
            <form name="fom" id="fom" method="post" action="DisposeServlet?pageNow=1&flag=findDispose">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="62" background="images/nav04.gif">
                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="24"><img src="images/ico07.gif" width="20" height="18"/></td>
                                    <td width="519">查看内容：按任务ID：
                                        <input name="taskId" type="text" size="12"/>
                                        <button type="submit" class="right-button02" onclick="">查询</button>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td>
            <table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="20">
                                    <span class="newfont07">
                                        选择：
                                        <a href="#" class="right-font08" onclick="selectAll();">全选</a>-
                                        <a href="#" class="right-font08" onclick="unselectAll();">反选</a>
                                    </span>
                                    <input name="Submit" type="button" class="right-button08" value="删除所选记录"/>
                                    <input name="Submit2" type="button" class="right-button08" value="添加处置" onclick="link();"/>
                                </td>
                            </tr>
                            <tr>
                                <td height="40" class="font42">
                                    <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
                                        <tr class="CTitle">
                                            <td height="22" colspan="9" align="center" style="font-size:16px">漏洞处置记录</td>
                                        </tr>
                                        <tr bgcolor="#EEEEEE">
                                            <td width="4%" align="center" height="30">选择</td>
                                            <td width="10%">记录ID</td>
                                            <td width="10%">任务ID</td>
                                            <td width="15%">处置时间</td>
                                            <td width="15%">处置状态</td>
                                            <td width="20%">处置依据</td>
                                            <td width="10%">处置人员ID</td>
                                            <td width="12%">操作</td>
                                        </tr>
                                        <%
                                            // 遍历处置记录列表并显示每个记录的信息
                                            for (int i = 0; i < al.size(); i++) {
                                                Dispose dispose = (Dispose) al.get(i);
                                        %>
                                        <tr bgcolor="#FFFFFF">
                                            <td height="20"><input type="checkbox" name="delid"/></td>
                                            <td><%= dispose.getId()%></td>
                                            <td><%= dispose.getTaskid()%></td>
                                            <td><%= dispose.getDisposeTime()%></td>
                                            <td><%= dispose.getDisposeStatus()%></td>
                                            <td><%= dispose.getBasis()%></td>
                                            <td><%= dispose.getAuditorID()%></td>
                                            <td><a href="#">删除</a></td>
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
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
                                        <tr>
                                            <td width="50%">
                                                共 <span class="right-text09"><%=pageCount %></span> 页 | 第
                                                <span class="right-text09"><%=pageNow %></span> 页
                                            </td>
                                            <td width="49%" align="right">
                                                [
                                                <a href="DisposeServlet?flag=fenye&pageNow=<%=1 %>" class="right-font08">首页</a> |
                                                <a href="DisposeServlet?flag=fenye&pageNow=<%=pageNow-1 %>" class="right-font08">上一页</a> |
                                                <a href="DisposeServlet?flag=fenye&pageNow=<%=pageNow+1 %>" class="right-font08">下一页</a> |
                                                <a href="DisposeServlet?flag=fenye&pageNow=<%=pageCount %>" class="right-font08">末页</a>
                                                ]
                                                转至：
                                            </td>
                                            <td width="1%">
                                                <table width="20" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="1%"><input name="textfield3" type="text" class="right-textfield03" size="1"/></td>
                                                        <td width="87%"><input name="Submit23222" type="submit" class="right-button06" value=" "/></td>
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
