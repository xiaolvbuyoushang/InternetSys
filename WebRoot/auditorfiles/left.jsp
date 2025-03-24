<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!--
    定义页面语言为Java，并导入必要的Java类库。
    设置页面编码为UTF-8，确保中文显示正常。
-->

<%
    String path = request.getContextPath(); // 获取当前应用的上下文路径，例如 "/InternetSys"
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    // 拼接完整的基础路径，例如 "http://localhost:8080/InternetSys/"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- 设置网页字符集为UTF-8 -->
    <title>网络应急响应平台系统</title>
    <!-- 页面标题 -->
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-image: url(../images/left.gif); // 设置背景图片
        }
        -->
    </style>
    <!-- 定义页面样式 -->
    <link href="../css/css.css" rel="stylesheet" type="text/css"/>
    <!-- 引入外部CSS文件 -->
</head>

<SCRIPT language=JavaScript>
    function tupian(idt) {
        // 功能：切换选中项的图标状态
        var nametu = "xiaotu" + idt; // 根据ID生成对应的图片元素名称，例如 "xiaotu21"
        var tp = document.getElementById(nametu); // 获取对应图片元素
        tp.src = "../images/ico05.gif"; // 将选中项的图标设置为白色正方形

        for (var i = 1; i < 30; i++) { // 遍历所有可能的图标
            var nametu2 = "xiaotu" + i; // 生成当前图标的名称
            if (i != idt * 1) { // 如果不是当前选中项
                var tp2 = document.getElementById('xiaotu' + i); // 获取非选中项的图标
                if (tp2 != undefined) { // 如果图标存在
                    tp2.src = "../images/ico06.gif"; // 将非选中项的图标设置为蓝色正方形
                }
            }
        }
    }

    function list(idstr) {
        // 功能：展开或收起子菜单
        var name1 = "subtree" + idstr; // 根据ID生成子菜单的ID，例如 "subtree8"
        var name2 = "img" + idstr; // 根据ID生成菜单图标ID，例如 "img8"
        var objectobj = document.all(name1); // 获取子菜单元素
        var imgobj = document.all(name2); // 获取菜单图标元素

        if (objectobj.style.display == "none") { // 如果子菜单是隐藏状态
            for (i = 1; i < 10; i++) { // 遍历所有子菜单
                var name3 = "img" + i; // 生成当前菜单图标的ID
                var name = "subtree" + i; // 生成当前子菜单的ID
                var o = document.all(name); // 获取当前子菜单
                if (o != undefined) { // 如果子菜单存在
                    o.style.display = "none"; // 隐藏其他子菜单
                    var image = document.all(name3); // 获取当前菜单图标
                    image.src = "../images/ico04.gif"; // 将图标恢复为默认状态
                }
            }
            objectobj.style.display = ""; // 显示当前子菜单
            imgobj.src = "../images/ico03.gif"; // 将当前菜单图标设置为展开状态
        } else {
            objectobj.style.display = "none"; // 隐藏当前子菜单
            imgobj.src = "../images/ico04.gif"; // 将当前菜单图标恢复为默认状态
        }
    }
</SCRIPT>

<body>
<%
    String name = (String) request.getSession().getAttribute("myName");
    // 从会话中获取用户名称，用于显示在页面上
%>

<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
    <tr>
        <TD>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="207" height="55" background="../images/nav01.gif">
                        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="25%" rowspan="2"><img src="../images/ico02.gif" width="35" height="35"/></td>
                                <td width="75%" height="22" class="left-font01">您好，<span class="left-font02"><%=name %></span></td>
                                <!-- 显示用户名称 -->
                            </tr>
                            <tr>
                                <td height="22" class="left-font01">
                                    [&nbsp;<a href="../logout.jsp" target="_top" class="left-font01">退出</a>&nbsp;]
                                    <!-- 提供退出链接 -->
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <!-- 漏洞系统开始 -->
            <TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
                <tr>
                    <td height="29">
                        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8" height="11"/></td>
                                <td width="92%">
                                    <a href="javascript:" target="mainFrame" class="left-font03" onClick="list('8');">待审核漏洞</a>
                                    <!-- 点击后调用list函数，展开或收起子菜单 -->
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </TABLE>
            <table id="subtree8" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
                <tr>
                    <td width="9%" height="21"><img id="xiaotu21" src="../images/ico06.gif" width="8" height="12"/></td>
                    <td width="91%">
<%--                        <a href="../TaskOneServlet?pageNow=1&flag=upfenye&name=<%=name %>" target="mainFrame" class="left-font03" onClick="tupian('21');">待审核漏洞列表</a>--%>
                        <a href="../TaskProcessServlet?pageNow=1&flag=findrenwu&findrenwu=0" target="mainFrame" class="left-font03" onClick="tupian('24');">待审核漏洞查看</a>
                    </td>
                    <!-- 点击后调用tupian函数，切换图标状态 -->
                </tr>
            </table>


            <TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
                <tr>
                    <td height="29">
                        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="8%"><img name="img7" id="img7" src="../images/ico04.gif" width="8" height="11"/></td>
                                <td width="92%">
                                    <a href="javascript:" target="mainFrame" class="left-font03" onClick="list('7');">所有漏洞</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </TABLE>
            <table id="subtree7" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
                <tr>
                    <td width="9%" height="20"><img id="xiaotu24" src="../images/ico06.gif" width="8" height="12"/></td>
                    <td width="91%">
                        <a href="../TaskProcessServlet?pageNow=1&flag=fenye" target="mainFrame" class="left-font03" onClick="tupian('24');">所有漏洞查看</a>

<%--                        ../TaskOneServlet?pageNow=1&flag=downfenye&name=<%=name %> --%>
                    </td>
                </tr>
            </table>
            <!-- 漏洞系统结束 -->
        </TD>
    </tr>
</table>
</body>
</html>
