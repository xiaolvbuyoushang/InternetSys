package BeanProcess;

import DatabaseConnect.ConnectDB;
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

    //12.11新增方法
    public ArrayList<TaskOne> getTaskPageByTime(int pageNow, String date1, String date2) {
        ArrayList<TaskOne> al = new ArrayList<TaskOne>();
        Date time1 = Date.valueOf(date1);
        Date time2 = Date.valueOf(date2);
        System.out.println(time1 + "  传入的开始时间  ");
        System.out.println(time2 + "  传入的结束时间  ");


        String sql = "SELECT * FROM taskone where DATE_FORMAT(assigndate,'%Y-%m-%d') between '" + time1 + "' AND '" + time2 + "' limit " + (pageNow - 1) * pageSize + "," + pageSize;

        try {
            // 获取数据库连接
            ct = new ConnectDB().getConn();

            // 创建预编译的 SQL 语句对象
            sta = ct.prepareStatement(sql);

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
        String sql = "select count(*) from taskone";
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
        String sql = "select * from taskone where status = '" + status + "' limit " + (pageNow - 1) * pageSize + "," + pageSize;
        try {
            ct = new ConnectDB().getConn();
            sta = ct.prepareStatement(sql);
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
                al.add(task); //
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
        String sql = "select * from taskone where level = '" + level + "' limit " + (pageNow - 1) * pageSize + "," + pageSize;
        try {
            ct = new ConnectDB().getConn();
            sta = ct.prepareStatement(sql);
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
                al.add(task); //
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.closeM();
        }
        return al;
    }

    public ArrayList<TaskOne> getTasksByPage(int pageNow) {
        ArrayList<TaskOne> al = new ArrayList<TaskOne>();
        String sql = "select * from taskone limit " + (pageNow - 1) * pageSize + "," + pageSize;
        try {
            ct = new ConnectDB().getConn();
            sta = ct.prepareStatement(sql);
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
                al.add(task); //
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.closeM();
        }
        return al;
    }

    public boolean updateTask(int taskid) {
        boolean b = false;
        String sql = "update taskone set status = 1 where taskid = '" + taskid + "'";
        try {
            ConnectDB cdb = new ConnectDB();
            ct = cdb.getConn();
            sta = ct.prepareStatement(sql);
            int a = sta.executeUpdate();
            if (a == 1) {
                b = true;
            }
        } catch (Exception ex) {
            // TODO: handle exception
            ex.printStackTrace();
        } finally {
            this.closeM();
        }
        return b;
    }

    public boolean addTask(String tasktype, java.util.Date assignDate, int status, String content, int companyid, int level) {
        boolean b = false;
        String sql = "insert into taskone (tasktype,assigndate,status,content,companyid,level) values('"
                + "" + tasktype + "','" + assignDate + "','" + status + "','" + content + "','" + companyid + "','" + level + "')";
        try {
            ConnectDB cdb = new ConnectDB();
            ct = cdb.getConn();
            sta = ct.prepareStatement(sql);
            int a = sta.executeUpdate();
            if (a == 1) {
                b = true;
            }
        } catch (Exception ex) {
            // TODO: handle exception
            ex.printStackTrace();
        } finally {
            this.closeM();
        }
        return b;
    }

    public void closeM() {
        if (rs != null) {
            try {
                rs.close();
                rs = null;
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if (ct != null) {
            try {
                ct.close();
                ct = null;
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if (sta != null) {
            try {
                sta.close();
                sta = null;
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

}
