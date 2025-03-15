package BeanProcess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import DatabaseConnect.ConnectDB;
import model.Log;

public class LogPro {

    private Connection ct = null;
    private ResultSet rs = null;
    private PreparedStatement sta = null;
    private int rowCount;
    private int pageSize = 10;
    private int pageCount;

    public int getPageCount() {
        String sql = "select count(*) from log";
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

    public ArrayList<Log> getLogsByPage(int pageNow) {
        ArrayList<Log> al = new ArrayList<Log>();
        String sql = "select * from log limit " + (pageNow - 1) * pageSize + "," + pageSize;
        try {
            ct = new ConnectDB().getConn();
            sta = ct.prepareStatement(sql);
            rs = sta.executeQuery();
            while (rs.next()) {
                Log log = new Log();
                log.setLogID(rs.getInt("logid"));
                log.setLoginDate(rs.getDate("logindate"));
                log.setUserID(rs.getInt("userid"));
                al.add(log); //
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.closeM();
        }
        return al;
    }

    //get all log method
    public ArrayList<Log> getAllLogs() {
        ArrayList<Log> logList = new ArrayList<Log>();
        String sql = "select * from log";
        try {
            ConnectDB cdb = new ConnectDB();
            ct = cdb.getConn();
            sta = ct.prepareStatement(sql);
            rs = sta.executeQuery();
            while (rs.next()) {
                Log log = new Log();
                log.setLogID(rs.getInt("logid"));
                log.setLoginDate(rs.getDate("logindate"));
                log.setUserID(rs.getInt("userid"));
                logList.add(log);
            }
        } catch (Exception ex) {
            // TODO: handle exception
            ex.printStackTrace();
        } finally {
            this.closeM();
        }
        return logList;
    }

    //add log when user login
    public boolean addLog(int userid, Date loginDate) {
        boolean b = false;
        String sql = "insert into log (userid,logindate) values('" + userid + "','" + loginDate + "')";
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
