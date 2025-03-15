<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>项目管理系统 by www.nongfuit.com</title>
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
<%
    String name = request.getParameter("companyName");
    name = new String(name.getBytes("iso-8859-1"), "utf-8");

%>
<form action="../CompanyProcessServlet?flag=updateCom" method="post" name="fom" id="fom" target="sypost">
    <div class="MainDiv">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title">单位信息修改页面</th>
            </tr>
            <tr>
                <td class="CPanel">

                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                        <tr>
                            <td align="left">

                            </td>
                        </tr>


                        <tr align="center">
                            <td class="TablePanel"><select name="select5">
                                <option>市级单位</option>
                                <option>市级各辖区单位</option>
                                <option>受监管企业单位</option>
                                <option>安全服务单位</option>
                            </select></td>
                        </tr>


                        <TR>
                            <TD width="100%">
                                <fieldset style="height:100%;">
                                    <legend>单位信息</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
                                        <tr>
                                            <td nowrap align="right" width="13%">单位ID:</td>
                                            <td width="46%"><input name="id" class="text"
                                                                   value="<%=request.getParameter("companyId") %>"
                                                                   style="width:300px" type="text" size="40"/>
                                                <span class="red"> *</span></td>
                                            <td align="right" width="9%"></td>
                                            <td width="32%">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" width="13%">单位名称:</td>
                                            <td width="46%"><input name="name" class="text" value="<%=name %>"
                                                                   style="width:300px" type="text" size="40"/>
                                                <span class="red"> *</span></td>
                                            <td align="right" width="9%"></td>
                                            <td width="32%">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" width="13%">单位地址:</td>
                                            <td width="46%"><input name="phone" class="text"
                                                                   value="<%=request.getParameter("address") %>"
                                                                   style="width:300px" type="text" size="40"/>
                                                <span class="red"> *</span></td>
                                            <td align="right" width="9%"></td>
                                            <td width="32%">&nbsp;</td>
                                        </tr>

                                        <tr>


                                            <td align="right">所属类型:</td>
                                            <td><select name="companytype">
                                                <option selected="selected">==请选择==</option>
                                                <option>市级单位</option>
                                                <option>市级各辖区单位</option>
                                                <option>受监管企业单位</option>
                                                <option>安全服务单位</option>
                                            </select></td>
                                        </tr>

                                        <tr>
                                            <td nowrap align="right" width="13%">单位联系人:</td>
                                            <td width="40%"><input name="status" class="text"
                                                                   value="<%=request.getParameter("monName") %>"<%=request.getParameter("monName") %>
                                                                   style="width:300px" type="text" size="40"/>
                                                <span class="red"> *</span></td>
                                            <td align="right" width="9%"></td>
                                            <td width="32%">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" width="13%">联系人电话:</td>
                                            <td width="40%"><input name="password" class="text" style="width:300px"
                                                                   type="text" size="40"
                                                                   value="<%=request.getParameter("cellphone") %>">
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
                    <button type="submit" onclick="">修改</button>

                    <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
                </TD>
            </TR>
        </TABLE>
    </div>
</form>
</body>
</html>
