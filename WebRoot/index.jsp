<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%@ include file="h5/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>安全应急中心</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-blue: #0A1F3D; /* 腾讯深蓝主色 */
            --accent-blue: #007BFF; /* 强调蓝色 */
            --hover-blue: #0056b3; /* 悬停蓝色 */
            --text-light: #F0F4F8; /* 浅色文字 */
            --bg-dark: #0A1F3D; /* 深色背景 */
        }

        body {
            font-family: 'Microsoft YaHei', 'Helvetica Neue', Arial, sans-serif;
            background: var(--bg-dark);
            color: var(--text-light);
            line-height: 1.6;
        }

        /* 导航容器 */
        .tsec-container {
            max-width: 1200px;
            margin: 80px auto;
            padding: 0 20px;
        }

        /* 功能模块网格 */
        .tsec-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
        }

        /* 功能卡片 */
        .tsec-card {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            padding: 25px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .tsec-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 123, 255, 0.2);
            border-color: var(--accent-blue);
        }

        /* 卡片标题 */
        .tsec-card h3 {
            color: var(--accent-blue);
            margin: 0 0 20px 0;
            font-size: 1.5em;
            position: relative;
            padding-left: 40px;
        }

        .tsec-card h3 i {
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.2em;
        }

        /* 导航链接 */
        .tsec-link {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            margin: 8px 0;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 6px;
            color: var(--text-light);
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .tsec-link:hover {
            background: var(--accent-blue);
            transform: translateX(10px);
        }

        .tsec-link i {
            width: 30px;
            text-align: center;
            margin-right: 15px;
            font-size: 1.1em;
        }

        /* 状态指示 */
        .tsec-status {
            position: absolute;
            top: 15px;
            right: 15px;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: #28a745;
            box-shadow: 0 0 8px #28a745;
        }

        /* 响应式调整 */
        @media (max-width: 768px) {
            .tsec-container {
                margin: 40px auto;
            }

            .tsec-card {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<div class="tsec-container">
    <div class="tsec-grid">
        <!-- 漏洞管理 -->
        <div class="tsec-card">
            <div class="tsec-status"></div>
            <h3><i class="fas fa-shield-alt"></i>漏洞管理</h3>
            <a href="<%=basePath%>userfiles/assignTask.jsp" class="tsec-link">
                <i class="fas fa-bug"></i>漏洞报告
            </a>
<%--            <a href="../TaskProcessServlet?pageNow=1&flag=fenye" target="mainFrame" class="left-font03" onClick="tupian('24');">所有漏洞查看</a>--%>
<%--            <a href="VulnerabilityServlet?action=list" class="tsec-link">--%>
                <a href="TaskProcessServlet?pageNow=1&flag=fenye" target="mainFrame" class="tsec-link" onClick="tupian('24');">
                <i class="fas fa-list-ul"></i>漏洞列表
            </a>
        </div>

        <!-- 贡献排行 -->
        <div class="tsec-card">
            <h3><i class="fas fa-trophy"></i>贡献排行</h3>

            <a href="./userfiles/score.jsp" class="tsec-link">
                <i class="fas fa-medal"></i>英雄榜单
            </a>
            <a href="./userfiles/award.jsp" class="tsec-link">
                <i class="fas fa-chart-line"></i>颁奖台
            </a>
        </div>


        <!-- 奖励中心 -->
        <div class="tsec-card">
            <h3><i class="fas fa-gift"></i>奖励中心</h3>
            <a href="<%=basePath%>userfiles/gift.jsp" class="tsec-link">
                <i class="fas fa-exchange-alt"></i>礼品兑换
            </a>
            <a href="./userfiles/myGifts.jsp" class="tsec-link">
                <i class="fas fa-box-open"></i>我的奖品
            </a>
        </div>

        <!-- 威胁情报 -->
        <div class="tsec-card">
            <h3><i class="fas fa-broadcast-tower"></i>威胁情报</h3>
            <a href="<%=basePath%>h5/views/intelligence.jsp" class="tsec-link">
                <i class="fas fa-exclamation-triangle"></i>态势感知
            </a>
            <a href="<%=basePath%>/devices" class="tsec-link">
                <i class="fas fa-clock"></i>最新动态
            </a>
        </div>

        <!-- 技术博客 -->
        <div class="tsec-card">
            <h3><i class="fas fa-blog"></i>技术博客</h3>
            <a href="<%=basePath%>h5/views/blog.jsp" class="tsec-link">
                <i class="fas fa-file-alt"></i>技术文章
            </a>
            <a href="<%=basePath%>h5/views/UpdateBlog.jsp" class="tsec-link">
                <i class="fas fa-folder-open"></i>写文章
            </a>
        </div>

        <!-- 应急响应 -->
        <div class="tsec-card">
            <h3><i class="fas fa-ambulance"></i>应急响应</h3>
            <a href="<%=basePath%>h5/views/emergency.jsp" class="tsec-link">
                <i class="fas fa-phone-alt"></i>24小时热线
            </a>
            <a href="ReportServlet" class="tsec-link">
                <i class="fas fa-edit"></i>事件上报
            </a>
        </div>
    </div>
</div>
</body>
</html>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const loading = document.createElement('div');
        loading.className = 'tsec-loading';
        loading.innerHTML = '<div class="tsec-spinner"></div>';
        document.body.appendChild(loading);

        window.addEventListener('load', () => {
            setTimeout(() => {
                loading.style.opacity = '0';
                setTimeout(() => loading.remove(), 500);
            }, 300);
        });
    });
</script>