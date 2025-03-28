<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<%@ include file="common/header.jsp" %>
<%
    // 设置HTML和Markdown文件目录路径
    String htmlDir = application.getRealPath("/html");
    File dir = new File(htmlDir);

    // 获取目录下所有HTML和Markdown文件
    File[] files = dir.listFiles(new FilenameFilter() {
        public boolean accept(File dir, String name) {
            return name.toLowerCase().endsWith(".html") || name.toLowerCase().endsWith(".md");
        }
    });

    // 默认加载第一个文件
    String defaultFile = null;
    if (files != null && files.length > 0) {
        defaultFile = files[0].getName();
    }

    // 读取默认文件内容
    String content = "";
    if (defaultFile != null) {
        File defaultFilePath = new File(dir, defaultFile);
        if (defaultFilePath.exists() && defaultFilePath.isFile()) {
            try (BufferedReader reader = new BufferedReader(new FileReader(defaultFilePath))) {
                StringBuilder contentBuilder = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    contentBuilder.append(line).append("\n");
                }
                content = contentBuilder.toString();
            } catch (IOException e) {
                e.printStackTrace();
                content = "读取文件时发生错误";
            }
        } else {
            content = "文件不存在";
        }
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

        .content-view iframe {
            width: 100%;
            height: 100%;
            border: none;
        }

        .content-view pre {
            width: 100%;
            height: 100%;
            overflow-y: auto;
            white-space: pre-wrap;
            word-wrap: break-word;
            background-color: #f9f9f9;
            padding: 10px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- 文件列表 -->
    <div class="file-list">
        <h3>知识博客</h3>
        <% if (files != null && files.length > 0) { %>
        <% for (File file : files) { %>
        <div class="file-item"
             onclick="loadContent('<%= file.getName() %>')">
            📄 <%= file.getName() %>
        </div>
        <% } %>
        <% } else { %>
        <p>目录中没有HTML或Markdown文件</p>
        <% } %>
    </div>

    <!-- 内容显示区域 -->
    <div class="content-view" id="contentDiv">
        <div class="loading" id="loading">加载中...</div>
        <% if (defaultFile != null) { %>
        <% if (defaultFile.toLowerCase().endsWith(".html")) { %>
        <iframe id="contentFrame" src="<%= request.getContextPath() %>/html/<%= defaultFile %>" width="100%" height="100%"></iframe>
        <% } else if (defaultFile.toLowerCase().endsWith(".md")) { %>
        <pre id="contentPre"><%= content %></pre>
        <% } %>
        <% } else { %>
        <p>目录中没有HTML或Markdown文件</p>
        <% } %>
    </div>
</div>

<script>
    function loadContent(filename) {
        showLoading();
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    var contentDiv = document.getElementById('contentDiv');
                    if (filename.toLowerCase().endsWith(".html")) {
                        contentDiv.innerHTML = '<iframe id="contentFrame" src="' + '<%= request.getContextPath() %>/html/' + encodeURIComponent(filename) + '" width="100%" height="100%"></iframe>';
                    } else if (filename.toLowerCase().endsWith(".md")) {
                        contentDiv.innerHTML = '<pre id="contentPre">' + xhr.responseText + '</pre>';
                    }
                } else {
                    contentDiv.innerHTML = '加载文件时发生错误: ' + xhr.status;
                }
                hideLoading();
            }
        };
        xhr.open("GET", "<%= request.getContextPath() %>/html/" + encodeURIComponent(filename), true);
        xhr.send();
    }

    function showLoading() {
        document.getElementById('loading').style.display = 'block';
    }

    function hideLoading() {
        document.getElementById('loading').style.display = 'none';
    }

    // 默认加载第一个文件
    <% if (defaultFile != null) { %>
    window.onload = function() {
        hideLoading();
    };
    <% } else { %>
    window.onload = function() {
        hideLoading();
        document.getElementById('contentDiv').innerHTML = '目录中没有HTML或Markdown文件';
    };
    <% } %>
</script>
</body>
</html>

<%@ include file="common/footer.jsp" %>
