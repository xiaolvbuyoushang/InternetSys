<%@page import="model.Company" %>
<%@page import="tools.TypeSelect" %>
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
    function delcheck() {
        return window.confirm("您真的要删除吗？");
    }

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
        document.getElementById("fom").action = "xiangmu.htm";
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
    ArrayList<Company> al = (ArrayList<Company>) request.getAttribute("result");
    int pageNow = Integer.parseInt((String) request.getAttribute("pageNow"));
    String flag = (String) request.getAttribute("flag");
    String s_page = (String) request.getAttribute("pageCount");
    int pageCount = Integer.parseInt(s_page);
    TypeSelect select = new TypeSelect();
    String companyType = "";
    System.out.println("al size test: " + al.size());
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">

    <tr>
        <td height="30">
            <form name="fom" id="fom" method="post" action="CompanyProcessServlet?pageNow=1&flag=findCom">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="62" background="images/nav04.gif">

                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">

                                <tr>
                                    <td width="24"><img src="images/ico07.gif" width="20" height="18"/></td>
                                    <td width="519">查看内容：按单位类型：

                                        <input name="comTypeCheck" type="text" size="12"/>
                                        <button type="submit" class="right-button02" onclick="">查询</button>

                                    <td width="679" align="left"><a href="#" onclick="">
                                        <input name="Submit" type="button" class="right-button07" value="高级搜索"/>
                                    </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                                <td height="20"><span class="newfont07">选择：<a href="#" class="right-font08"
                                                                              onclick="selectAll();">全选</a>-<a href="#"
                                                                                                               class="right-font08"
                                                                                                               onclick="unselectAll();">反选</a></span>
                                    <!--       <input name="Submit" type="button" class="right-button08" value="删除所选项目信息" />
                                          <input name="Submit2" type="button" class="right-button08" value="添加项目" onclick="link();"/></td>  -->
                            </tr>
                            <tr>
                                <td height="40" class="font42">
                                    <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                           class="newfont03">

                                        <tr>
                                            <td height="20" colspan="13" align="center" bgcolor="#EEEEEE"
                                                class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                单位信息列表 &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="4%" align="center" bgcolor="#EEEEEE">选择</td>
                                            <td width="12%" height="20" align="center" bgcolor="#EEEEEE">单位ID</td>
                                            <td width="20%" align="center" bgcolor="#EEEEEE">单位名称</td>
                                            <td width="9%" align="center" bgcolor="#EEEEEE">单位地址</td>
                                            <td width="10%" align="center" bgcolor="#EEEEEE">单位类型</td>
                                            <td width="9%" align="center" bgcolor="#EEEEEE">单位负责人</td>
                                            <td width="7%" align="center" bgcolor="#EEEEEE">负责人联系方式</td>
                                            <td width="22%" align="center" bgcolor="#EEEEEE">操作</td>
                                        </tr>
                                        <%
                                            for (int i = 0; i < al.size(); i++) {
                                                Company ub = (Company) al.get(i);
                                                companyType = select.companyTypeSelect(ub.getCompanyID());
                                        %>
                                        <tr>
                                            <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
                                            <td bgcolor="#FFFFFF"><%=ub.getCompanyID()%>
                                            </td>
                                            <td bgcolor="#FFFFFF"><%=ub.getCompanyName()%>
                                            </td>
                                            <td bgcolor="#FFFFFF"><%=ub.getAddress()%>
                                            </td>
                                            <td bgcolor="#FFFFFF"><%=companyType%>
                                            </td>
                                            <td bgcolor="#FFFFFF"><%=ub.getMonitorName()%>
                                            </td>
                                            <td bgcolor="#FFFFFF"><%=ub.getPhone()%>
                                            </td>

                                            <td bgcolor="#FFFFFF"><a href="adminfiles/addcom.jsp">添加</a>|
                                                <a href="adminfiles/updatecom.jsp?companyId=<%=ub.getCompanyID()%>&companyName=<%=ub.getCompanyName()%>&address=<%=ub.getAddress()%>&typeid=<%=ub.getTypeID()%>&monName=<%=ub.getMonitorName()%>&cellphone=<%=ub.getPhone()%>>">编辑</a>|
                                                <a onclick="return delcheck();"
                                                   href="CompanyProcessServlet?flag=delCompany&companyId=<%=ub.getCompanyID() %>">删除</a>|

                                            </td>
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
                        <table width="100%" border="0" align="center" cellpadding="0"
                               cellspacing="0" class="right-font08">
                            <tr>
                                <td width="50%">
                                    共<span class="right-text09"><%=pageCount %></span>页|
                                    第<span class="right-text09"><%=pageNow %></span>页
                                </td>
                                <td width="49%" align="right">
                                    [<a href="CompanyProcessServlet?flag=fenye&pageNow=<%=1 %>"
                                        class="right-font08">首页</a> |
                                    <a href="CompanyProcessServlet?flag=fenye&pageNow=<%=pageNow-1 %>"
                                       class="right-font08">上一页</a> |
                                    <a href="CompanyProcessServlet?flag=fenye&pageNow=<%=pageNow+1 %>"
                                       class="right-font08">下一页</a> |
                                    <a href="CompanyProcessServlet?flag=fenye&pageNow=<%=pageCount %>"
                                       class="right-font08">末页</a>] 转至
                                </td>
                                <td width="1%">
                                    <table width="20" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="1%">
                                                <input name="textfield3" type="text" class="right-textfield03"
                                                       size="1"/>
                                            </td>
                                            <td width="87%">
                                                <input name="Submit23222" type="submit" class="right-button06"
                                                       value=" "/>
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
