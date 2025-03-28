<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>操作结果</title>
    <script language="JavaScript" type="text/javascript">
        function showResult() {
            var message = "${message}";
            var redirectUrl = "${redirectUrl}";

            // 显示提示信息
            alert(message);

            // 三秒后跳转到指定页面
            setTimeout(function() {
                window.location.href = redirectUrl;
            }, 3000);
        }
    </script>
</head>
<body onload="showResult()">
</body>
</html>
