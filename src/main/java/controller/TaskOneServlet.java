package controller;

import BeanProcess.TaskOnePro; // 引入处理任务相关逻辑的类
import BeanProcess.UserPro; // 引入处理用户相关逻辑的类
import model.TaskOne; // 引入任务模型类

import javax.servlet.ServletException; // 引入Servlet异常类
import javax.servlet.http.HttpServlet; // 引入HttpServlet基类
import javax.servlet.http.HttpServletRequest; // 引入HTTP请求对象
import javax.servlet.http.HttpServletResponse; // 引入HTTP响应对象
import java.io.IOException; // 引入IO异常类
import java.util.ArrayList; // 引入ArrayList集合类

/**
 * Servlet实现类：TaskOneServlet
 * 该类用于处理与任务相关的各种操作，例如分页查询任务等。
 */
public class TaskOneServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // 序列化版本号，用于标识类的版本

    /**
     * 构造方法，初始化Servlet实例
     */
    public TaskOneServlet() {
        super(); // 调用父类构造方法
    }

    /**
     * 处理GET请求的方法
     * 根据请求参数执行不同的操作
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flag = (String) request.getParameter("flag"); // 获取请求参数"flag"，用于判断执行的操作类型
        String name = (String) request.getParameter("name"); // 获取请求参数"name"，表示用户名
        name = new String(name.getBytes("iso-8859-1"), "utf-8"); // 解决中文乱码问题
        UserPro userPro = new UserPro(); // 创建用户处理对象
        int level = userPro.getLevelByName(name); // 获取用户级别

        // 根据用户级别执行不同的操作
        if (level == 1) { // 如果用户级别为1
            if (flag.equals("downfenye")) { // 如果"flag"等于"downfenye"，表示需要查询下级任务
                String s_pageNow = request.getParameter("pageNow"); // 获取当前页码
                try {
                    int pageNow = Integer.parseInt(s_pageNow); // 将字符串类型的页码转换为整数
                    TaskOnePro ubc = new TaskOnePro(); // 创建任务处理对象
                    ArrayList<TaskOne> aList = ubc.getTaskByLevel(pageNow, level); // 获取当前页的任务列表
                    System.out.println("TaskOne level 为下级的漏洞数: " + aList.size()); // 打印任务数量
                    int pageCount = ubc.getPageCount(); // 获取总页数
                    // 将查询结果和分页信息存储到请求对象中
                    request.setAttribute("result", aList);
                    request.setAttribute("pageCount", pageCount + "");
                    request.setAttribute("pageNow", pageNow + "");
                    // 转发请求到显示任务数据的页面
                    request.getRequestDispatcher("userfiles/taskfordown.jsp").forward(request, response);
                } catch (Exception e) { // 捕获异常并打印堆栈信息
                    e.printStackTrace();
                }
            } else if (flag.equals("upfenye")) { // 如果"flag"等于"upfenye"，表示需要查询上级任务
                String info = "您为一级用户，没有来自上级的漏洞。"; // 设置提示信息
                request.setAttribute("info", info); // 将提示信息存储到请求对象中
                request.getRequestDispatcher("index.jsp").forward(request, response); // 转发请求到首页
            }
        } else if (level == 4) { // 如果用户级别为4
            if (flag.equals("downfenye")) { // 如果"flag"等于"downfenye"，表示需要查询下级任务
                String info = "您为四级用户，没有下级不能发漏洞。"; // 设置提示信息
                request.setAttribute("info", info); // 将提示信息存储到请求对象中
                request.getRequestDispatcher("index.jsp").forward(request, response); // 转发请求到首页
            } else if (flag.equals("upfenye")) { // 如果"flag"等于"upfenye"，表示需要查询上级任务
                String s_pageNow = request.getParameter("pageNow"); // 获取当前页码
                try {
                    int pageNow = Integer.parseInt(s_pageNow); // 将字符串类型的页码转换为整数
                    TaskOnePro ubc = new TaskOnePro(); // 创建任务处理对象
                    ArrayList<TaskOne> aList = ubc.getTaskByLevel(pageNow, level - 1); // 获取当前页的任务列表
                    System.out.println("TaskOne level 为上级的漏洞数: " + aList.size()); // 打印任务数量
                    int pageCount = ubc.getPageCount(); // 获取总页数
                    // 将查询结果和分页信息存储到请求对象中
                    request.setAttribute("result", aList);
                    request.setAttribute("pageCount", pageCount + "");
                    request.setAttribute("pageNow", pageNow + "");
                    // 转发请求到显示任务数据的页面
                    request.getRequestDispatcher("userfiles/taskfromup.jsp").forward(request, response);
                } catch (Exception e) { // 捕获异常并打印堆栈信息
                    e.printStackTrace();
                }
            }
        } else { // 如果用户级别为其他值
            if (flag.equals("downfenye")) { // 如果"flag"等于"downfenye"，表示需要查询下级任务
                String s_pageNow = request.getParameter("pageNow"); // 获取当前页码
                try {
                    int pageNow = Integer.parseInt(s_pageNow); // 将字符串类型的页码转换为整数
                    TaskOnePro ubc = new TaskOnePro(); // 创建任务处理对象
                    ArrayList<TaskOne> aList = ubc.getTaskByLevel(pageNow, level); // 获取当前页的任务列表
                    System.out.println("TaskOne level 为下级的漏洞数: " + aList.size()); // 打印任务数量
                    int pageCount = ubc.getPageCount(); // 获取总页数
                    // 将查询结果和分页信息存储到请求对象中
                    request.setAttribute("result", aList);
                    request.setAttribute("pageCount", pageCount + "");
                    request.setAttribute("pageNow", pageNow + "");
                    // 转发请求到显示任务数据的页面
                    request.getRequestDispatcher("userfiles/taskfordown.jsp").forward(request, response);
                } catch (Exception e) { // 捕获异常并打印堆栈信息
                    e.printStackTrace();
                }
            } else if (flag.equals("upfenye")) { // 如果"flag"等于"upfenye"，表示需要查询上级任务
                String s_pageNow = request.getParameter("pageNow"); // 获取当前页码
                try {
                    int pageNow = Integer.parseInt(s_pageNow); // 将字符串类型的页码转换为整数
                    TaskOnePro ubc = new TaskOnePro(); // 创建任务处理对象
                    ArrayList<TaskOne> aList = ubc.getTaskByLevel(pageNow, level - 1); // 获取当前页的任务列表
                    System.out.println("TaskOne level 为上级的漏洞数: " + aList.size()); // 打印任务数量
                    int pageCount = ubc.getPageCount(); // 获取总页数
                    // 将查询结果和分页信息存储到请求对象中
                    request.setAttribute("result", aList);
                    request.setAttribute("pageCount", pageCount + "");
                    request.setAttribute("pageNow", pageNow + "");
                    // 转发请求到显示任务数据的页面
                    request.getRequestDispatcher("userfiles/taskfromup.jsp").forward(request, response);
                } catch (Exception e) { // 捕获异常并打印堆栈信息
                    e.printStackTrace();
                }
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
