<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File,java.io.FilenameFilter" %>
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
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HTML Viewer</title>
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
        }

        .file-item {
            padding: 8px;
            cursor: pointer;
            border-radius: 4px;
        }

        .file-item:hover {
            background: #f0f0f0;
        }

        iframe {
            width: 100%;
            height: 100%;
            border: none;
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
        <iframe id="contentFrame"></iframe>
    </div>
</div>

<script>
    function loadContent(filename) {
        document.getElementById('contentFrame').src =
            '<%= request.getContextPath() %>/html/' + encodeURIComponent(filename);
    }
</script>
</body>
</html>

<%@ include file="common/footer.jsp" %>