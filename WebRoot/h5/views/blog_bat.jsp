<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File, java.io.FilenameFilter" %>
<%@ include file="common/header.jsp" %>
<%
    // 设置HTML文件目录路径
    String htmlDir = application.getRealPath("/html");
    File dir = new File(htmlDir);

    // 获取目录下所有HTML文件
    File[] htmlFiles = dir.listFiles(new FilenameFilter() {
        public boolean accept(File dir, String name) {
            return name.toLowerCase().endsWith(".html");
        }
    });

    // 默认加载第一个HTML文件
    String defaultFile = null;
    if (htmlFiles != null && htmlFiles.length > 0) {
        defaultFile = htmlFiles[0].getName();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>知识博客</title>
    <style>
        .container {
            display: flex;
            height: 100vh;
        }

        .file-list {
            width: 250px;
            border-right: 1px solid #ccc;
            padding: 10px;
            overflow-y: auto;
        }

        .content-view {
            flex: 1;
            padding: 20px;
            position: relative;
        }

        .file-item {
            padding: 8px;
            cursor: pointer;
            border-radius: 4px;
        }

        .file-item:hover {
            background: #f0f0f0;
        }

        .loading {
            display: none;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 18px;
            color: #333;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- 文件列表 -->
    <div class="file-list">
        <h3>知识博客</h3>
        <% if (htmlFiles != null && htmlFiles.length > 0) { %>
        <% for (File file : htmlFiles) { %>
        <div class="file-item"
             onclick="loadContent('<%= file.getName() %>')">
            📄 <%= file.getName() %>
        </div>
        <% } %>
        <% } else { %>
        <p>目录中没有HTML文件</p>
        <% } %>
    </div>

    <!-- 内容显示区域 -->
    <div class="content-view">
        <div class="loading" id="loading">加载中...</div>
        <object id="contentObject" data="<%= defaultFile != null ? request.getContextPath() + "/html/" + defaultFile : "" %>" type="text/html" width="100%" height="100%">
            您的浏览器不支持嵌入的HTML内容。
        </object>
    </div>
</div>

<script>
    function loadContent(filename) {
        showLoading();
        document.getElementById('contentObject').data =
            '<%= request.getContextPath() %>/html/' + encodeURIComponent(filename);
    }

    function showLoading() {
        document.getElementById('loading').style.display = 'block';
    }

    function hideLoading() {
        document.getElementById('loading').style.display = 'none';
    }

    // 默认加载第一个HTML文件
    <% if (defaultFile != null) { %>
    window.onload = function() {
        hideLoading();
    };
    <% } else { %>
    window.onload = function() {
        hideLoading();
        document.getElementById('contentObject').data = '';
        document.getElementById('loading').textContent = '目录中没有HTML文件';
    };
    <% } %>
</script>
</body>
</html>

<%@ include file="common/footer.jsp" %>
