package tools;

import BeanProcess.AuditorPro;
import DatabaseConnect.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class AuditorSelect {

    private Connection ct = null;
    private ResultSet rs = null;
    private PreparedStatement sta = null;

    private AuditorPro auditorPro = new AuditorPro();


    // 根据 auditorID 查找 auditorName 的方法
    public String getAuditorNameByID(int auditorID) {
        return auditorPro.getAuditorNameByID(auditorID);
    }

    // 根据 auditorName 查找 auditorID 的方法
    public int getAuditorIDByName(String auditorName) {
        return auditorPro.getAuditorIDByName(auditorName);
    }


    public String getAuditorNameById(int auditorID) {
        String auditorName = "";
        String sql = "SELECT auditorName FROM auditor WHERE auditorID = ?";

        try {
            ConnectDB cdb = new ConnectDB();
            ct = cdb.getConn();
            sta = ct.prepareStatement(sql);
            sta.setInt(1, auditorID);
            rs = sta.executeQuery();
            if (rs.next()) {
                auditorName = rs.getString("auditorName");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeResources(rs, sta, ct);
        }
        return auditorName;
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

}
