<%@page import="model.TaskOne,tools.TypeSelect" %>
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
    function sousuo() {
        window.open("gaojisousuo.htm", "", "depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
    }

    function selectAll() {
        var obj = document.fom.elements;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].name == "delid") {
                obj[i].checked = true;
            }
        }
    }

    function unselectAll() {
        var obj = document.fom.elements;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].name == "delid") {
                if (obj[i].checked == true) obj[i].checked = false;
                else obj[i].checked = true;
            }
        }
    }

    function link() {
        document.getElementById("fom").action = "addrenwu.htm";
        document.getElementById("fom").submit();
    }

</SCRIPT>

<body>
<%
    String u = (String) session.getAttribute("myName");
    if (u == null) {
        //内置对象（request,response,out,session）
        response.sendRedirect("admin/login.jsp?err=1");
        return;
    }
%>

<%
    @SuppressWarnings("unchecked")
    ArrayList<TaskOne> al = (ArrayList<TaskOne>) request.getAttribute("result");
    int pageNow = Integer.parseInt((String) request.getAttribute("pageNow"));
    String flag = (String) request.getAttribute("flag");
    String s_page = (String) request.getAttribute("pageCount");
    int pageCount = Integer.parseInt(s_page);
    String taskStatus = "";
    TypeSelect select = new TypeSelect();
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">

    <tr>
        <td height="30">
            <form name="fom" id="fom" method="post" action="TaskProcessServlet?pageNow=1&flag=findTask2">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="62" background="images/nav04.gif">

                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="21"><img src="images/ico07.gif" width="20" height="18"/></td>
                                    <td width="538">查看内容：按时间：
                                        <input name="assigndate1" type="text" size="12"/>
                                        <span class="newfont06">至</span>
                                        <input name="assigndate2" type="text" size="12"/>
                                        <button name="submit" class="right-button02">查询</button>
                                    </td>
                                    <td width="144" align="left"><a href="#" onclick="sousuo()">
                                        <input name="submit" type="button" class="right-button07" value="高级搜索"/>
                                    </a></td>
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
                                <td height="20"><span class="newfont07">选择：<a href="#" class="right-font08"
                                                                              onclick="selectAll();">全选</a>-<a href="#"
                                                                                                               class="right-font08"
                                                                                                               onclick="unselectAll();">反选</a></span>
                                    <input name="Submit" type="button" class="right-button08" value="删除所选漏洞"/>
                                    <input name="Submit2" type="button" class="right-button08" value="添加漏洞"
                                           onclick="link();"/></td>
                            </tr>
                            <tr>
                                <td height="40" class="font42">
                                    <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                           class="newfont03">
                                        <tr class="CTitle">
                                            <td height="22" colspan="9" align="center" style="font-size:16px">漏洞列表</td>
                                        </tr>
                                        <tr bgcolor="#EEEEEE">
                                            <td width="4%" align="center" height="30">选择</td>
                                            <td width="10%">漏洞ID</td>
                                            <td width="10%">漏洞类型</td>
                                            <td width="10%">发布时间</td>
                                            <td width="10%">漏洞状态</td>
                                            <td width="20%">漏洞内容</td>
                                            <td width="10%">单位ID</td>
                                            <td width="10%">漏洞等级</td>
                                            <td width="12%">操作</td>
                                        </tr>
                                        <%
                                            for (int i = 0; i < al.size(); i++) {
                                                TaskOne ub = (TaskOne) al.get(i);
                                                taskStatus = select.statusChange(ub.getStatus());
                                        %>
                                        <tr bgcolor="#FFFFFF">
                                            <td height="20"><input type="checkbox" name="delid"/></td>
                                            <td><%= ub.getTaskID()%>
                                            </td>
                                            <td><%= ub.getTaskType()%>
                                            </td>
                                            <td><%= ub.getAssignDate()%>
                                            </td>
                                            <td><%= taskStatus%>
                                            </td>
                                            <td><%= ub.getContent()%>
                                            </td>
                                            <td><%= ub.getCompanyID()%>
                                            </td>
                                            <td><%= ub.getLevel() %>
                                            </td>
                                            <td><a href="userfiles/feedback.jsp?taskid=<%=ub.getTaskID()%>">反馈</a></td>
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
                                            <td width="50%">共 <span class="right-text09"><%=pageCount %></span> 页 | 第
                                                <span class="right-text09"><%=pageNow %></span> 页
                                            </td>
                                            <td width="49%" align="right">
                                                [<a href="TaskProcessServlet?flag=fenye&pageNow=<%=1 %>"
                                                    class="right-font08">首页</a> |
                                                <a href="TaskProcessServlet?flag=fenye&pageNow=<%=pageNow-1 %>"
                                                   class="right-font08">上一页</a> |
                                                <a href="TaskProcessServlet?flag=fenye&pageNow=<%=pageNow-1 %>"
                                                   class="right-font08">下一页</a> |
                                                <a href="TaskProcessServlet?flag=fenye&pageNow=<%=pageCount %>"
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
</table>
</body>
</html>
