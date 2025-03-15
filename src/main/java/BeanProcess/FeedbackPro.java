package BeanProcess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DatabaseConnect.ConnectDB;

public class FeedbackPro {

    private Connection ct = null;
    private ResultSet rs = null;
    private PreparedStatement sta = null;


    public boolean addFeedback(int taskid, String content) {
        boolean b = false;
        String sql = "insert into feedback (taskid,content) values('" + taskid + "','" + content + "')";
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

    public boolean updateFeedback(int taskid, int status) {
        boolean b = false;
        String sql = "update taskone set status='" + status + "' where taskid='" + taskid + "'";
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
