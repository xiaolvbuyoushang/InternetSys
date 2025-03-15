package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BeanProcess.LogPro;
import model.Log;


/**
 * Servlet implementation class LogProcessServlet
 */
public class LogProcessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String flag = (String) request.getParameter("flag");
        if (flag.equals("fenye")) {
            String s_pageNow = request.getParameter("pageNow");
            try {
                int pageNow = Integer.parseInt(s_pageNow);
                LogPro ubc = new LogPro();
                ArrayList<Log> aList = ubc.getLogsByPage(pageNow);
                int pageCount = ubc.getPageCount();
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");
                request.getRequestDispatcher("adminfiles/loginfo.jsp").forward(request, response);
            } catch (Exception e) {
                // TODO: handle exception
                e.printStackTrace();
            }
        } else if (flag.equals("delUser")) {
//			String userId = request.getParameter("userId");
//			LogPro ubc = new LogPro();
//			boolean b = ubc.delUser(userId);
//			if (b==true) {
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
        this.doGet(request, response);
    }

}
