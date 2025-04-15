package controller;

import BeanProcess.CompanyPro;
import BeanProcess.TaskOnePro;
import model.TaskOne;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

/**
 * Servlet实现类：TaskProcessServlet
 * 该类用于处理与任务相关的各种操作，例如分页查询、添加任务、查找任务等。
 */
public class TaskProcessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // 序列化版本号，用于标识类的版本

    /**
     * 构造方法，初始化Servlet实例
     */
    public TaskProcessServlet() {
        super(); // 调用父类构造方法
    }

    /**
     * 处理GET请求的方法
     * 根据请求参数执行不同的操作
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("TaskPro start: "); // 打印日志，表示任务处理开始
        String flag = (String) request.getParameter("flag"); // 获取请求参数"flag"，用于判断执行的操作类型

        // 根据"flag"参数值执行不同的操作
        if (flag.equals("fenye")) { // 如果"flag"等于"fenye"，表示需要进行分页查询
            String s_pageNow = request.getParameter("pageNow"); // 获取当前页码
            try {
                int pageNow = Integer.parseInt(s_pageNow); // 将字符串类型的页码转换为整数
                if (pageNow <= 0) {
                    pageNow = 1; // 确保页码不小于1
                }
                TaskOnePro ubc = new TaskOnePro(); // 创建任务处理对象
                ArrayList<TaskOne> aList = ubc.getTasksByPage(pageNow); // 获取当前页的任务列表
                System.out.println("TaskOne: " + aList.size()); // 打印任务数量

                // 对任务列表按照发布时间倒序排序
                Collections.sort(aList, new Comparator<TaskOne>() {
                    @Override
                    public int compare(TaskOne t1, TaskOne t2) {
                        return t2.getAssignDate().compareTo(t1.getAssignDate());
                    }
                });

                int pageCount = ubc.getPageCount(); // 获取总页数
                // 将查询结果和分页信息存储到请求对象中
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");
                // 转发请求到显示任务数据的页面
                request.getRequestDispatcher("adminfiles/listrenwu.jsp").forward(request, response);
            } catch (Exception e) { // 捕获异常并打印堆栈信息
                e.printStackTrace();
            }
        } else if (flag.equals("addTask")) { // 如果"flag"等于"addTask"，表示需要添加任务
            // 获取任务相关信息
            String tasktype = request.getParameter("tasktype");
            int status = Integer.parseInt(request.getParameter("taskstatus"));
            String content = request.getParameter("content");
            String companyname = request.getParameter("company");
            int level = Integer.parseInt(request.getParameter("level"));

            // 解决中文乱码问题
            tasktype = new String(tasktype.getBytes("iso-8859-1"), "utf-8");
            content = new String(content.getBytes("iso-8859-1"), "utf-8");
            companyname = new String(companyname.getBytes("iso-8859-1"), "utf-8");

            // 获取当前时间戳
            Timestamp loginDate = new Timestamp(new Date().getTime());
            CompanyPro companyPro = new CompanyPro(); // 创建公司处理对象
            int companyid = companyPro.getIDByName(companyname); // 获取公司ID
            TaskOnePro task = new TaskOnePro(); // 创建任务处理对象
            boolean b = task.addTask(tasktype, loginDate, status, content, companyid, level); // 调用添加任务方法

            // 根据添加任务的结果设置不同的请求属性
            if (b) {
                request.setAttribute("message", "漏洞上报成功！");
                request.setAttribute("redirectUrl", "index.jsp");
            } else {
                request.setAttribute("message", "漏洞上报失败！");
                request.setAttribute("redirectUrl", "index.jsp");
            }
            // 转发请求到结果页面
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } else if (flag.equals("findrenwu")) { // 如果"flag"等于"findrenwu"，表示需要按状态查找任务
            int taskStatus = Integer.parseInt(request.getParameter("findrenwu")); // 获取任务状态
            String s_pageNow = request.getParameter("pageNow"); // 获取当前页码
            try {
                int pageNow = Integer.parseInt(s_pageNow); // 将字符串类型的页码转换为整数
                if (pageNow <= 0) {
                    pageNow = 1; // 确保页码不小于1
                }
                System.out.println("findrenwu pageNow test: " + pageNow); // 打印当前页码
                TaskOnePro taskOnePro = new TaskOnePro(); // 创建任务处理对象
                ArrayList<TaskOne> aList = taskOnePro.getTaskByStatus(pageNow, taskStatus); // 获取指定状态的任务列表
                System.out.println("findrenwu test: " + aList); // 打印任务列表

                // 对任务列表按照发布时间倒序排序
                Collections.sort(aList, new Comparator<TaskOne>() {
                    @Override
                    public int compare(TaskOne t1, TaskOne t2) {
                        return t2.getAssignDate().compareTo(t1.getAssignDate());
                    }
                });

                int pageCount = taskOnePro.getPageCount(); // 获取总页数
                // 将查询结果和分页信息存储到请求对象中
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");
                // 转发请求到显示任务数据的页面
                request.getRequestDispatcher("adminfiles/listrenwu.jsp").forward(request, response);
            } catch (Exception e) { // 捕获异常并打印堆栈信息
                e.printStackTrace();
            }
        } else if (flag.equals("findTask1")) { // 如果"flag"等于"findTask1"，表示需要按时间范围查找任务
            String assigndate1 = request.getParameter("assigndate1"); // 获取起始时间
            String assigndate2 = request.getParameter("assigndate2"); // 获取结束时间

            System.out.println("findTaskTime 起时间: " + assigndate1); // 打印起始时间
            System.out.println("findTaskTime 止时间: " + assigndate2); // 打印结束时间
            String s_pageNow = request.getParameter("pageNow"); // 获取当前页码
            try {
                int pageNow = Integer.parseInt(s_pageNow); // 将字符串类型的页码转换为整数
                if (pageNow <= 0) {
                    pageNow = 1; // 确保页码不小于1
                }
                System.out.println("findTask pageNow test: " + pageNow); // 打印当前页码
                TaskOnePro taskonePro = new TaskOnePro(); // 创建任务处理对象
                ArrayList<TaskOne> aList = taskonePro.getTaskPageByTime(pageNow, assigndate1, assigndate2); // 获取指定时间范围的任务列表

                // 对任务列表按照发布时间倒序排序
                Collections.sort(aList, new Comparator<TaskOne>() {
                    @Override
                    public int compare(TaskOne t1, TaskOne t2) {
                        return t2.getAssignDate().compareTo(t1.getAssignDate());
                    }
                });

                int pageCount = taskonePro.getPageCount(); // 获取总页数
                // 将查询结果和分页信息存储到请求对象中
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");
                // 转发请求到显示任务数据的页面
                request.getRequestDispatcher("userfiles/taskfordown.jsp").forward(request, response);
            } catch (Exception e) { // 捕获异常并打印堆栈信息
                e.printStackTrace();
            }
        } else if (flag.equals("findTask2")) { // 如果"flag"等于"findTask2"，表示需要按时间范围查找任务
            String assigndate1 = request.getParameter("assigndate1"); // 获取起始时间
            String assigndate2 = request.getParameter("assigndate2"); // 获取结束时间

            System.out.println("findTaskTime 起时间: " + assigndate1); // 打印起始时间
            System.out.println("findTaskTime 止时间: " + assigndate2); // 打印结束时间
            String s_pageNow = request.getParameter("pageNow"); // 获取当前页码
            try {
                int pageNow = Integer.parseInt(s_pageNow); // 将字符串类型的页码转换为整数
                if (pageNow <= 0) {
                    pageNow = 1; // 确保页码不小于1
                }
                System.out.println("findTask pageNow test: " + pageNow); // 打印当前页码
                TaskOnePro taskonePro = new TaskOnePro(); // 创建任务处理对象
                ArrayList<TaskOne> aList = taskonePro.getTaskPageByTime(pageNow, assigndate1, assigndate2); // 获取指定时间范围的任务列表

                // 对任务列表按照发布时间倒序排序
                Collections.sort(aList, new Comparator<TaskOne>() {
                    @Override
                    public int compare(TaskOne t1, TaskOne t2) {
                        return t2.getAssignDate().compareTo(t1.getAssignDate());
                    }
                });

                int pageCount = taskonePro.getPageCount(); // 获取总页数
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

    /**
     * 处理POST请求的方法
     * 直接调用doGet方法处理POST请求
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response); // 调用doGet方法
    }
}
