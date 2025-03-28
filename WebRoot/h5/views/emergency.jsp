<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="BeanProcess.AuditorPro" %>
<%@ page import="model.Auditor" %>
<%@ page import="java.util.List" %>
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

    // 创建 AuditorPro 对象
    AuditorPro auditorPro = new AuditorPro();

    // 查询所有审计员详细信息
    List<Auditor> auditors = auditorPro.getAllAuditors();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>应急响应24小时热线</title>
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

        /* 容器 */
        .tsec-container {
            max-width: 1200px;
            margin: 80px auto;
            padding: 0 20px;
        }

        /* 审计员列表 */
        .auditor-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
        }

        /* 审计员卡片 */
        .auditor-card {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            padding: 25px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .auditor-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 123, 255, 0.2);
            border-color: var(--accent-blue);
        }

        /* 卡片标题 */
        .auditor-card h3 {
            color: var(--accent-blue);
            margin: 0 0 20px 0;
            font-size: 1.5em;
            position: relative;
            padding-left: 40px;
        }

        .auditor-card h3 i {
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.2em;
        }

        /* 审计员信息 */
        .auditor-info {
            margin-top: 20px;
        }

        .auditor-info label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .auditor-info span {
            display: block;
            margin-bottom: 10px;
        }

        /* 响应式调整 */
        @media (max-width: 768px) {
            .tsec-container {
                margin: 40px auto;
            }

            .auditor-card {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<div class="tsec-container">
    <div class="auditor-list">
        <% if (auditors != null && !auditors.isEmpty()) { %>
            <% for (Auditor auditor : auditors) { %>
                <div class="auditor-card">
                    <h3><i class="fas fa-user-shield"></i>审计员信息</h3>
                    <div class="auditor-info">
                        <label>审计员ID:</label>
                        <span><%= auditor.getAuditorID() %></span>
                        <label>审计员姓名:</label>
                        <span><%= auditor.getAuditorName() %></span>
                        <label>审计员电话:</label>
                        <span><%= auditor.getPhone() %></span>
                    </div>
                </div>
            <% } %>
        <% } else { %>
            <div class="auditor-card">
                <h3><i class="fas fa-user-shield"></i>审计员信息</h3>
                <div class="auditor-info">
                    <span>未找到任何审计员信息</span>
                </div>
            </div>
        <% } %>
    </div>
</div>
</body>
</html>
