<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File, java.nio.file.Paths, java.nio.file.InvalidPathException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.io.FileNotFoundException" %>

<%@ include file="common/header.jsp" %>

<%!
    // 自定义的JS安全转义方法
    private String escapeJS(String input) {
        if (input == null) return "";
        return input.replace("\\", "\\\\")
                .replace("'", "\\'")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");
    }

    // 增强型路径校验方法
    private boolean isValidPath(String basePath, String testPath) {
        try {
            File baseFile = new File(basePath).getCanonicalFile();
            File testFile = new File(testPath).getCanonicalFile();
            return testFile.toPath().startsWith(baseFile.toPath());
        } catch (IOException e) {
            return false;
        }
    }
%>

<%
    // 合并后的安全配置和参数处理
    String rootPath = application.getRealPath("/");
    String currentPath = rootPath;
    String relativePath = ""; // 相对路径参数

    try {
        String rawPath = request.getParameter("path");
        if (rawPath != null && !rawPath.isEmpty()) {
            // 路径规范化处理
            String normalized = Paths.get(rawPath)
                    .normalize()
                    .toString()
                    .replace("\\", "/");

            // 构建完整路径
            File tempFile = new File(rootPath, normalized);
            String canonicalPath = tempFile.getCanonicalPath();

            // 安全校验
            if (isValidPath(rootPath, canonicalPath)) {
                currentPath = canonicalPath;
                relativePath = normalized; // 存储处理后的相对路径
            }
        }
    } catch (InvalidPathException | IOException e) {
        // 非法路径处理
        currentPath = rootPath;
        relativePath = "";
    }

    File currentDir = new File(currentPath);
    File[] files = currentDir.listFiles();

// 文件内容读取
    String fileContent = "";
    String fileToRead = request.getParameter("file");
    if (fileToRead != null && !fileToRead.isEmpty()) {
        try {
            File targetFile = new File(currentPath, fileToRead);

            // 二次安全校验
            if (!isValidPath(rootPath, targetFile.getCanonicalPath())) {
                throw new SecurityException("非法文件路径");
            }

            if (targetFile.isFile() && targetFile.getName().endsWith(".html")) {
                fileContent = new String(java.nio.file.Files.readAllBytes(targetFile.toPath()), "UTF-8");
            }
        } catch (SecurityException se) {
            fileContent = "访问拒绝：" + se.getMessage();
        } catch (Exception e) {
            fileContent = "文件读取错误：" + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>所有分类</title>
    <style>
        /* 保持原有样式不变 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 300px;
            background: #f5f5f5;
            border-right: 1px solid #ddd;
            overflow-y: auto;
            padding: 10px;
        }

        .content {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
        }

        .dir-item {
            padding: 5px;
            cursor: pointer;
            white-space: nowrap;
        }

        .dir-item:hover {
            background: #e0e0e0;
        }

        .file-item {
            color: #2196F3;
        }

        .current-path {
            padding: 10px;
            background: #eee;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="sidebar">
        <div class="current-path">
            当前路径：/<%= relativePath.isEmpty() ? "" : relativePath + "/" %>
        </div>
        <% if (files != null) {
            for (File file : files) {
                if (file.isDirectory()) { %>
        <div class="dir-item" onclick="navigateTo('<%= escapeJS(file.getName()) %>')">
            📁 <%= file.getName() %>
        </div>
        <% } else if (file.getName().endsWith(".html")) { %>
        <div class="dir-item file-item" onclick="loadFile('<%= escapeJS(file.getName()) %>')">
            📄 <%= file.getName() %>
        </div>
        <% }
        }
        } %>
    </div>

    <div class="content">
        <% if (!fileContent.isEmpty()) { %>
        <iframe srcdoc="<%= fileContent %>"
                style="width:100%; height:100%; border:none;"></iframe>
        <% } else { %>
        <div style="color:#666; text-align:center; margin-top:50px;">
            <%= relativePath.isEmpty() ? "根目录" : "当前目录" %> / 请选择HTML文件
        </div>
        <% } %>
    </div>
</div>

<script>
    function navigateTo(dir) {
        const params = new URLSearchParams();
        // 修改模板字符串为普通拼接方式
        const newPath = '<%= escapeJS(relativePath) %>' ?
            '<%= escapeJS(relativePath) %>/' + encodeURIComponent(dir) :
            encodeURIComponent(dir);

        params.set('path', newPath);
        window.location.search = params.toString();
    }

    function loadFile(filename) {
        const params = new URLSearchParams();
        params.set('path', '<%= escapeJS(relativePath) %>');
        params.set('file', encodeURIComponent(filename));
        window.location.search = params.toString();
    }
</script>


</body>
</html>

<%@ include file="common/footer.jsp" %>
