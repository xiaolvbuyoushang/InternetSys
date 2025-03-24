<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    // 获取上下文路径和基本路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>网络应急响应平台系统</title>
    <link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all"/>

    <!-- JavaScript函数定义 -->
    <script language="JavaScript" type="text/javascript">
        // 提示用户数据库中已存在该人员基本信息
        function tishi() {
            var a = confirm('数据库中保存有该人员基本信息，您可以修改或保留该信息。');
            if (a != true) return false;
            window.open("冲突页.htm", "", "depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
        }

        // 显示某个元素（假设用于显示错误信息）
        function check() {
            document.getElementById("aa").style.display = "";
        }

        // 提示保存成功并跳转到另一个页面
        function link() {
            alert('保存成功！');
            document.getElementById("fom").action = "xuqiumingxi.htm";
            document.getElementById("fom").submit();
        }

        // 处理表单提交逻辑
        function handleSubmit() {
            // 提交表单
            document.getElementById("fom").submit();

            // 显示保存成功的提示
            alert('保存成功！');

            // 重定向到首页
            window.location.href = "${pageContext.request.contextPath}/index.jsp";

            // 返回false以防止表单的默认提交行为
            return false;
        }
    </script>

    <!-- 自定义样式 -->
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
    <!-- 表单定义，包含漏洞添加页面 -->
    <form action="../TaskProcessServlet?flag=addTask" method="post" name="fom" id="fom" target="sypost" onsubmit="return handleSubmit()">
        <div class="MainDiv">
            <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
                <tr>
                    <th class="tablestyle_title">漏洞添加页面</th>
                </tr>
                <tr>
                    <td class="CPanel">
                        <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                            <tr>
                                <td align="left">
                                </td>
                            </tr>
                            <TR>
                                <TD width="100%">
                                    <fieldset style="height:100%;">
                                        <legend>添加漏洞</legend>
                                        <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
                                            <tr>
                                                <td nowrap align="right" width="13%">事件类型：</td>
                                                <td>
                                                    <select name="tasktype">
                                                        <option selected="selected">==请选择==</option>
                                                        <option>违处信息</option>
                                                        <option>网络攻击</option>
                                                        <option>恶意软件</option>
                                                        <option>信息泄露</option>
                                                        <option>安全威胁/漏洞</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td nowrap align="right">事件状态：</td>
                                                <td>
                                                    <select name="taskstatus">
                                                        <option selected="selected">0</option>
                                                        <option>0</option>
                                                        <option>1</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td nowrap align="right" width="13%">承办单位：</td>
                                                <td width="41%">
                                                    <input name="company" class="text" style="width:250px" type="text" size="40"/>
                                                    <span class="red"> *</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td nowrap align="right" height="120px">漏洞内容:</td>
                                                <td colspan="3">
                                                    <textarea id="textarea" name="content" rows="5" cols="80"></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">事件等级:</td>
                                                <td>
                                                    <select name="level">
                                                        <option selected="selected">==请选择==</option>
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                    </select>
                                                </td>
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
                        <!-- 保存按钮，点击时触发handleSubmit函数 -->
                        <button type="submit" class="button" onclick="">保存</button>
                        <!-- 返回按钮，点击时返回上一页 -->
                        <input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
                    </TD>
                </TR>
            </TABLE>
        </div>
    </form>
</body>
</html>
