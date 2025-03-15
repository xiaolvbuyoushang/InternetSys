package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BeanProcess.CompanyPro;
import BeanProcess.TaskOnePro;
import model.TaskOne;

/**
 * Servlet implementation class TaskProcessServlet
 */
public class TaskProcessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        System.out.println("TaskPro start: ");
        String flag = (String) request.getParameter("flag");
        if (flag.equals("fenye")) {
            String s_pageNow = request.getParameter("pageNow");
            try {
                int pageNow = Integer.parseInt(s_pageNow);
                TaskOnePro ubc = new TaskOnePro();
                ArrayList<TaskOne> aList = ubc.getTasksByPage(pageNow);
                System.out.println("TaskOne: " + aList.size());
                int pageCount = ubc.getPageCount();
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");
                request.getRequestDispatcher("adminfiles/listrenwu.jsp").forward(request, response);
            } catch (Exception e) {
                // TODO: handle exception
                e.printStackTrace();
            }
        } else if (flag.equals("addTask")) {
            String tasktype = request.getParameter("tasktype");
            int status = Integer.parseInt(request.getParameter("taskstatus"));
            String content = request.getParameter("content");
            String companyname = request.getParameter("company");
            int level = Integer.parseInt(request.getParameter("level"));
            tasktype = new String(tasktype.getBytes("iso-8859-1"), "utf-8");
            content = new String(content.getBytes("iso-8859-1"), "utf-8");
            companyname = new String(companyname.getBytes("iso-8859-1"), "utf-8");
            Timestamp loginDate = new Timestamp(new Date().getTime());
            CompanyPro companyPro = new CompanyPro();
            int companyid = companyPro.getIDByName(companyname);
            TaskOnePro task = new TaskOnePro();
            boolean b = task.addTask(tasktype, loginDate, status, content, companyid, level);
            if (b) {
                request.getRequestDispatcher("user/select.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("user/select.jsp").forward(request, response);
            }
        } else if (flag.equals("findrenwu")) {
            int taskStatus = Integer.parseInt(request.getParameter("findrenwu"));
            String s_pageNow = request.getParameter("pageNow");
            try {
                int pageNow = Integer.parseInt(s_pageNow);

                System.out.println("findrenwu pageNow test: " + pageNow);
                TaskOnePro taskOnePro = new TaskOnePro();
                ArrayList<TaskOne> aList = taskOnePro.getTaskByStatus(pageNow, taskStatus);
                System.out.println("findrenwu test: " + aList);
                int pageCount = taskOnePro.getPageCount();
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");
                request.getRequestDispatcher("adminfiles/listrenwu.jsp").forward(request, response);
            } catch (Exception e) {
                // TODO: handle exception
                e.printStackTrace();
            }
        } else if (flag.equals("findTask1")) {
            String assigndate1 = request.getParameter("assigndate1");//一个时间
            String assigndate2 = request.getParameter("assigndate2");//一个时间

            System.out.println("findTaskTime 起时间: " + assigndate1 + "没值");
            System.out.println("findTaskTime 止时间: " + assigndate2);
            String s_pageNow = request.getParameter("pageNow");
            try {
                int pageNow = Integer.parseInt(s_pageNow);
                System.out.println("findTask pageNow test: " + pageNow);

                TaskOnePro taskonePro = new TaskOnePro();
                ArrayList<TaskOne> aList = taskonePro.getTaskPageByTime(pageNow, assigndate1, assigndate2);
//				System.out.println(111111+"没查到数据库的数据");
//				System.out.println("findTask1 test: "+aList);
                int pageCount = taskonePro.getPageCount();
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");
                request.getRequestDispatcher("userfiles/taskfordown.jsp").forward(request, response);
            } catch (Exception e) {
                // TODO: handle exception
                e.printStackTrace();
            }
        } else if (flag.equals("findTask2")) {
            String assigndate1 = request.getParameter("assigndate1");//一个时间
            String assigndate2 = request.getParameter("assigndate2");//一个时间

            System.out.println("findTaskTime 起时间: " + assigndate1 + "没值");
            System.out.println("findTaskTime 止时间: " + assigndate2);
            String s_pageNow = request.getParameter("pageNow");
            try {
                int pageNow = Integer.parseInt(s_pageNow);
                System.out.println("findTask pageNow test: " + pageNow);

                TaskOnePro taskonePro = new TaskOnePro();
                ArrayList<TaskOne> aList = taskonePro.getTaskPageByTime(pageNow, assigndate1, assigndate2);
//				System.out.println(111111+"没查到数据库的数据");
//				System.out.println("findTask1 test: "+aList);
                int pageCount = taskonePro.getPageCount();
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");
                request.getRequestDispatcher("userfiles/taskfromup.jsp").forward(request, response);
            } catch (Exception e) {
                // TODO: handle exception
                e.printStackTrace();
            }
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        this.doGet(request, response);
    }

}
