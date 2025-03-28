<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 检查会话中的登录状态
    String name = (String) request.getSession().getAttribute("myName");

    if (name == null) {
        // 如果用户未登录，输出提示信息并重定向到主页
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write("<html><head><meta charset='UTF-8'><title>提示信息</title></head><body>");
        response.getWriter().write("<script>alert('请先登录');</script>");
        response.getWriter().write("<script>window.location.href='" + request.getContextPath() + "/index.jsp';</script>");
        response.getWriter().write("</body></html>");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑博客</title>
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/lang/zh-CN.js"></script>
    <script>
        KindEditor.ready(function(K) {
            window.editor = K.create('#htmlContent', {
                allowFileManager: true,
                uploadJson: '${pageContext.request.contextPath}/UploadFileServlet',
                fileManagerJson: '${pageContext.request.contextPath}/FileManagerServlet',
                afterCreate: function() {
                    this.sync();
                },
                afterBlur: function() {
                    this.sync();
                }
            });
        });

        function uploadFile() {
            var fileInput = document.getElementById('fileInput');
            if (fileInput.files.length === 0) {
                alert('请选择一个文件');
                return;
            }

            var formData = new FormData();
            formData.append('fileInput', fileInput.files[0]);

            // 确保 URL 与 UploadFileServlet 的 URL 映射一致
            fetch('${pageContext.request.contextPath}/UploadFileServlet', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(data => {
                alert('文件上传成功: ' + data);
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }

        // 在表单提交之前，同步 KindEditor 内容到表单字段
        document.addEventListener('DOMContentLoaded', function() {
            var form = document.querySelector('form');
            form.addEventListener('submit', function(event) {
                window.editor.sync(); // 同步 KindEditor 内容到表单字段
                console.log('KindEditor 内容已同步到表单字段');
            });
        });
    </script>
</head>
<body>
    <h1>编辑博客</h1>
    <form action="${pageContext.request.contextPath}/UpdateBlogServlet" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
        <textarea id="htmlContent" name="htmlContent" style="width:800px;height:400px;"></textarea>
        <br>
        <input type="file" id="fileInput" name="fileInput" accept=".html">
        <button type="button" onclick="uploadFile()">上传文件</button>
        <br>
        <button type="submit">保存更改</button>
    </form>
</body>
</html>
