package controller;

import BeanProcess.TaskOnePro;
import model.Auditor;
import model.TaskOne;
import tools.AuditorSelect;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class DisposalProcessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DisposalProcessServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flag = request.getParameter("flag");
        String pageNowStr = request.getParameter("pageNow");
        int pageNow = 1;
        if (pageNowStr != null) {
            try {
                pageNow = Integer.parseInt(pageNowStr);
            } catch (NumberFormatException e) {
                request.setAttribute("message", "无效的页码格式！");
                pageNow = 1;
            }
        }

        TaskOnePro taskOnePro = new TaskOnePro();
        ArrayList<TaskOne> taskList = taskOnePro.getTasksByPage(pageNow);
        int pageCount = taskOnePro.getPageCount();
        ArrayList<Auditor> auditors = taskOnePro.getAuditors();

        request.setAttribute("taskList", taskList);
        request.setAttribute("pageCount", pageCount);
        request.setAttribute("pageNow", pageNow);
        request.setAttribute("auditors", auditors);

        request.getRequestDispatcher("/adminfiles/disposal.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("assignReviewer".equals(action)) {
            String taskIdStr = request.getParameter("taskId");
            String auditorName = request.getParameter("auditorName");

            if (taskIdStr == null || taskIdStr.trim().isEmpty()) {
                request.setAttribute("message", "任务ID不能为空！");
                doGet(request, response);
                return;
            }

            if (auditorName == null || auditorName.trim().isEmpty()) {
                request.setAttribute("message", "审核人名字不能为空！");
                doGet(request, response);
                return;
            }

            try {
                int taskId = Integer.parseInt(taskIdStr);

                // 使用AuditorSelect查询审核人ID
                AuditorSelect auditorSelect = new AuditorSelect();
                int auditorId = auditorSelect.getAuditorIDByName(auditorName);

                boolean success = TaskOnePro.assignReviewer(taskId, auditorId);
                if (success) {
                    request.setAttribute("message", "审核人指派成功！");
                } else {
                    request.setAttribute("message", "审核人指派失败！");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("message", "无效的任务ID格式！");
                e.printStackTrace();
            }
        }

        doGet(request, response);
    }
}
