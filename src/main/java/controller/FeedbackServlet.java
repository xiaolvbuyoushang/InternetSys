package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BeanProcess.FeedbackPro;
import BeanProcess.TaskOnePro;

/**
 * Servlet implementation class FeedbackServlet
 */
public class FeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String flag = (String) request.getParameter("flag");
//		String error = "";
        if (flag.equals("addFeedback")) {
            int taskId = Integer.parseInt(request.getParameter("id"));
            String tasktype = request.getParameter("tasktype");
            tasktype = new String(tasktype.getBytes("iso-8859-1"), "utf-8");
            String content = request.getParameter("content");
            content = new String(content.getBytes("iso-8859-1"), "utf-8");
            String fix = request.getParameter("fix");
            fix = new String(fix.getBytes("iso-8859-1"), "utf-8");
            TaskOnePro taskOnePro = new TaskOnePro();
            boolean updateTaskStatus = taskOnePro.updateTask(taskId);
            if (updateTaskStatus) {
                FeedbackPro feedbackPro = new FeedbackPro();
                boolean b = feedbackPro.addFeedback(taskId, content);//添加反馈信息
                if (b) {
                    request.getRequestDispatcher("user/select.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("user/select.jsp").forward(request, response);
                }
            }
        } else if (flag.equals("delUser")) {
//			String userId = request.getParameter("userId");
//			UserPro ubc = new UserPro();
//			boolean b = ubc.delUser(userId);
//			if (b) {
//				request.getRequestDispatcher("index.jsp").forward(request, response);
//			}else {
//				request.getRequestDispatcher("index.jsp").forward(request, response);
//			}
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
