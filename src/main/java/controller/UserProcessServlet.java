package controller;

import BeanProcess.CompanyPro;
import BeanProcess.UserPro;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class UserProcessServlet
 */
public class UserProcessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String flag = (String) request.getParameter("flag");
        String error = "";
        if (flag.equals("fenye")) {
            String type = request.getParameter("type"); // 新增类型参数
            String s_pageNow = request.getParameter("pageNow");
            String sortType = request.getParameter("sort"); // 新增排序参数
            try {
                int pageNow = Integer.parseInt(s_pageNow);
                UserPro ubc = new UserPro();

                if ("hero".equals(type)) { // 英雄分页逻辑
                    ArrayList<User> aList = ubc.getHerosByPage(pageNow);
                    int pageCount = ubc.getHeroPageCount();
                    request.setAttribute("result", aList);
                    request.setAttribute("pageCount", pageCount + "");
                    request.setAttribute("pageNow", pageNow + "");
                    request.getRequestDispatcher("h5/views/hero.jsp").forward(request, response);
                } else { // 保留原用户分页逻辑
                    ArrayList<User> aList = ubc.getUsersByPage(pageNow);
                    int pageCount = ubc.getPageCount();
                    request.setAttribute("result", aList);
                    request.setAttribute("pageCount", pageCount + "");
                    request.setAttribute("pageNow", pageNow + "");
                    request.getRequestDispatcher("adminfiles/userinfo.jsp").forward(request, response);
                }

            } catch (Exception e) {
                response.sendError(500, "分页参数错误：" + e.getMessage());
            }
        } else if (flag.equals("delUser")) {
            String userId = request.getParameter("userId");
            UserPro ubc = new UserPro();
            boolean b = ubc.delUser(userId);
            if (b == true) {
                request.getRequestDispatcher("admin/select.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("admin/select.jsp").forward(request, response);
            }
        } else if (flag.equals("addUser")) {
//			int userId = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("name");
            String phone = request.getParameter("phone");
            String companyName = request.getParameter("comname");
            int status = Integer.parseInt(request.getParameter("status"));
            String passwd = request.getParameter("password");
            int level = Integer.parseInt(request.getParameter("level"));
            username = new String(username.getBytes("iso-8859-1"), "utf-8");
            companyName = new String(companyName.getBytes("iso-8859-1"), "utf-8");
            CompanyPro companyPro = new CompanyPro();
            int companyID = companyPro.getCompanyID(companyName);
            UserPro ubc = new UserPro();
            boolean b = ubc.addUser(username, phone, companyID, status, level, passwd);
            if (b) {
                request.setAttribute("info", error);
                request.getRequestDispatcher("admin/select.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("admin/select.jsp").forward(request, response);
            }
        } else if (flag.equals("updateUser")) {
            int userId = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("name");
            username = new String(username.getBytes("iso-8859-1"), "utf-8");
            String phone = request.getParameter("phone");
            phone = new String(phone.getBytes("iso-8859-1"), "utf-8");
            int companyType = Integer.parseInt(request.getParameter("companytype"));
            int status = Integer.parseInt(request.getParameter("status"));
            String passwd = request.getParameter("password");

            UserPro ubc = new UserPro();
            boolean b = ubc.updateUser(userId, username, phone, companyType, status, passwd);
            if (b) {
                request.setAttribute("info", error);
                request.getRequestDispatcher("admin/select.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("admin/select.jsp").forward(request, response);
            }
        } else if (flag.equals("findUser")) {
            String comName = request.getParameter("comNameCheck");
            comName = new String(comName.getBytes("iso-8859-1"), "utf-8");
            System.out.println("findUser test1: " + comName);
            CompanyPro companyPro = new CompanyPro();
            int comID = companyPro.getCompanyID(comName);
            System.out.println("findUser comID test: " + comID);
            String s_pageNow = request.getParameter("pageNow");
            try {
                int pageNow = Integer.parseInt(s_pageNow);
                System.out.println("findUser pageNow test: " + pageNow);
                UserPro ubc = new UserPro();
                ArrayList<User> aList = ubc.getUserPageByComID(comID, pageNow);
                System.out.println("findUser test: " + aList);
                int pageCount = ubc.getPageCount();
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");
                request.getRequestDispatcher("adminfiles/userinfo.jsp").forward(request, response);

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
