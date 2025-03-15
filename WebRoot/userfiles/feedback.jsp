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
<form action="../FeedbackServlet?flag=addFeedback" method="post" name="fom" id="fom" target="sypost">
    <div class="MainDiv">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title">漏洞反馈页面</th>
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

                        <TR>
                            <TD width="100%">
                                <fieldset style="height:100%;">
                                    <legend>事件反馈</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">

                                        <tr>
                                            <td nowrap align="right" width="13%">事件ID：</td>
                                            <td width="41%"><input name="id" class="text" style="width:250px"
                                                                   type="text" size="40"
                                                                   value=<%=request.getParameter("taskid") %>>
                                                <span class="red"> *</span></td>

                                        </tr>

                                        <tr>
                                            <td nowrap align="right">事件类型：</td>
                                            <td><select name="tasktype">
                                                <option selected="selected">==请选择==</option>
                                                <option>违处信息</option>
                                                <option>网络攻击</option>
                                                <option>恶意软件</option>
                                                <option>信息泄露</option>
                                                <option>安全威胁/漏洞</option>
                                            </select></td>

                                        </tr>
                                        <tr>
                                            <td nowrap align="right" height="120px">反馈内容:</td>
                                            <td colspan="3"><textarea id="textarea" name="content" rows="5"
                                                                      cols="80"></textarea></td>
                                        </tr>

                                        <tr>
                                            <td nowrap align="right" width="13%">是否解决：</td>
                                            <td width="41%"><input name="fix" class="text" style="width:250px"
                                                                   type="text" size="40"/>
                                                <span class="red"> *</span></td>

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
                    <button type="submit" class="button" onclick="">保存</button>

                    <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
                </TD>
            </TR>
        </TABLE>

    </div>
</form>
</body>
</html>
