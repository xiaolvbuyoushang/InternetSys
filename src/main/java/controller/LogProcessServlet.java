package controller;

import BeanProcess.LogPro;
import model.Log;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet实现类：LogProcessServlet
 * 该类用于处理与日志相关的各种操作，例如分页查询日志等。
 */
public class LogProcessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // 序列化版本号，用于标识类的版本

    /**
     * 构造方法，初始化Servlet实例
     */
    public LogProcessServlet() {
        super(); // 调用父类构造方法
    }

    /**
     * 处理GET请求的方法
     * 根据请求参数执行不同的操作
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flag = (String) request.getParameter("flag"); // 获取请求参数"flag"，用于判断执行的操作类型

        // 根据"flag"参数值执行不同的操作
        if (flag.equals("fenye")) { // 如果"flag"等于"fenye"，表示需要进行分页查询
            String s_pageNow = request.getParameter("pageNow"); // 获取当前页码
            try {
                int pageNow = Integer.parseInt(s_pageNow); // 将字符串类型的页码转换为整数
                LogPro ubc = new LogPro(); // 创建日志处理对象
                ArrayList<Log> aList = ubc.getLogsByPage(pageNow); // 获取当前页的日志列表
                int pageCount = ubc.getPageCount(); // 获取总页数
                // 将查询结果和分页信息存储到请求对象中
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");
                // 转发请求到显示日志数据的页面
                request.getRequestDispatcher("adminfiles/loginfo.jsp").forward(request, response);
            } catch (Exception e) { // 捕获异常并打印堆栈信息
                e.printStackTrace();
            }
        } else if (flag.equals("delUser")) { // 如果"flag"等于"delUser"，表示需要删除用户
            // 注释掉的代码，用于删除用户
//			String userId = request.getParameter("userId"); // 获取需要删除的用户ID
//			LogPro ubc = new LogPro(); // 创建日志处理对象
//			boolean b = ubc.delUser(userId); // 调用删除用户方法
//			if (b==true) { // 如果删除成功
//				request.getRequestDispatcher("index.jsp").forward(request, response); // 转发请求到首页
//			}else { // 如果删除失败
//				request.getRequestDispatcher("index.jsp").forward(request, response); // 转发请求到首页
//			}
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
