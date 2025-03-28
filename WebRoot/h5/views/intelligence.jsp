<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List, controller.SecurityDevice" %>

<%@ include file="common/header.jsp" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>态势感知</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">

    <!-- 自定义样式 -->
    <style>
        .hero-section {
            background: linear-gradient(45deg, #1a237e, #0d47a1);
            color: white;
            padding: 4rem 0;
            margin-bottom: 3rem;
        }

        .device-card {
            transition: transform 0.3s, box-shadow 0.3s;
            border-radius: 15px;
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .device-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .device-img {
            height: 200px;
            object-fit: cover;
            transition: transform 0.3s;
        }

        .device-card:hover .device-img {
            transform: scale(1.05);
        }

        .feature-list {
            list-style: none;
            padding-left: 0;
        }

        .feature-list li::before {
            content: "✓";
            color: #2196F3;
            margin-right: 8px;
        }
    </style>
</head>
<body>

<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">安全态势感知平台</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#">首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">产品对比</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- 头部展示区 -->
<div class="hero-section">
    <div class="container text-center">
        <h1 class="display-4 mb-4">网络安全态势感知平台</h1>
        <p class="lead">汇聚国内顶尖安全厂商的态势感知解决方案</p>
    </div>
</div>

<!-- 主体内容 -->
<div class="container">
    <div class="row">
        <%
            // 从request中获取设备列表
            List<SecurityDevice> devices = (List<SecurityDevice>) request.getAttribute("devices");

            if (devices != null) {
                for (SecurityDevice device : devices) {
        %>
        <div class="col-lg-4 col-md-6">
            <div class="card device-card h-100">
                <img src="<%= device.getImageUrl() %>" class="card-img-top device-img" alt="<%= device.getVendor() %>">
                <div class="card-body">
                    <h5 class="card-title text-primary"><%= device.getVendor() %>
                    </h5>
                    <h6 class="card-subtitle mb-2 text-muted"><%= device.getProductName() %>
                    </h6>
                    <p class="card-text"><%= device.getDescription() %>
                    </p>
                    <ul class="feature-list">
                        <%
                            List<String> features = device.getFeatures();
                            if (features != null) {
                                for (String feature : features) {
                        %>
                        <li><%= feature %>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="col-12 text-center">
            <p class="text-danger">暂无设备数据</p>
        </div>
        <%
            }
        %>
    </div>
</div>

<!-- 页脚 -->
<footer class="bg-dark text-white mt-5">
    <div class="container py-4">
        <div class="text-center">
            <p class="mb-0">&copy; 2025 网络安全态势感知平台. All rights reserved.</p>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ include file="common/footer.jsp" %>
