package BeanProcess;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DatabaseConnect.ConnectDB;
import model.TaskOne;

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

        //问题，查不到数据。。。。
        String sql = "SELECT * FROM taskone where DATE_FORMAT(assigndate,'%Y-%m-%d') between '" + time1 + "' AND '" + time2 + "' limit " + (pageNow - 1) * pageSize + "," + pageSize;

        try {
            ct = new ConnectDB().getConn();
            sta = ct.prepareStatement(sql);
            rs = sta.executeQuery();

            while (rs.next()) {
                while (rs.next()) {
                    TaskOne task = new TaskOne();
                    task.setTaskID(rs.getInt("taskid"));
                    task.setTaskType(rs.getString("tasktype"));
                    task.setAssignDate(rs.getDate("assigndate"));
                    task.setStatus(rs.getInt("status"));
                    task.setContent(rs.getString("content"));
                    task.setCompanyID(rs.getInt("companyid"));
                    task.setLevel(rs.getInt("level"));
                    al.add(task);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.closeM();
        }
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
