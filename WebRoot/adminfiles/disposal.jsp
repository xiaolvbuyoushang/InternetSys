<%@ page language="java" import="java.util.*, model.TaskOne, model.Auditor" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>处置管理</title>
    <script type="text/javascript">
        function assignReviewer(taskId, auditorName) {
            // 使用JavaScript提交表单
            var form = document.createElement("form");
            form.method = "post";
            form.action = "DisposalProcessServlet";

            var actionInput = document.createElement("input");
            actionInput.type = "hidden";
            actionInput.name = "action";
            actionInput.value = "assignReviewer";
            form.appendChild(actionInput);

            var taskIdInput = document.createElement("input");
            taskIdInput.type = "hidden";
            taskIdInput.name = "taskId";
            taskIdInput.value = taskId;
            form.appendChild(taskIdInput);

            var auditorNameInput = document.createElement("input");
            auditorNameInput.type = "hidden";
            auditorNameInput.name = "auditorName";
            auditorNameInput.value = auditorName;
            form.appendChild(auditorNameInput);

            document.body.appendChild(form);
            form.submit();
        }
    </script>
</head>
<body>
    <h1>处置管理</h1>
    <table border="1">
        <tr>
            <th>漏洞ID</th>
            <th>漏洞类型</th>
            <th>漏洞内容</th>
            <th>漏洞等级</th>
            <th>发布时间</th>
            <th>审核状态</th>
            <th>审核意见</th>
            <th>指派审核人</th>
        </tr>
        <%
            List<TaskOne> taskList = (List<TaskOne>) request.getAttribute("taskList");
            List<Auditor> auditors = (List<Auditor>) request.getAttribute("auditors");
            for (TaskOne task : taskList) {
        %>
        <tr>
            <td><%= task.getTaskID() %></td>
            <td><%= task.getTaskType() %></td>
            <td><%= task.getContent() %></td>
            <td><%= task.getLevel() %></td>
            <td><%= task.getAssignDate() %></td>
            <td><%= task.getStatus() %></td>
            <td><%= task.getAuditComment() %></td>
            <td>
                <select name="auditorName" onchange="assignReviewer('<%= task.getTaskID() %>', this.value)">
                    <option value="">请选择审核人</option>
                    <%
                        for (Auditor auditor : auditors) {
                    %>
                    <option value="<%= auditor.getAuditorName() %>"><%= auditor.getAuditorName() %></option>
                    <%
                        }
                    %>
                </select>
            </td>
        </tr>
        <%
            }
        %>
    </table>

    <%
        int pageCount = (Integer) request.getAttribute("pageCount");
        int pageNow = (Integer) request.getAttribute("pageNow");
        for (int i = 1; i <= pageCount; i++) {
    %>
    <a href="DisposalProcessServlet?pageNow=<%= i %>"><%= i %></a>
    <%
        }
    %>

    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
    <p><%= message %></p>
    <%
        }
    %>
</body>
</html>
