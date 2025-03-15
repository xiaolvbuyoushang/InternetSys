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
    <link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all"/>


    <script language="JavaScript" type="text/javascript">
        function tishi() {
            var a = confirm('数据库中保存有该人员基本信息，您可以修改或保留该信息。');
            if (a != true) return false;
            window.open("冲突页.htm", "", "depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
        }

        function check() {
            document.getElementById("aa").style.display = "";
        }


        function link() {
            alert('保存成功！');
            document.getElementById("fom").action = "xuqiumingxi.htm";
            document.getElementById("fom").submit();
        }


    </script>
    <style type="text/css">
        <!--
        .atten {
            font-size: 12px;
            font-weight: normal;
            color: #F00;
        }

        -->
    </style>
</head>

<body class="ContentBody">


<form action="../UserProcessServlet?flag=addUser" method="post" name="fom" id="fom" target="sypost">
    <div class="MainDiv">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title">用户添加页面</th>
            </tr>
            <tr>
                <td class="CPanel">

                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                        <tr>
                            <td align="left">
                                <input type="button" name="Submit" value="保存" class="button" onclick="alert('保存成功！');"/>　

                                <input type="button" name="Submit2" value="返回" class="button"
                                       onclick="window.history.go(-1);"/>
                            </td>
                        </tr>
                        <tr align="center">
                            <td class="TablePanel">
                            </td>
                        </tr>
                        <tr align="center">
                            <td></td>
                        </tr>
                        <TR>
                            <TD width="100%">
                                <fieldset style="height:100%;">
                                    <legend>用户信息</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
                                        <tr>
                                            <td nowrap align="right" width="13%">用户姓名：</td>
                                            <td width="46%"><input name="name" class="text" style="width:300px"
                                                                   type="text" size="40"/>
                                                <span class="red"> *</span></td>
                                            <td align="right" width="9%"></td>
                                            <td width="32%">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" width="13%">手机号码：</td>
                                            <td width="46%"><input name="phone" class="text" style="width:300px"
                                                                   type="text" size="40"/>
                                                <span class="red"> *</span></td>
                                            <td align="right" width="9%"></td>
                                            <td width="32%">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" width="13%">单位名称：</td>
                                            <td width="46%"><input name="comname" class="text" style="width:300px"
                                                                   type="text" size="40"/>
                                                <span class="red"> *</span></td>
                                            <td align="right" width="9%"></td>
                                            <td width="32%">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">登录权限：</td>
                                            <td><select name="status">
                                                <option selected="selected">1</option>
                                                <option>0</option>
                                                <option>1</option>
                                            </select></td>
                                        </tr>
                                        <tr>
                                            <td align="right">用户级别：</td>
                                            <td><select name="level">
                                                <option selected="selected">==请选择==</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                            </select></td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" width="13%">用户密码：</td>
                                            <td width="46%"><input name="password" class="text" style="width:300px"
                                                                   type="text" size="40"/>
                                                <span class="red"> *</span></td>
                                            <td align="right" width="9%"></td>
                                            <td width="32%">&nbsp;</td>
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
                    <!-- <input type="button" name="Submit" value="保存" class="button" onclick=""/>　 -->
                    <button type="submit" class="button" onclick="">添加</button>
                    <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
                </TD>
            </TR>
        </TABLE>
    </div>
</form>
</body>
</html>
