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
    <title>网络应急响应平台系统 - 颁奖台</title>
    <style type="text/css">
        <!--
        body {
            margin: 0;
            padding: 0;
            font-family: 'Microsoft YaHei', 'Helvetica Neue', Arial, sans-serif;
            background: var(--bg-dark);
            color: var(--text-light);
            line-height: 1.6;
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

        /* 居中容器 */
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background: url(https://images.unsplash.com/photo-1506318137071-0814f2c95f5d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80) no-repeat center center fixed;
            background-size: cover;
        }

        /* 页面标题样式 */
        .page-title {
            text-align: center;
            font-size: 36px;
            color: var(--accent-blue);
            margin-bottom: 40px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        /* 用户卡片容器 */
        .user-cards {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 40px;
        }

        /* 用户卡片样式 */
        .ranking-card {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .ranking-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
        }

        /* 奖牌样式 */
        .medal {
            position: relative;
            margin-bottom: 20px;
            font-size: 60px;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        /* 第一名样式 */
        .rank-1 {
            width: 300px;
            padding: 30px;
        }

        .rank-1 .medal {
            color: #FFD700; /* 金色 */
        }

        /* 第二名样式 */
        .rank-2 {
            width: 270px;
            padding: 27px;
        }

        .rank-2 .medal {
            color: #C0C0C0; /* 银色 */
        }

        /* 第三名样式 */
        .rank-3 {
            width: 250px;
            padding: 25px;
        }

        .rank-3 .medal {
            color: #CD7F32; /* 铜色 */
        }

        /* 第四名和第五名样式 */
        .rank-4, .rank-5 {
            width: 200px;
            padding: 20px;
        }

        .rank-4 .medal, .rank-5 .medal {
            color: #FFFFFF; /* 白色 */
        }

        /* 用户信息样式 */
        .name {
            font-size: 24px;
            color: var(--text-light);
            margin-bottom: 5px;
            font-family: 'Great Vibes', cursive; /* 艺术字字体 */
        }

        .points {
            font-size: 18px;
            color: var(--text-light);
        }

        /* 排列样式 */
        .row {
            display: flex;
            gap: 20px;
        }

        /* 动画效果 */
        @keyframes float {
            0% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
            100% {
                transform: translateY(0);
            }
        }
        -->
    </style>

    <!-- 引入外部CSS样式文件 -->
    <link href="../css/css.css" rel="stylesheet" type="text/css"/>
    <script type="text/JavaScript">

    </script>
    <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&display=swap" rel="stylesheet"> <!-- 艺术字字体 -->
    <style>
        :root {
            --primary-blue: #0A1F3D; /* 腾讯深蓝主色 */
            --accent-blue: #007BFF; /* 强调蓝色 */
            --hover-blue: #0056b3; /* 悬停蓝色 */
            --text-light: #F0F4F8; /* 浅色文字 */
            --bg-dark: #0A1F3D; /* 深色背景 */
        }
    </style>
</head>

<body>
<%
    // 创建UserPro对象
    BeanProcess.UserPro userPro = new BeanProcess.UserPro();

    // 获取所有用户列表对象
    ArrayList<User> al = userPro.getAllUsers();
    if (al == null) {
        al = new ArrayList<User>(); // 设置默认值为空列表
    }

    // 按积分排序
    Collections.sort(al, new Comparator<User>() {
        public int compare(User u1, User u2) {
            return Integer.compare(u2.getUserPoints(), u1.getUserPoints());
        }
    });

    // 取前五名用户
    ArrayList<User> topFiveUsers = new ArrayList<User>();
    if (al.size() > 5) {
        topFiveUsers = new ArrayList<User>(al.subList(0, 5));
    } else {
        topFiveUsers = al;
    }

    // 创建TypeSelect对象用于数据查询
    TypeSelect select = new TypeSelect();
%>

<!-- 容器 -->
<div class="container">
    <!-- 页面标题 -->
    <div class="page-title">
        颁奖台
    </div>

    <!-- 用户卡片容器 -->
    <div class="user-cards">
        <!-- 第一排 -->
        <div class="row">
            <%
                if (topFiveUsers.size() > 0) {
                    User ub = topFiveUsers.get(0);
            %>
            <div class="ranking-card rank-1">
                <div class="medal">
                    1
                </div>
                <div class="name"><%=ub.getUserName()%></div>
                <div class="points">积分: <%=ub.getUserPoints()%></div>
            </div>
            <%
                }
            %>
        </div>

        <!-- 第二排 -->
        <div class="row">
            <%
                if (topFiveUsers.size() > 1) {
                    User ub2 = topFiveUsers.get(1);
            %>
            <div class="ranking-card rank-2">
                <div class="medal">
                    2
                </div>
                <div class="name"><%=ub2.getUserName()%></div>
                <div class="points">积分: <%=ub2.getUserPoints()%></div>
            </div>
            <%
                }
                if (topFiveUsers.size() > 2) {
                    User ub3 = topFiveUsers.get(2);
            %>
            <div class="ranking-card rank-3">
                <div class="medal">
                    3
                </div>
                <div class="name"><%=ub3.getUserName()%></div>
                <div class="points">积分: <%=ub3.getUserPoints()%></div>
            </div>
            <%
                }
            %>
        </div>

        <!-- 第三排 -->
        <div class="row">
            <%
                if (topFiveUsers.size() > 3) {
                    User ub4 = topFiveUsers.get(3);
            %>
            <div class="ranking-card rank-4">
                <div class="medal">
                    4
                </div>
                <div class="name"><%=ub4.getUserName()%></div>
                <div class="points">积分: <%=ub4.getUserPoints()%></div>
            </div>
            <%
                }
                if (topFiveUsers.size() > 4) {
                    User ub5 = topFiveUsers.get(4);
            %>
            <div class="ranking-card rank-5">
                <div class="medal">
                    5
                </div>
                <div class="name"><%=ub5.getUserName()%></div>
                <div class="points">积分: <%=ub5.getUserPoints()%></div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>

</html>
