package controller;

import BeanProcess.AdminPro;
import BeanProcess.UserPro;
import BeanProcess.AuditorPro; // 假设存在一个处理审核用户逻辑的类

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet实现类：LoginServlet
 * 该类用于处理用户登录请求，包括管理员、普通用户和审核用户。
 */
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // 序列化版本号，用于标识类的版本

    /**
     * 构造方法，初始化Servlet实例
     */
    public LoginServlet() {
        super(); // 调用父类构造方法
    }

    /**
     * 处理GET请求的方法
     * 根据请求参数执行登录验证操作
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String error = ""; // 初始化错误信息为空字符串
        String userCode = request.getParameter("inputName"); // 获取用户名
        userCode = new String(userCode.getBytes("iso-8859-1"), "utf-8"); // 解决中文乱码问题
        String password = request.getParameter("inputPassword"); // 获取密码
        String role = request.getParameter("userType"); // 获取用户角色
        role = new String(role.getBytes("iso-8859-1"), "utf-8"); // 解决中文乱码问题
        System.out.println(userCode + "\t" + password + "\t" + role); // 打印用户名、密码和角色

        // 根据用户角色执行不同的登录验证
        if (role.equals("1")) { // 如果角色为1，表示管理员
            System.out.println("AdminJudge is starting:"); // 打印日志，表示管理员登录验证开始
            AdminPro adminPro = new AdminPro(); // 创建管理员处理对象
            boolean b = adminPro.checkAdminInput(userCode, password); // 调用管理员登录验证方法
            if (b) { // 如果验证成功
                request.getSession().setAttribute("myName", userCode); // 将用户名存储到会话中

                request.getRequestDispatcher("admin/select.jsp").forward(request, response); // 转发请求到管理员页面
                System.out.println(role + ": " + error); // 打印角色和错误信息
            } else { // 如果验证失败
                error = "用户名或密码错误，或已被取消登录权限"; // 设置错误信息
                request.setAttribute("info", error); // 将错误信息存储到请求对象中
                System.out.println(role + ": " + error); // 打印角色和错误信息
                request.getRequestDispatcher("index.jsp").forward(request, response); // 转发请求到登录页面

            }
        } else if (role.equals("2")) { // 如果角色为2，表示普通用户
            UserPro userPro = new UserPro(); // 创建用户处理对象
            boolean b = userPro.checkUserInput(userCode, password); // 调用用户登录验证方法
            if (b) { // 如果验证成功
                request.getSession().setAttribute("myName", userCode); // 将用户名存储到会话中
                request.getRequestDispatcher("index.jsp").forward(request, response); // 转发请求到用户页面
                System.out.println(role + ": " + error); // 打印角色和错误信息
            } else { // 如果验证失败
                error = "用户名或密码错误，或已被取消登录权限"; // 设置错误信息
                request.setAttribute("info", error); // 将错误信息存储到请求对象中
                request.getRequestDispatcher("index.jsp").forward(request, response); // 转发请求到登录页面
                System.out.println(role + ": " + error); // 打印角色和错误信息
            }
        } else if (role.equals("3")) { // 如果角色为3，表示审核用户
            System.out.println("AuditUserJudge is starting:"); // 打印日志，表示审核用户登录验证开始
            AuditorPro auditUserPro = new AuditorPro(); // 创建审核用户处理对象
            boolean b = auditUserPro.checkAuditorInput(userCode, password); // 调用审核用户登录验证方法
            if (b) { // 如果验证成功
                request.getSession().setAttribute("myName", userCode); // 将用户名存储到会话中
                request.getRequestDispatcher("auditor/select.jsp").forward(request, response); // 转发请求到审核用户页面
                System.out.println(role + ": " + error); // 打印角色和错误信息
            } else { // 如果验证失败
                error = "用户名或密码错误，或已被取消登录权限"; // 设置错误信息
                request.setAttribute("info", error); // 将错误信息存储到请求对象中
                request.getRequestDispatcher("index.jsp").forward(request, response); // 转发请求到登录页面
                System.out.println(role + ": " + error); // 打印角色和错误信息
            }
        } else {
            error = "无效的用户角色"; // 设置错误信息
            request.setAttribute("info", error); // 将错误信息存储到请求对象中
            request.getRequestDispatcher("index.jsp").forward(request, response); // 转发请求到登录页面
            System.out.println(role + ": " + error); // 打印角色和错误信息
        }
    }

    /**
     * 处理POST请求的方法
     * 直接调用doGet方法处理POST请求
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response); // 调用doGet方法
    }
}
