package BeanProcess;

import DatabaseConnect.ConnectDB;
import model.Auditor;
import model.TaskOne;

import java.sql.*;
import java.util.ArrayList;

public class TaskOnePro {

    private Connection ct = null;
    private ResultSet rs = null;
    private PreparedStatement sta = null;
    private int rowCount;
    private int pageSize = 10;
    private int pageCount;

    // 12.11新增方法
    public ArrayList<TaskOne> getTaskPageByTime(int pageNow, String date1, String date2) {
        ArrayList<TaskOne> al = new ArrayList<TaskOne>();
        Date time1 = Date.valueOf(date1);
        Date time2 = Date.valueOf(date2);
        System.out.println(time1 + "  传入的开始时间  ");
        System.out.println(time2 + "  传入的结束时间  ");

        // 使用预编译语句防止 SQL 注入
        String sql = "SELECT * FROM taskone WHERE DATE_FORMAT(assigndate, '%Y-%m-%d') BETWEEN ? AND ? LIMIT ?, ?";

        try {
            // 获取数据库连接
            ct = new ConnectDB().getConn();

            // 创建预编译的 SQL 语句对象
            sta = ct.prepareStatement(sql);
            sta.setDate(1, new java.sql.Date(time1.getTime()));
            sta.setDate(2, new java.sql.Date(time2.getTime()));
            sta.setInt(3, (pageNow - 1) * pageSize);
            sta.setInt(4, pageSize);

            // 执行查询并获取结果集
            rs = sta.executeQuery();

            // 遍历结果集中的每一行数据
            while (rs.next()) {
                // 创建一个新的 TaskOne 对象
                TaskOne task = new TaskOne();

                // 从结果集中获取 taskid 字段的值，并设置到 TaskOne 对象中
                task.setTaskID(rs.getInt("taskid"));

                // 从结果集中获取 tasktype 字段的值，并设置到 TaskOne 对象中
                task.setTaskType(rs.getString("tasktype"));

                // 从结果集中获取 assigndate 字段的值，并设置到 TaskOne 对象中
                task.setAssignDate(rs.getDate("assigndate"));

                // 从结果集中获取 status 字段的值，并设置到 TaskOne 对象中
                task.setStatus(rs.getInt("status"));

                // 从结果集中获取 content 字段的值，并设置到 TaskOne 对象中
                task.setContent(rs.getString("content"));

                // 从结果集中获取 companyid 字段的值，并设置到 TaskOne 对象中
                task.setCompanyID(rs.getInt("companyid"));

                // 从结果集中获取 level 字段的值，并设置到 TaskOne 对象中
                task.setLevel(rs.getInt("level"));

                // 从结果集中获取 audit_comment 字段的值，并设置到 TaskOne 对象中
                task.setAuditComment(rs.getString("audit_comment")); // 添加审核意见

                // 将设置好属性的 TaskOne 对象添加到 ArrayList 中
                al.add(task);
            }
        } catch (Exception e) {
            // 如果发生异常，打印异常堆栈信息
            e.printStackTrace();
        } finally {
            // 无论是否发生异常，都关闭相关数据库资源
            this.closeM();
        }
        // 返回包含查询结果的 ArrayList
        return al;
    }

    public int getPageCount() {
        String sql = "SELECT COUNT(*) FROM taskone";
        try {
            ct = new ConnectDB().getConn();
            sta = ct.prepareStatement(sql);
            rs = sta.executeQuery();
            if (rs.next()) {
                rowCount = rs.getInt(1);
            }
            if (rowCount % pageSize == 0) {
                pageCount = rowCount / pageSize;
            } else {
                pageCount = rowCount / pageSize + 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.closeM();
        }
        return pageCount;
    }

    public ArrayList<TaskOne> getTaskByStatus(int pageNow, int status) {
        ArrayList<TaskOne> al = new ArrayList<TaskOne>();
        // 使用预编译语句防止 SQL 注入
        String sql = "SELECT * FROM taskone WHERE status = ? LIMIT ?, ?";

        try {
            ct = new ConnectDB().getConn();
            sta = ct.prepareStatement(sql);
            sta.setInt(1, status);
            sta.setInt(2, (pageNow - 1) * pageSize);
            sta.setInt(3, pageSize);

            rs = sta.executeQuery();
            while (rs.next()) {
                TaskOne task = new TaskOne();
                task.setTaskID(rs.getInt("taskid"));
                task.setTaskType(rs.getString("tasktype"));
                task.setAssignDate(rs.getDate("assigndate"));
                task.setStatus(rs.getInt("status"));
                task.setContent(rs.getString("content"));
                task.setCompanyID(rs.getInt("companyid"));
                task.setLevel(rs.getInt("level"));
                task.setAuditComment(rs.getString("auditcomment")); // 添加审核意见
                al.add(task);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.closeM();
        }
        return al;
    }

    public ArrayList<TaskOne> getTaskByLevel(int pageNow, int level) {
        ArrayList<TaskOne> al = new ArrayList<TaskOne>();
        // 使用预编译语句防止 SQL 注入
        String sql = "SELECT * FROM taskone WHERE level = ? LIMIT ?, ?";

        try {
            ct = new ConnectDB().getConn();
            sta = ct.prepareStatement(sql);
            sta.setInt(1, level);
            sta.setInt(2, (pageNow - 1) * pageSize);
            sta.setInt(3, pageSize);

            rs = sta.executeQuery();
            while (rs.next()) {
                TaskOne task = new TaskOne();
                task.setTaskID(rs.getInt("taskid"));
                task.setTaskType(rs.getString("tasktype"));
                task.setAssignDate(rs.getDate("assigndate"));
                task.setStatus(rs.getInt("status"));
                task.setContent(rs.getString("content"));
                task.setCompanyID(rs.getInt("companyid"));
                task.setLevel(rs.getInt("level"));
                task.setAuditComment(rs.getString("auditcomment")); // 添加审核意见
                al.add(task);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.closeM();
        }
        return al;
    }

    public static boolean assignReviewer(int taskId, int auditorId) {
        boolean b = false;
        String sql = "UPDATE taskone SET auditorID = ? WHERE taskid = ?";

        Connection ct = null;
        PreparedStatement sta = null;

        try {
            ConnectDB cdb = new ConnectDB();
            ct = cdb.getConn();
            sta = ct.prepareStatement(sql);
            sta.setInt(1, auditorId);
            sta.setInt(2, taskId);
            int a = sta.executeUpdate();
            if (a == 1) {
                b = true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeResources(null, sta, ct);
        }
        return b;
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

    public ArrayList<TaskOne> getTasksByPage(int pageNow) {
        ArrayList<TaskOne> al = new ArrayList<TaskOne>();
        // 使用预编译语句防止 SQL 注入
        String sql = "SELECT * FROM taskone LIMIT ?, ?";

        try {
            ct = new ConnectDB().getConn();
            sta = ct.prepareStatement(sql);
            sta.setInt(1, (pageNow - 1) * pageSize);
            sta.setInt(2, pageSize);

            rs = sta.executeQuery();
            while (rs.next()) {
                TaskOne task = new TaskOne();
                task.setTaskID(rs.getInt("taskid"));
                task.setTaskType(rs.getString("tasktype"));
                task.setAssignDate(rs.getDate("assigndate"));
                task.setStatus(rs.getInt("status"));
                task.setContent(rs.getString("content"));
                task.setCompanyID(rs.getInt("companyid"));
                task.setLevel(rs.getInt("level"));
                task.setAuditComment(rs.getString("auditcomment")); // 添加审核意见
                al.add(task);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.closeM();
        }
        return al;
    }
    public boolean updateAuditStatus(int taskid, String status, String auditOpinion) {
        boolean b = false;
        // 使用预编译语句防止 SQL 注入
        String sql = "UPDATE taskone SET status = ?, auditcomment = ? WHERE taskid = ?";

        try {
            ConnectDB cdb = new ConnectDB();
            ct = cdb.getConn();
            sta = ct.prepareStatement(sql);
            sta.setString(1, status);
            sta.setString(2, auditOpinion);
            sta.setInt(3, taskid);
            int a = sta.executeUpdate();
            if (a == 1) {
                b = true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            this.closeM();
        }
        return b;
    }
    public boolean updateTask(int taskid) {
        boolean b = false;
        // 使用预编译语句防止 SQL 注入
        String sql = "UPDATE taskone SET status = 1 WHERE taskid = ?";

        try {
            ConnectDB cdb = new ConnectDB();
            ct = cdb.getConn();
            sta = ct.prepareStatement(sql);
            sta.setInt(1, taskid);
            int a = sta.executeUpdate();
            if (a == 1) {
                b = true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            this.closeM();
        }
        return b;
    }

    public boolean addTask(String tasktype, java.util.Date assignDate, int status, String content, int companyid, int level) {
        boolean b = false;
        // 使用预编译语句防止 SQL 注入
        String sql = "INSERT INTO taskone (tasktype, assigndate, status, content, companyid, level) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            ConnectDB cdb = new ConnectDB();
            ct = cdb.getConn();
            sta = ct.prepareStatement(sql);
            sta.setString(1, tasktype);
            sta.setDate(2, new java.sql.Date(assignDate.getTime()));
            sta.setInt(3, status);
            sta.setString(4, content);
            sta.setInt(5, companyid);
            sta.setInt(6, level);
            int a = sta.executeUpdate();
            if (a == 1) {
                b = true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            this.closeM();
        }
        return b;
    }

    public static boolean isAuditorExists(int auditorId) {
        boolean exists = false;
        String sql = "SELECT COUNT(*) FROM auditor WHERE auditorID = ?";

        Connection ct = null;
        PreparedStatement sta = null;
        ResultSet rs = null;

        try {
            ConnectDB cdb = new ConnectDB();
            ct = cdb.getConn();
            sta = ct.prepareStatement(sql);
            sta.setInt(1, auditorId);
            rs = sta.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    exists = true;
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeResources(rs, sta, ct);
        }
        return exists;
    }

    public ArrayList<Auditor> getAuditors() {
        ArrayList<Auditor> auditors = new ArrayList<Auditor>();
        String sql = "SELECT auditorID, auditorName FROM auditor";

        Connection ct = null;
        ResultSet rs = null;
        PreparedStatement sta = null;

        try {
            ct = new ConnectDB().getConn();
            sta = ct.prepareStatement(sql);
            rs = sta.executeQuery();

            while (rs.next()) {
                Auditor auditor = new Auditor();
                auditor.setAuditorID(rs.getInt("auditorID"));
                auditor.setAuditorName(rs.getString("auditorName"));
                auditors.add(auditor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, sta, ct);
        }
        return auditors;
    }

    public void closeM() {
        if (rs != null) {
            try {
                rs.close();
                rs = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (ct != null) {
            try {
                ct.close();
                ct = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (sta != null) {
            try {
                sta.close();
                sta = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
