<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>网络应急响应平台系统 - 审核任务</title>
    <link rel="stylesheet" rev="stylesheet" href="css/style.css" type="text/css" media="all"/>

    <script language="JavaScript" type="text/javascript">
        function link() {
            alert('保存成功！');
            document.getElementById("fom").action = "updateAuditStatusServlet";
            document.getElementById("fom").submit();
        }
    </script>
    <style type="text/css">
        <!--
        .atten {
            font-size: 12px;
            font-weight: normal;
            color: #ff0000;
        }
        -->
    </style>
</head>

<body class="ContentBody">
<form name="fom" id="fom" method="post" onsubmit="link(); return false;">
    <div class="MainDiv">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title">任务审核页面</th>
            </tr>
            <tr>
                <td class="CPanel">
                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                        <tr>
                            <td align="left"></td>
                        </tr>
                        <TR>
                            <TD width="100%">
                                <fieldset style="height:100%;">
                                    <legend>审核任务</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
                                        <tr>
                                            <td nowrap align="right" width="13%">任务ID：</td>
                                            <td><input name="taskId" class="text" style="width:250px" type="text" size="40" value="${task.taskID}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right">审核状态：</td>
                                            <td><select name="auditStatus">
                                                <option selected="selected">==请选择==</option>
                                                <option value="0">待审核</option>
                                                <option value="1">通过</option>
                                                <option value="2">拒绝</option>
                                            </select></td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" height="120px">审核意见:</td>
                                            <td colspan="3"><textarea id="auditOpinion" name="auditOpinion" rows="5" cols="80"></textarea></td>
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
                    <button type="submit" class="button">保存</button>
                    <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
                </TD>
            </TR>
        </TABLE>
    </div>
</form>
</body>
</html>
