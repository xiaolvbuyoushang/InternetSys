package controller;

import BeanProcess.DisposePro;
import model.Dispose;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Servlet实现类：DisposeServlet
 * 该类用于处理与漏洞处置相关的各种操作，例如分页查询、添加处置记录、查找处置记录等。
 */
public class DisposeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // 序列化版本号，用于标识类的版本

    /**
     * 构造方法，初始化Servlet实例
     */
    public DisposeServlet() {
        super(); // 调用父类构造方法
    }

    /**
     * 处理GET请求的方法
     * 根据请求参数执行不同的操作
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("DisposeServlet start: "); // 打印日志，表示处置开始
        String flag = (String) request.getParameter("flag"); // 获取请求参数"flag"，用于判断执行的操作类型

        // 根据"flag"参数值执行不同的操作
        if (flag.equals("fenye")) { // 如果"flag"等于"fenye"，表示需要进行分页查询
            String s_pageNow = request.getParameter("pageNow"); // 获取当前页码
            try {
                int pageNow = Integer.parseInt(s_pageNow); // 将字符串类型的页码转换为整数
                if (pageNow <= 0) {
                    pageNow = 1; // 确保页码不小于1
                }
                DisposePro ubc = new DisposePro(); // 创建处置处理对象
                List<Dispose> aList = ubc.getDisposesByPage(pageNow); // 获取当前页的处置列表
                System.out.println("Dispose: " + aList.size()); // 打印处置数量
                int pageCount = ubc.getPageCount(); // 获取总页数
                // 将查询结果和分页信息存储到请求对象中
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");
                // 转发请求到显示处置数据的页面
                request.getRequestDispatcher("auditorfiles/listdispose.jsp").forward(request, response);
            } catch (Exception e) { // 捕获异常并打印堆栈信息
                e.printStackTrace();
            }
        } else if (flag.equals("addDispose")) { // 如果"flag"等于"addDispose"，表示需要添加处置记录
            // 获取处置相关信息
            String taskid = request.getParameter("taskid");
            String disposeStatus = request.getParameter("disposeStatus");
            String auditorID = request.getParameter("auditorID");
            String basis = request.getParameter("basis");

            // 解决中文乱码问题
            disposeStatus = new String(disposeStatus.getBytes("iso-8859-1"), "utf-8");
            basis = new String(basis.getBytes("iso-8859-1"), "utf-8");

            // 获取当前时间戳
            Timestamp loginDate = new Timestamp(new Date().getTime());
            DisposePro disposePro = new DisposePro(); // 创建处置处理对象
            boolean b = disposePro.addDispose(taskid, loginDate, disposeStatus, auditorID, basis); // 调用添加处置方法

            // 根据添加处置的结果设置不同的请求属性
            if (b) {
                request.setAttribute("message", "处置记录添加成功！");
                request.setAttribute("redirectUrl", "index.jsp");
            } else {
                request.setAttribute("message", "处置记录添加失败！");
                request.setAttribute("redirectUrl", "index.jsp");
            }
            // 转发请求到结果页面
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } else if (flag.equals("findDispose")) { // 如果"flag"等于"findDispose"，表示需要按任务ID查找处置记录
            String taskId = request.getParameter("taskId"); // 获取任务ID
            String s_pageNow = request.getParameter("pageNow"); // 获取当前页码
            try {
                int pageNow = Integer.parseInt(s_pageNow); // 将字符串类型的页码转换为整数
                if (pageNow <= 0) {
                    pageNow = 1; // 确保页码不小于1
                }
                System.out.println("findDispose pageNow test: " + pageNow); // 打印当前页码
                DisposePro disposePro = new DisposePro(); // 创建处置处理对象
                List<Dispose> aList = disposePro.getDisposeByTaskId(pageNow, taskId); // 获取指定任务ID的处置列表
                System.out.println("findDispose test: " + aList); // 打印处置列表
                int pageCount = disposePro.getPageCount(); // 获取总页数
                // 将查询结果和分页信息存储到请求对象中
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");
                // 转发请求到显示处置数据的页面
                request.getRequestDispatcher("auditorfiles/listdispose.jsp").forward(request, response);
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
