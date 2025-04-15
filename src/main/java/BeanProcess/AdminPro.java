package BeanProcess;

import DatabaseConnect.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class AdminPro {

    private Connection ct = null; // 数据库连接对象
    private ResultSet rs = null; // 查询结果集对象
    private PreparedStatement sta = null; // 预处理SQL语句对象

    /**
     * 管理员登录验证方法
     * 该方法用于检查管理员输入的用户名和密码是否正确。
     * 如果用户名和密码匹配，则返回true；否则返回false。
     */
    public boolean checkAdminInput(String u, String p) {
        boolean b = false; // 定义一个布尔变量，用于存储验证结果，默认为false

        // 构造SQL查询语句，查询指定用户名的密码
        String sql = "select adminPass from admin where adminName='" + u + "'";

        try {
            ConnectDB cdb = new ConnectDB(); // 创建数据库连接工具对象
            ct = cdb.getConn(); // 获取数据库连接
            sta = ct.prepareStatement(sql); // 使用预处理SQL语句对象执行查询
            rs = sta.executeQuery(); // 执行查询并获取结果集

            // 如果查询结果不为空（即存在该用户名）
            if (rs.next()) {
                // 比较查询到的密码与输入的密码是否一致
                if (rs.getString("adminPass").equals(p)) {
                    b = true; // 如果一致，设置验证结果为true
                } else {
                    b = false; // 如果不一致，设置验证结果为false
                }
            }
        } catch (Exception ex) { // 捕获异常并打印堆栈信息
            ex.printStackTrace();
        } finally { // 无论是否发生异常，都关闭数据库资源
            this.closeM(); // 调用关闭资源方法
        }

        return b; // 返回验证结果
    }

    public int getAdminID(String userCode) {
        int adminID = -1;
        String sql = "SELECT adminID FROM admin WHERE adminName = ?";

        try {
            ConnectDB cdb = new ConnectDB();
            ct = cdb.getConn();
            sta = ct.prepareStatement(sql);
            sta.setString(1, userCode);
            rs = sta.executeQuery();
            if (rs.next()) {
                adminID = rs.getInt("adminID");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeResources(rs, sta, ct);
        }
        return adminID;
    }

    public static void closeResources(ResultSet rs, PreparedStatement sta, Connection ct) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (sta != null) {
            try {
                sta.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (ct != null) {
            try {
                ct.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 关闭数据库资源方法
     * 该方法用于关闭ResultSet、Connection和PreparedStatement对象，
     * 防止资源泄漏。
     */
    public void closeM() {
        // 如果ResultSet对象不为空，关闭它
        if (rs != null) {
            try {
                rs.close(); // 关闭结果集
                rs = null; // 将结果集置为null
            } catch (SQLException e) {
                e.printStackTrace(); // 捕获并打印关闭结果集时的异常
            }
        }

        // 如果Connection对象不为空，关闭它
        if (ct != null) {
            try {
                ct.close(); // 关闭数据库连接
                ct = null; // 将连接置为null
            } catch (SQLException e) {
                e.printStackTrace(); // 捕获并打印关闭连接时的异常
            }
        }

        // 如果PreparedStatement对象不为空，关闭它
        if (sta != null) {
            try {
                sta.close(); // 关闭预处理SQL语句对象
                sta = null; // 将预处理SQL语句对象置为null
            } catch (SQLException e) {
                e.printStackTrace(); // 捕获并打印关闭预处理SQL语句对象时的异常
            }
        }
    }
}
