package controller;

import BeanProcess.UserPro;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet实现类：AddScoreServlet
 * 该类用于处理增加用户积分的操作。
 */
public class AddScoreServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // 序列化版本号，用于标识类的版本

    /**
     * 构造方法，初始化Servlet实例
     */
    public AddScoreServlet() {
        super(); // 调用父类构造方法
    }

    /**
     * 处理POST请求的方法
     * 根据漏洞等级增加用户积分
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求编码为UTF-8，防止乱码
        request.setCharacterEncoding("UTF-8");

        System.out.println("AddScoreServlet start: "); // 打印日志，表示积分增加开始

        // 获取请求参数
        String username = request.getParameter("username"); // 获取用户名
        String levelStr = request.getParameter("level"); // 获取漏洞等级

        // 打印获取到的参数
        System.out.println("Username: " + username);
        System.out.println("Level: " + levelStr);

        // 检查level参数是否为空
        if (levelStr == null || levelStr.isEmpty()) {
            System.out.println("Level parameter is missing or empty.");
            request.setAttribute("message", "积分增加失败！漏洞等级参数缺失或为空。");
            request.getRequestDispatcher("result.jsp").forward(request, response);
            return;
        }

        // 将level参数转换为整数
        int level = Integer.parseInt(levelStr);
        System.out.println("Parsed Level: " + level);

        // 根据漏洞等级计算增加的积分
        int scoreToAdd = 0;
        switch (level) {
            case 1:
                scoreToAdd = 10;
                break;
            case 2:
                scoreToAdd = 50;
                break;
            case 3:
                scoreToAdd = 100;
                break;
            case 4:
                scoreToAdd = 200;
                break;
            default:
                scoreToAdd = 0;
                break;
        }
        System.out.println("Score to Add: " + scoreToAdd);

        // 更新用户积分
        UserPro userPro = new UserPro(); // 创建用户处理对象
        boolean success = userPro.addScore(username, scoreToAdd); // 调用增加积分方法
        System.out.println("Add Score Success: " + success);

        // 根据增加积分的结果设置不同的请求属性
        if (success) {
            request.setAttribute("message", "积分增加成功！");
        } else {
            request.setAttribute("message", "积分增加失败！");
        }

        // 转发请求到结果页面
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    /**
     * 处理GET请求的方法
     * 直接调用doPost方法处理GET请求
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response); // 调用doPost方法
    }
}
