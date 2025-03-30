package controller;

import BeanProcess.TaskOnePro;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateAuditStatusServlet")
public class UpdateAuditStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String taskIdStr = request.getParameter("taskId");
        String auditStatus = request.getParameter("auditStatus");
        String auditOpinion = request.getParameter("auditOpinion");

        if (taskIdStr == null || auditStatus == null || auditOpinion == null) {
            response.sendRedirect("failure.jsp"); // 如果参数为空，重定向到失败页面
            return;
        }

        int taskId = Integer.parseInt(taskIdStr);

        // 调用 TaskOnePro 类的方法来更新数据库
        TaskOnePro taskOnePro = new TaskOnePro();
        boolean updateSuccess = taskOnePro.updateAuditStatus(taskId, auditStatus, auditOpinion);

        if (updateSuccess) {
            response.sendRedirect("assignTask.jsp"); // 重定向到成功页面
        } else {
            response.sendRedirect("assignTask.jsp"); // 重定向到失败页面
        }
    }

    // 为了处理 GET 请求，可以重定向到 POST 请求
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
