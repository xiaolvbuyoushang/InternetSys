<%@page import="tools.TypeSelect" %>
<%@page import="model.Log" %>
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
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/xiangmu.js"></script>
</head>
<SCRIPT language=JavaScript>
    function getText() {
        document.pageTo.submit();
    }

    function sousuo() {
        window.open("#", "", "depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
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
        document.getElementById("fom").action = "sendxiaoxi.htm";
        document.getElementById("fom").submit();
    }

    function on_load() {
        var loadingmsg = document.getElementById("loadingmsg");
        var mainpage = document.getElementById("mainpage");
        loadingmsg.style.display = "";
        mainpage.style.display = "none";

        loadingmsg.style.display = "none";
        mainpage.style.display = "";
    }
</SCRIPT>

<body onload="on_load()">
<form name="fom" id="fom" method="post" action="LogProcessServlet?flag=fenye&pageNow=<%=1 %>">
    <table id="mainpage" width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
            <td height="30">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="62" background="images/nav04.gif">

                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="21"><img src="images/ico07.gif" width="20" height="18"/></td>
                                    <td width="550">查看内容：按用户名：
                                        <input name="textfield" type="text" size="12"/>
                                        <input name="Submit" type="button" class="right-button02" value="查询"/>
                                    </td>
                                    <td width="132" align="left"><a href="#" onclick="sousuo()">
                                        <input name="Submit" type="button" class="right-button07" value="高级搜索"/></a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
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
                                                                                  onclick="selectAll();">全选</a>-<a
                                            href="#" class="right-font08" onclick="unselectAll();">反选</a></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="40" class="font42">
                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                               class="newfont03">

                                            <tr>
                                                <td height="20" colspan="6" align="center" bgcolor="#EEEEEE"
                                                    class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    登录日志列表 &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="4%" align="center" bgcolor="#EEEEEE">选择</td>
                                                <td width="15%" height="20" align="center" bgcolor="#EEEEEE">日志ID</td>
                                                <td width="10%" align="center" bgcolor="#EEEEEE">用户ID</td>
                                                <td width="10%" align="center" bgcolor="#EEEEEE">登录时间</td>
                                                <td width="12%" align="center" bgcolor="#EEEEEE">操作</td>
                                            </tr>
                                            <%
                                                @SuppressWarnings("unchecked")
                                                ArrayList<Log> al = (ArrayList<Log>) request.getAttribute("result");
                                                int pageNow = Integer.parseInt((String) request.getAttribute("pageNow"));
                                                String flag = (String) request.getAttribute("flag");
                                                String s_page = (String) request.getAttribute("pageCount");
                                                int pageCount = Integer.parseInt(s_page);
                                                TypeSelect select = new TypeSelect();
                                                String userName = "";
                                                String[] color = {"silver", "pink"};
                                                for (int i = 0; i < al.size(); i++) {
                                                    Log ub = (Log) al.get(i);
                                                    userName = select.selectUserNameByUserID(ub.getUserID());
                                            %>
                                            <tr align="center" bgcolor="#FFFFFF">
                                                <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
                                                <td><%=ub.getLogID()%>
                                                </td>
                                                <td><%=userName%>
                                                </td>
                                                <td><%= ub.getLoginDate() %>
                                                </td>
                                                <td bgcolor="#FFFFFF"><a href="#s">删除|</a></td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </table>
                                    </td>
                                </tr>
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
                                    <td width="50%">共 <span class="right-text09"><%=pageCount %></span> 页 | 第 <span
                                            class="right-text09"><%=pageNow %></span> 页
                                    </td>
                                    <td width="49%" align="right">
                                        [<a href="LogProcessServlet?flag=fenye&pageNow=<%=1 %>"
                                            class="right-font08">首页</a> |
                                        <a href="LogProcessServlet?flag=fenye&pageNow=<%=pageNow-1 %>"
                                           class="right-font08">上一页</a> |
                                        <a href="LogProcessServlet?flag=fenye&pageNow=<%=pageNow+1 %>"
                                           class="right-font08">下一页</a> |
                                        <a href="LogProcessServlet?flag=fenye&pageNow=<%=pageCount %>"
                                           class="right-font08">末页</a>]
                                        转至：
                                    </td>
                                    <td width="1%">
                                        <table width="20" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="1%"><input name="pageTo" type="text"
                                                                      class="right-textfield03" size="1"/></td>
                                                <td width="87%"><input name="Submit23222" type="submit"
                                                                       class="right-button06" value=" "
                                                                       onclick="getText()"/>
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
</form>

<div id="loadingmsg" style="width:100px; height:18px; top:0px; display:none;">

</div>

</body>


</html>
