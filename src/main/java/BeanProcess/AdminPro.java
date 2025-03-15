package BeanProcess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DatabaseConnect.ConnectDB;


public class AdminPro {

    private Connection ct = null;
    private ResultSet rs = null;
    private PreparedStatement sta = null;

    //admin login method
    public boolean checkAdminInput(String u, String p) {
        boolean b = false;
        String sql = "select adminPass from admin where adminName='" + u + "'";
        try {
            ConnectDB cdb = new ConnectDB();
            ct = cdb.getConn();
            sta = ct.prepareStatement(sql);
            rs = sta.executeQuery();
            if (rs.next()) {
                if (rs.getString("adminPass").equals(p)) {
//					System.out.println(rs.getString("passwd"));
                    b = true;
                } else {
                    b = false;
                }
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
