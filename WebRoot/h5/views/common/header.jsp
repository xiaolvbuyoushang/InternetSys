<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Objects" %>


<c:set var="currentPage"
       value='<%= Objects.toString(request.getParameter("currentPage"), "") %>'
       scope="page"/>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<%-- 在顶部声明变量 --%>
<%! String currentPage = ""; %>

<%
    String name = (String) request.getSession().getAttribute("myName");
    // 从会话中获取用户名称，用于显示在页面上
%>

<%
    currentPage = request.getParameter("currentPage") != null
            ? request.getParameter("currentPage")
            : "";
%>

<style>
    /* 修复fixed-top遮挡内容问题 */
    body {
        padding-top: 80px;
    }

    /* 横向布局样式 */
    .horizontal-nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 2rem;
    }

    .nav-main-menu {
        display: flex;
        gap: 2rem;
        margin: 0;
        padding: 0;
    }

    .nav-item {
        list-style: none;
        position: relative;
    }

    /* 悬浮动画位置 */
    .nav-link::after {
        bottom: -5px; /* 下移指示条位置 */
    }

    /* 添加媒体查询保持响应式 */
    @media (max-width: 992px) {
        .horizontal-nav {
            flex-wrap: wrap;
            padding: 1rem;
        }

        .nav-main-menu {
            order: 2;
            width: 100%;
            justify-content: space-around;
            margin-top: 1rem;
        }
    }

    .text-truncate-2 {
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .carousel-control-prev, .carousel-control-next {
        background-color: rgba(0, 0, 0, 0.2);
        width: 30px;
        height: 30px;
        top: 50%;
        transform: translateY(-50%);
        border-radius: 50%;
    }

    .rating-stars {
        color: #ffd700;
        font-size: 0.9rem;
    }
    /* 自定义样式 */
    .nav-link.text-danger:hover {
        color: #dc3545; /* 悬停时的颜色 */
    }
</style>

<nav class="navbar fixed-top">
    <div class="container-fluid horizontal-nav"> <!-- 应用横向布局类 -->
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="安全平台" height="40">
        </a>

        <ul class="nav-main-menu">
            <li class="nav-item">
                <a class="nav-link <%= "index".equals(currentPage) ? "active" : "" %>"
                   href="${pageContext.request.contextPath}/">
                    <i class="bi bi-house-door me-2"></i>首页
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= "vulnerability".equals(currentPage) ? "active" : "" %>"
                   href="TaskProcessServlet?pageNow=1&flag=fenye" target="mainFrame" class="tsec-link" onClick="tupian('24');">
                    <i class="bi bi-shield-exclamation me-2"></i>漏洞管理
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/userfiles/score.jsp">
                    <i class="bi bi-trophy me-2"></i>贡献排行
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/h5/views/gift.jsp">
                    <i class="bi bi-gift me-2"></i>奖励中心
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/h5/views/intelligence.jsp">
                    <i class="bi bi-gift me-2"></i>威胁情报
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/h5/views/blog.jsp">
                    <i class="bi bi-gift me-2"></i>技术博客
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/h5/views/emergency.jsp">应急响应
                    <i class="bi bi-gift me-2"></i>
                </a>
            </li>
            <li class="nav-item">
                <c:set var="userName" value="${sessionScope.myName}" />
                <c:choose>
                    <c:when test="${not empty userName}">
                        <a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">${userName}</a>
                        <a href="${pageContext.request.contextPath}/logout.jsp" class="nav-link text-danger">退出</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login.jsp" class="nav-link">登陆</a>
                    </c:otherwise>
                </c:choose>
            </li>

        </ul>
    </div>
</nav>
