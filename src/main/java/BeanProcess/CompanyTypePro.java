package BeanProcess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.CompanyType;
import DatabaseConnect.ConnectDB;

public class CompanyTypePro {

    private Connection ct = null;
    private ResultSet rs = null;
    private PreparedStatement sta = null;

    public ArrayList<CompanyType> getAllCompanyType() {
        ArrayList<CompanyType> companyTypeList = new ArrayList<CompanyType>();
        String sql = "select * from companytype";
        try {
            ConnectDB cdb = new ConnectDB();
            ct = cdb.getConn();
            sta = ct.prepareStatement(sql);
            rs = sta.executeQuery();
            while (rs.next()) {
                CompanyType company = new CompanyType();
                company.setType(rs.getString("type"));
                companyTypeList.add(company);
            }
        } catch (Exception ex) {
            // TODO: handle exception
            ex.printStackTrace();
        } finally {
            this.closeM();
        }
        return companyTypeList;
    }

    public boolean updateCompanyType(int id, String companyType) {
        boolean b = false;
        String sql = "UPDATE companytype SET companyname = '" + companyType + "' WHERE companyid = '" + id + "'";
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

    public int getTypeID(String companyType) {
        int id = 0;
        String sql = "select typeid from companytype where type = '" + companyType + "'";
        try {
            ConnectDB cdb = new ConnectDB();
            ct = cdb.getConn();
            sta = ct.prepareStatement(sql);
            rs = sta.executeQuery();
            ;
            if (rs.next()) {
                id = rs.getInt("typeid");
            }
        } catch (Exception ex) {
            // TODO: handle exception
            ex.printStackTrace();
        } finally {
            this.closeM();
        }
        return id;
    }

    public String getTypeName(int typeid) {
        String id = "";
        String sql = "select type from companytype where typeid = '" + typeid + "'";
        try {
            ConnectDB cdb = new ConnectDB();
            ct = cdb.getConn();
            sta = ct.prepareStatement(sql);
            rs = sta.executeQuery();
            ;
            if (rs.next()) {
                id = rs.getString("type");
            }
        } catch (Exception ex) {
            // TODO: handle exception
            ex.printStackTrace();
        } finally {
            this.closeM();
        }
        return id;
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
