package controller;

import BeanProcess.CompanyPro; // 引入处理公司相关逻辑的类
import BeanProcess.UserPro;    // 引入处理用户相关逻辑的类
import model.User;             // 引入用户模型类

import javax.servlet.ServletException; // 引入Servlet异常类
import javax.servlet.http.HttpServlet; // 引入HttpServlet基类
import javax.servlet.http.HttpServletRequest; // 引入HTTP请求对象
import javax.servlet.http.HttpServletResponse; // 引入HTTP响应对象
import java.io.IOException; // 引入IO异常类
import java.util.ArrayList;  // 引入ArrayList集合类，用于存储多个用户数据

/**
 * Servlet实现类：UserProcessServlet
 * 该类用于处理与用户相关的各种操作，例如分页查询、删除用户、添加用户等。
 */
public class UserProcessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // 序列化版本号，用于标识类的版本

    /**
     * 构造方法，初始化Servlet实例
     */
    public UserProcessServlet() {
        super(); // 调用父类构造方法
    }

    /**
     * 处理GET请求的方法
     * 根据请求参数执行不同的操作
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flag = (String) request.getParameter("flag"); // 获取请求参数"flag"，用于判断执行的操作类型
        String error = ""; // 定义一个空字符串，用于存储错误信息（目前未使用）

        // 根据"flag"参数值执行不同的操作
        if (flag.equals("fenye")) { // 如果"flag"等于"fenye"，表示需要进行分页查询
            String type = request.getParameter("type"); // 获取分页查询的类型（例如普通用户或英雄）
            String s_pageNow = request.getParameter("pageNow"); // 获取当前页码
            String sortType = request.getParameter("sort"); // 获取排序类型（目前未使用）

            try {
                int pageNow = Integer.parseInt(s_pageNow); // 将字符串类型的页码转换为整数
                UserPro ubc = new UserPro(); // 创建用户处理对象

                if ("hero".equals(type)) { // 如果查询类型是"hero"，表示需要查询英雄分页数据
                    ArrayList<User> aList = ubc.getHerosByPage(pageNow); // 获取当前页的英雄列表
                    int pageCount = ubc.getHeroPageCount(); // 获取总页数
                    // 将查询结果和分页信息存储到请求对象中
                    request.setAttribute("result", aList);
                    request.setAttribute("pageCount", pageCount + "");
                    request.setAttribute("pageNow", pageNow + "");
                    // 转发请求到显示英雄数据的页面
                    request.getRequestDispatcher("h5/views/hero.jsp").forward(request, response);
                } else { // 否则查询普通用户分页数据
                    ArrayList<User> aList = ubc.getUsersByPage(pageNow); // 获取当前页的用户列表
                    int pageCount = ubc.getPageCount(); // 获取总页数
                    // 将查询结果和分页信息存储到请求对象中
                    request.setAttribute("result", aList);
                    request.setAttribute("pageCount", pageCount + "");
                    request.setAttribute("pageNow", pageNow + "");
                    // 转发请求到显示用户数据的页面
                    request.getRequestDispatcher("adminfiles/userinfo.jsp").forward(request, response);
                }
            } catch (Exception e) { // 捕获异常并返回错误信息
                response.sendError(500, "分页参数错误：" + e.getMessage());
            }
        } else if (flag.equals("delUser")) { // 如果"flag"等于"delUser"，表示需要删除用户
            String userId = request.getParameter("userId"); // 获取需要删除的用户ID
            UserPro ubc = new UserPro(); // 创建用户处理对象
            boolean b = ubc.delUser(userId); // 调用删除用户方法
            // 删除成功或失败都转发到同一个页面
            request.getRequestDispatcher("admin/select.jsp").forward(request, response);
        } else if (flag.equals("addUser")) { // 如果"flag"等于"addUser"，表示需要添加用户
            // 获取用户相关信息
            String username = request.getParameter("name");
            String phone = request.getParameter("phone");
            String companyName = request.getParameter("comname");
            int status = Integer.parseInt(request.getParameter("status"));
            String passwd = request.getParameter("password");
            int level = Integer.parseInt(request.getParameter("level"));

            // 解决中文乱码问题
            username = new String(username.getBytes("iso-8859-1"), "utf-8");
            companyName = new String(companyName.getBytes("iso-8859-1"), "utf-8");

            CompanyPro companyPro = new CompanyPro(); // 创建公司处理对象
            int companyID = companyPro.getCompanyID(companyName); // 获取公司ID
            UserPro ubc = new UserPro(); // 创建用户处理对象
            boolean b = ubc.addUser(username, phone, companyID, status, level, passwd); // 调用添加用户方法
            // 添加成功或失败都转发到同一个页面
            request.getRequestDispatcher("admin/select.jsp").forward(request, response);
        } else if (flag.equals("updateUser")) { // 如果"flag"等于"updateUser"，表示需要更新用户
            // 获取用户相关信息
            int userId = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("name");
            username = new String(username.getBytes("iso-8859-1"), "utf-8");
            String phone = request.getParameter("phone");
            phone = new String(phone.getBytes("iso-8859-1"), "utf-8");
            int companyType = Integer.parseInt(request.getParameter("companytype"));
            int status = Integer.parseInt(request.getParameter("status"));
            String passwd = request.getParameter("password");

            UserPro ubc = new UserPro(); // 创建用户处理对象
            boolean b = ubc.updateUser(userId, username, phone, companyType, status, passwd); // 调用更新用户方法
            // 更新成功或失败都转发到同一个页面
            request.getRequestDispatcher("admin/select.jsp").forward(request, response);
        } else if (flag.equals("findUser")) { // 如果"flag"等于"findUser"，表示需要查找用户
            String comName = request.getParameter("comNameCheck"); // 获取公司名称
            comName = new String(comName.getBytes("iso-8859-1"), "utf-8"); // 解决中文乱码问题
            CompanyPro companyPro = new CompanyPro(); // 创建公司处理对象
            int comID = companyPro.getCompanyID(comName); // 获取公司ID
            String s_pageNow = request.getParameter("pageNow"); // 获取当前页码

            try {
                int pageNow = Integer.parseInt(s_pageNow); // 将字符串类型的页码转换为整数
                UserPro ubc = new UserPro(); // 创建用户处理对象
                ArrayList<User> aList = ubc.getUserPageByComID(comID, pageNow); // 获取指定公司和页码的用户列表
                int pageCount = ubc.getPageCount(); // 获取总页数
                // 将查询结果和分页信息存储到请求对象中
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");
                // 转发请求到显示用户数据的页面
                request.getRequestDispatcher("adminfiles/userinfo.jsp").forward(request, response);
            } catch (Exception e) { // 捕获异常并打印堆栈信息
                e.printStackTrace();
            }
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
