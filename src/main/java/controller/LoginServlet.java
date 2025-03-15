package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BeanProcess.AdminPro;
import BeanProcess.UserPro;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String error = "";
        String userCode = request.getParameter("inputName");
        userCode = new String(userCode.getBytes("iso-8859-1"), "utf-8");
        String password = request.getParameter("inputPassword");
        String role = request.getParameter("userType");
        role = new String(role.getBytes("iso-8859-1"), "utf-8");
        System.out.println(userCode + "\t" + password + "\t" + role);
        if (role.equals("1")) {
            System.out.println("AdminJudge is starting:");
            AdminPro adminPro = new AdminPro();
            boolean b = adminPro.checkAdminInput(userCode, password);
            if (b) {
                request.getSession().setAttribute("myName", userCode);
                request.getRequestDispatcher("admin/select.jsp").forward(request, response);
                System.out.println(role + ": " + error);
            } else {
                error = "用户名或密码错误，或已被取消登录权限";
                request.setAttribute("info", error);//附加返回登陆错误的消息
                request.getRequestDispatcher("index.jsp").forward(request, response);
                System.out.println(role + ": " + error);
            }
        } else if (role.equals("2")) {
            UserPro userPro = new UserPro();
            boolean b = userPro.checkUserInput(userCode, password);
            if (b) {
                request.getSession().setAttribute("myName", userCode);
                request.getRequestDispatcher("user/select.jsp").forward(request, response);
                System.out.println(role + ": " + error);
            } else {
                error = "用户名或密码错误，或已被取消登录权限";
                request.setAttribute("info", error);//附加返回登陆错误的消息
                request.getRequestDispatcher("index.jsp").forward(request, response);
                System.out.println(role + ": " + error);
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
