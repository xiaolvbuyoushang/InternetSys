<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>网络应急响应平台</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="assets/css/styles.min.css">
</head>

<body>
<script type="text/javascript">
    function checkinput() {
        name = document.getElementById("inputEmail");
        pass = document.getElementById("inputPassword");
        if (name != "" || pass != "") {
            //alert("用户名或密码错误");
            return false;
        }
        if (name != "Tom" || pass != "1001.") {
            alert("用户名或密码错误");
            return false;
        }
    }
</script>

<div class="login-card" style="background-color:lightcyan"><img src="assets/img/avatar_2x.png" class="profile-img-card">
    <p class="profile-name-card"></p>
    <form class="form-signin" action="LoginServlet" method="post"><span class="reauth-email"> </span>
        <center>
            <select id="userType" name="userType">
                <option value="1">管理员</option>
                <option value="2">用户</option>
            </select>
        </center>
        <br>
        <input class="form-control" type="text" required="" placeholder="Username" autofocus="" id="inputName"
               name="inputName">
        <input class="form-control" type="password" required="" placeholder="Password" id="inputPassword"
               name="inputPassword">
        <!--         <div class="checkbox">
                    <div class="checkbox"><label><input type="checkbox">Remember me</label></div>
        </div>-->
        <button class="btn btn-primary btn-block btn-lg btn-signin" type="submit" onclick="checkinput()">LOGIN</button>
    </form>
    <a href="#" class="forgot-password">Forgot your password?</a></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
