package controller;

import BeanProcess.TaskOnePro;
import BeanProcess.UserPro;
import model.TaskOne;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class TaskOneServlet
 */
public class TaskOneServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
//		System.out.println("TaskPro start: ");
        String flag = (String) request.getParameter("flag");
        String name = (String) request.getParameter("name");
        name = new String(name.getBytes("iso-8859-1"), "utf-8");
        UserPro userPro = new UserPro();
        int level = userPro.getLevelByName(name);
        if (level == 1) {
            if (flag.equals("downfenye")) {
                String s_pageNow = request.getParameter("pageNow");
                try {
                    int pageNow = Integer.parseInt(s_pageNow);
                    TaskOnePro ubc = new TaskOnePro();
                    ArrayList<TaskOne> aList = ubc.getTaskByLevel(pageNow, level);
                    System.out.println("TaskOne level 为下级的漏洞数: " + aList.size());
                    int pageCount = ubc.getPageCount();
                    request.setAttribute("result", aList);
                    request.setAttribute("pageCount", pageCount + "");
                    request.setAttribute("pageNow", pageNow + "");
                    request.getRequestDispatcher("userfiles/taskfordown.jsp").forward(request, response);
                } catch (Exception e) {
                    // TODO: handle exception
                    e.printStackTrace();
                }
            } else if (flag.equals("upfenye")) {
                String info = "您为一级用户，没有来自上级的漏洞。";
                request.setAttribute("info", info);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else if (level == 4) {
            if (flag.equals("downfenye")) {
                String info = "您为四级用户，没有下级不能发漏洞。";
                request.setAttribute("info", info);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else if (flag.equals("upfenye")) {
                String s_pageNow = request.getParameter("pageNow");
                try {
                    int pageNow = Integer.parseInt(s_pageNow);
                    TaskOnePro ubc = new TaskOnePro();
                    ArrayList<TaskOne> aList = ubc.getTaskByLevel(pageNow, level - 1);
                    System.out.println("TaskOne level 为上级的漏洞数: " + aList.size());
                    int pageCount = ubc.getPageCount();
                    request.setAttribute("result", aList);
                    request.setAttribute("pageCount", pageCount + "");
                    request.setAttribute("pageNow", pageNow + "");
                    request.getRequestDispatcher("userfiles/taskfromup.jsp").forward(request, response);
                } catch (Exception e) {
                    // TODO: handle exception
                    e.printStackTrace();
                }
            }
        } else {
            if (flag.equals("downfenye")) {
                String s_pageNow = request.getParameter("pageNow");
                try {
                    int pageNow = Integer.parseInt(s_pageNow);
                    TaskOnePro ubc = new TaskOnePro();
                    ArrayList<TaskOne> aList = ubc.getTaskByLevel(pageNow, level);
                    System.out.println("TaskOne level 为下级的漏洞数: " + aList.size());
                    int pageCount = ubc.getPageCount();
                    request.setAttribute("result", aList);
                    request.setAttribute("pageCount", pageCount + "");
                    request.setAttribute("pageNow", pageNow + "");
                    request.getRequestDispatcher("userfiles/taskfordown.jsp").forward(request, response);
                } catch (Exception e) {
                    // TODO: handle exception
                    e.printStackTrace();
                }
            } else if (flag.equals("upfenye")) {
                String s_pageNow = request.getParameter("pageNow");
                try {
                    int pageNow = Integer.parseInt(s_pageNow);
                    TaskOnePro ubc = new TaskOnePro();
                    ArrayList<TaskOne> aList = ubc.getTaskByLevel(pageNow, level - 1);
                    System.out.println("TaskOne level 为上级的漏洞数: " + aList.size());
                    int pageCount = ubc.getPageCount();
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
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        this.doGet(request, response);
    }

}
