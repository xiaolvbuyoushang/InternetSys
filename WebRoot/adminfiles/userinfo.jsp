<%@page import="tools.TypeSelect" %>
<%@page import="model.User" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    // 获取当前应用的上下文路径
    String path = request.getContextPath();
// 构建应用的基础路径
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

    <!-- 引入外部CSS样式文件 -->
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <script type="text/JavaScript">

    </script>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>

<SCRIPT language=JavaScript>
    // 确认删除提示函数
    function delcheck() {
        return window.confirm("您真的要删除吗？");
    }

    // 打开高级搜索页面函数
    function sousuo() {
        window.open("gaojisousuo.htm", "", "depended = 0, alwaysRaised = 1, width = 800, height = 510, location = 0, menubar = 0, resizable = 0, scrollbars = 0, status = 0, toolbar = 0");
    }

    // 全选函数
    function selectAll() {
        var obj = document.fom.elements;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].name == "delid") {
                obj[i].checked = true;
            }
        }
    }

    // 反选函数
    function unselectAll() {
        var obj = document.fom.elements;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].name == "delid") {
                if (obj[i].checked == true)
                    obj[i].checked = false;
                else
                    obj[i].checked = true;
            }
        }
    }

    // 表单提交到yuangong.htm的函数
    function link() {
        document.getElementById("fom").action = "yuangong.htm";
        document.getElementById("fom").submit();
    }
</SCRIPT>

<body>
<%
    // 获取当前页码
    int pageNow = Integer.parseInt((String) request.getAttribute("pageNow"));
    // 获取总页数字符串
    String s_page = (String) request.getAttribute("pageCount");
    // 将总页数字符串转换为整数
    int pageCount = Integer.parseInt(s_page);
    // 获取用户列表对象
    // 获取用户列表对象
    @SuppressWarnings("unchecked")
    ArrayList<User> al = (ArrayList<User>) request.getAttribute("result");
//    @SuppressWarnings("unchecked")
//    ArrayList<User> al = (ArrayList<User>) request.getAttribute("result");
    // 创建TypeSelect对象用于数据查询
    TypeSelect select = new TypeSelect();
    // 初始化公司类型、公司名称和用户权限字符串
    String companyType = "";
    String companyName = "";
    String grant = "";
%>

<!-- 搜索表单 -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="30">
            <form name="fom" id="fom" method="post" action="UserProcessServlet?pageNow=1&flag=findUser">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="62" background="images/nav04.gif">
                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="24"><img src="images/ico07.gif" width="20" height="18"/></td>
                                    <td width="519">查看内容：按单位名称：
                                        <input name="comNameCheck" type="text" size="12"/>
                                        <button type="submit" class="right-button02" onclick="">查询</button>
                                    </td>
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

    <!-- 用户信息操作区域 -->
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
                                    <input name="Submit" type="button" class="right-button08" value="删除所选人员信息"/>
                                    <input name="Submit" type="button" class="right-button08" value="添加人员信息"
                                           onclick=""/>
                                </td>
                            </tr>
                            <tr>
                                <td height="40" class="font42">
                                    <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                           class="newfont03">
                                        <tr>
                                            <td height="20" colspan="15" align="center" bgcolor="#EEEEEE"
                                                class="tablestyle_title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="6%" align="center" bgcolor="#EEEEEE">选择</td>
                                            <td width="9%" height="20" align="center" bgcolor="#EEEEEE">用户ID</td>
                                            <td width="9%" align="center" bgcolor="#EEEEEE">用户名</td>
                                            <td width="9%" align="center" bgcolor="#EEEEEE">手机号</td>
                                            <td width="9%" align="center" bgcolor="#EEEEEE">单位名称</td>
                                            <td width="10%" align="center" bgcolor="#EEEEEE">单位类型</td>
                                            <td width="4%" align="center" bgcolor="#EEEEEE">用户能否登录</td>
                                            <td width="4%" align="center" bgcolor="#EEEEEE">用户级别</td>
                                            <td width="11%" align="center" bgcolor="#EEEEEE">用户密码</td>
                                            <td width="6%" align="center" bgcolor="#EEEEEE">积分</td>
                                            <td width="6%" align="center" bgcolor="#EEEEEE">操作</td>
                                        </tr>
                                        <%
                                            // 定义交替行颜色数组
                                            String[] color = {"silver", "pink"};
                                            // 遍历用户列表
                                            for (int i = 0; i < al.size(); i++) {
                                                User ub = (User) al.get(i);
                                                // 根据用户的公司ID获取公司名称
                                                companyName = select.companyNameSelect(ub.getCompanyID());
                                                // 根据用户的公司ID获取公司类型
                                                companyType = select.companyTypeSelect(ub.getCompanyID());
                                                // 根据用户状态获取用户权限
                                                grant = select.userGrant(ub.getStatus());
                                        %>
                                        <tr bgcolor="<%=color[i % 2]%>">
                                            <td bgcolor="#FFFFFF"><input type="checkbox" name="delid"/></td>
                                            <td height="20" bgcolor="#FFFFFF"><%=ub.getUserID()%>
                                            </td>
                                            <td bgcolor="#FFFFFF"><%=ub.getUserName()%>
                                            </td>
                                            <td bgcolor="#FFFFFF"><%=ub.getPhone()%>
                                            </td>
                                            <td bgcolor="#FFFFFF"><%=companyName%>
                                            </td>
                                            <td bgcolor="#FFFFFF"><%=companyType%>
                                            </td>
                                            <td height="20" bgcolor="#FFFFFF"><%=grant%>
                                            </td>
                                            <td height="20" bgcolor="#FFFFFF"><%=ub.getLevel()%>
                                            </td>
                                            <td height="20" bgcolor="#FFFFFF"><%=ub.getUserPass()%>
                                            </td>
                                            <td height="20" bgcolor="#FFFFFF"><%=ub.getUserPoints()%>
                                            </td>
                                            <td bgcolor="#FFFFFF"><a
                                                    href="adminfiles/updateuser.jsp?userId=<%=ub.getUserID()%>&userName=<%=ub.getUserName()%>&phone=<%=ub.getPhone()%>&companyType=<%=ub.getCompanyID()%>&pass=<%=ub.getUserPass()%>&userStatus=<%=ub.getStatus()%>>">编辑</a>&nbsp;|
                                                &nbsp;<a href="onclick=\" return delcheck();\"
                                                href="UserProcessServlet?flag=delUser&userId=<%=ub.getUserID()%>">删除</a>&nbsp;
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

            <!-- 分页导航区域 -->
            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="6"><img src="images/spacer.gif" width="1" height="1"/></td>
                </tr>
                <tr>
                    <td height="33">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
                               class="right-font08">
                            <tr>
                                <td width="50%">共 <span class="right-text09"><%=pageCount%></span> 页 | 第 <span
                                        class="right-text09"><%=pageNow%></span> 页
                                </td>
                                <td width="49%" align="right">
                                    [<a href="UserProcessServlet?flag=fenye&pageNow=<%=1%>" class="right-font08">首页</a>
                                    |
                                    <a href="UserProcessServlet?flag=fenye&pageNow=<%=pageNow - 1%>"
                                       class="right-font08">上一页</a> |
                                    <a href="UserProcessServlet?flag=fenye&pageNow=<%=pageNow + 1%>"
                                       class="right-font08">下一页</a> |
                                    <a href="UserProcessServlet?flag=fenye&pageNow=<%=pageCount%>" class="right-font08">末页</a>]
                                    转至：
                                </td>
                                <td width="1%">
                                    <table width="20" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="1%"><input name="textfield3" type="text"
                                                                  class="right-textfield03" size="1"/></td>
                                            <td width="87%"><input name="Submit23222" type="submit"
                                                                   class="right-button06" value=" "/>
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