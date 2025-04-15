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
            background-image: url(../images/left.gif);
        }

        -->
    </style>
    <link href="../css/css.css" rel="stylesheet" type="text/css"/>
</head>
<SCRIPT language=JavaScript>
    function tupian(idt) {
        var nametu = "xiaotu" + idt;
        var tp = document.getElementById(nametu);
        tp.src = "../images/ico05.gif";//图片ico04为白色的正方形

        for (var i = 1; i < 30; i++) {

            var nametu2 = "xiaotu" + i;
            if (i != idt * 1) {
                var tp2 = document.getElementById('xiaotu' + i);
                if (tp2 != undefined) {
                    tp2.src = "../images/ico06.gif";
                }//图片ico06为蓝色的正方形
            }
        }
    }

    function list(idstr) {
        var name1 = "subtree" + idstr;
        var name2 = "img" + idstr;
        var objectobj = document.all(name1);
        var imgobj = document.all(name2);


        //alert(imgobj);
        if (objectobj.style.display == "none") {
            for (i = 1; i < 10; i++) {
                var name3 = "img" + i;
                var name = "subtree" + i;
                var o = document.all(name);
                if (o != undefined) {
                    o.style.display = "none";
                    var image = document.all(name3);
                    //alert(image);
                    image.src = "../images/ico04.gif";
                }
            }
            objectobj.style.display = "";
            imgobj.src = "../images/ico03.gif";
        } else {
            objectobj.style.display = "none";
            imgobj.src = "../images/ico04.gif";
        }
    }
</SCRIPT>
<body>
<%
    String name = (String) request.getSession().getAttribute("myName");
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
                                <td width="75%" height="22" class="left-font01">您好，<span
                                        class="left-font02"><%=name %></span></td>
                            </tr>
                            <tr>
                                <td height="22" class="left-font01">
                                    [&nbsp;<a href="../logout.jsp" target="_top" class="left-font01">退出</a>&nbsp;]
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <!--  漏洞系统开始    -->
            <TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
                <tr>
                    <td height="29">
                        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="8%"><img name="img8" id="img8" src="../images/ico04.gif" width="8"
                                                    height="11"/></td>
                                <td width="92%">
                                    <a href="javascript:" target="mainFrame" class="left-font03" onClick="list('8');">漏洞管理</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </TABLE>
            <table id="subtree8" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0"
                   cellspacing="0" class="left-table02">

                <tr>
                    <td width="9%" height="21"><img id="xiaotu21" src="../images/ico06.gif" width="8" height="12"/></td>
                    <td width="91%"><a href="../TaskProcessServlet?pageNow=1&flag=fenye" target="mainFrame"
                                       class="left-font03" onClick="tupian('21');">漏洞信息查看</a></td>
                </tr>
            </table>
            <!--  漏洞系统结束    -->


            <!-- 处置管理开始 -->
            <TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
                <tr>
                    <td height="29">
                        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="8%"><img name="img10" id="img10" src="../images/ico04.gif" width="8" height="11"/></td>
                                <td width="92%">
                                    <a href="javascript:" target="mainFrame" class="left-font03" onClick="list('10');">处置管理</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </TABLE>
            <table id="subtree10" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
                <tr>
                    <td width="9%" height="20"><img id="xiaotu26" src="../images/ico06.gif" width="8" height="12"/></td>
                    <td width="91%">
                        <a href="../DisposalProcessServlet?pageNow=1&flag=fenye" target="mainFrame" class="left-font03" onClick="tupian('26');">处置信息查看</a>
                    </td>
                </tr>
            </table>
            <!-- 处置管理结束 -->


            <TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
                <tr>
                    <td height="29">
                        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="8%"><img name="img1" id="img1" src="../images/ico04.gif" width="8"
                                                    height="11"/></td>
                                <td width="92%">
                                    <a href="javascript:" target="mainFrame" class="left-font03" onClick="list('1');">单位管理</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </TABLE>
            <table id="subtree1" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0"
                   cellspacing="0" class="left-table02">

                <tr>
                    <td width="9%" height="20"><img id="xiaotu7" src="../images/ico06.gif" width="8" height="12"/></td>
                    <td width="91%"><a href="../CompanyProcessServlet?pageNow=1&flag=fenye" target="mainFrame"
                                       class="left-font03" onClick="tupian('7');">单位信息查看</a></td>
                </tr>
            </table>
            <!--  项目系统结束    -->


            <!--  人员系统开始    -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
                <tr>
                    <td height="29">
                        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="8%" height="12"><img name="img3" id="img3" src="../images/ico04.gif"
                                                                width="8" height="11"/></td>
                                <td width="92%"><a href="javascript:" target="mainFrame" class="left-font03"
                                                   onClick="list('3');">用户管理</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <table id="subtree3" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0"
                   cellspacing="0" class="left-table02">
                <tr>
                    <td width="9%" height="20"><img id="xiaotu8" src="../images/ico06.gif" width="8" height="12"/></td>
                    <td width="91%"><a href="../UserProcessServlet?pageNow=1&flag=fenye" target="mainFrame"
                                       class="left-font03" onClick="tupian('8');">用户信息查看</a></td>
                </tr>
            </table>

            <!--  人员系统结束    -->


            <!-- 管理系统开始 -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
                <tr>
                    <td height="29">
                        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="8%"><img name="img5" id="img5" src="../images/ico04.gif" width="8"
                                                    height="11"/></td>
                                <td width="92%"><a href="javascript:" target="mainFrame" class="left-font03"
                                                   onClick="list('5');">系统管理</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <table id="subtree5" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0"
                   cellspacing="0" class="left-table02">
                <tr>
                    <td width="9%" height="20"><img id="xiaotu13" src="../images/ico06.gif" width="8" height="12"/></td>
                    <td width="91%"><a href="adduser.jsp" target="mainFrame" class="left-font03"
                                       onClick="tupian('13');">添加用户</a></td>
                </tr>
            </table>
            <!-- 管理系统结束-->

            <!--  日志系统开始    -->
            <TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
                <tr>
                    <td height="29">
                        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="8%"><img name="img7" id="img7" src="../images/ico04.gif" width="8"
                                                    height="11"/></td>
                                <td width="92%">
                                    <a href="javascript:" target="mainFrame" class="left-font03" onClick="list('7');">日志管理</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </TABLE>
            <table id="subtree7" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0"
                   cellspacing="0" class="left-table02">

                <tr>
                    <td width="9%" height="20"><img id="xiaotu24" src="../images/ico06.gif" width="8" height="12"/></td>
                    <td width="91%">
                        <a href="../LogProcessServlet?pageNow=1&flag=fenye" target="mainFrame" class="left-font03"
                           onClick="tupian('24');">日志信息列表
                        </a></td>
                </tr>
            </table>
            <!--  日志系统结束    -->


</table>
</body>
</html>
