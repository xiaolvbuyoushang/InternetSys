package BeanProcess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DatabaseConnect.ConnectDB;
import model.Company;

public class CompanyPro {

    // 定义数据库连接、结果集和预编译语句对象
    private Connection ct = null;
    private ResultSet rs = null;
    private PreparedStatement sta = null;

    // 新加的分页相关变量
    private int rowCount; // 总记录数
    private int pageSize = 10; // 每页显示的记录数
    private int pageCount; // 总页数

    // 获取总页数的方法
    public int getPageCount() {
        String sql = "select count(*) from company"; // SQL语句，用于获取company表中的总记录数
        try {
            ct = new ConnectDB().getConn(); // 获取数据库连接
            sta = ct.prepareStatement(sql); // 预编译SQL语句
            rs = sta.executeQuery(); // 执行查询
            if (rs.next()) { // 如果结果集有数据
                rowCount = rs.getInt(1); // 获取总记录数
            }
            // 计算总页数
            if (rowCount % pageSize == 0) {
                pageCount = rowCount / pageSize;
            } else {
                pageCount = rowCount / pageSize + 1;
            }
        } catch (Exception e) {
            e.printStackTrace(); // 打印异常信息
        } finally {
            this.closeM(); // 关闭数据库资源
        }
        return pageCount; // 返回总页数
    }

    // 根据页码和类型ID获取公司列表的方法
    public ArrayList<Company> getCompanysPageByID(int pageNow, int typeid) {
        ArrayList<Company> al = new ArrayList<Company>(); // 创建一个ArrayList对象，用于存储公司信息
        // SQL语句，用于根据类型ID和页码获取公司列表
        String sql = "select * from company where typeid = '" + typeid + "' limit " + (pageNow - 1) * pageSize + "," + pageSize;
        try {
            ct = new ConnectDB().getConn(); // 获取数据库连接
            sta = ct.prepareStatement(sql); // 预编译SQL语句
            rs = sta.executeQuery(); // 执行查询
            while (rs.next()) { // 遍历结果集
                Company company = new Company(); // 创建一个Company对象
                // 设置Company对象的各个属性
                company.setCompanyID(rs.getInt("companyid"));
                company.setCompanyName(rs.getString("companyname"));
                company.setAddress(rs.getString("address"));
                company.setTypeID(rs.getInt("typeid"));
                company.setMonitorName(rs.getString("monitorname"));
                company.setPhone(rs.getString("cellphone"));
                al.add(company); // 将Company对象添加到ArrayList中
            }
        } catch (Exception e) {
            e.printStackTrace(); // 打印异常信息
        } finally {
            this.closeM(); // 关闭数据库资源
        }
        return al; // 返回公司列表
    }

    // 根据页码获取公司列表的方法
    public ArrayList<Company> getCompanysByPage(int pageNow) {
        ArrayList<Company> al = new ArrayList<Company>(); // 创建一个ArrayList对象，用于存储公司信息
        // SQL语句，用于根据页码获取公司列表
        String sql = "select * from company limit " + (pageNow - 1) * pageSize + "," + pageSize;
        try {
            ct = new ConnectDB().getConn(); // 获取数据库连接
            sta = ct.prepareStatement(sql); // 预编译SQL语句
            rs = sta.executeQuery(); // 执行查询
            while (rs.next()) { // 遍历结果集
                Company company = new Company(); // 创建一个Company对象
                // 设置Company对象的各个属性
                company.setCompanyID(rs.getInt("companyid"));
                company.setCompanyName(rs.getString("companyname"));
                company.setAddress(rs.getString("address"));
                company.setTypeID(rs.getInt("typeid"));
                company.setMonitorName(rs.getString("monitorname"));
                company.setPhone(rs.getString("cellphone"));
                al.add(company); // 将Company对象添加到ArrayList中
            }
        } catch (Exception e) {
            e.printStackTrace(); // 打印异常信息
        } finally {
            this.closeM(); // 关闭数据库资源
        }
        return al; // 返回公司列表
    }

    // 根据公司名称获取公司ID的方法
    public int getCompanyID(String companyName) {
        int id = 0; // 初始化公司ID为0
        // SQL语句，用于根据公司名称获取公司ID
        String sql = "select companyid from company where companyname = '" + companyName + "'";
        try {
            ConnectDB cdb = new ConnectDB(); // 创建ConnectDB对象
            ct = cdb.getConn(); // 获取数据库连接
            sta = ct.prepareStatement(sql); // 预编译SQL语句
            rs = sta.executeQuery(); // 执行查询
            if (rs.next()) { // 如果结果集有数据
                id = rs.getInt("companyid"); // 获取公司ID
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // 打印异常信息
        } finally {
            this.closeM(); // 关闭数据库资源
        }
        return id; // 返回公司ID
    }

    // 根据公司ID删除公司的方法
    public boolean delCompany(String companyId) {
        boolean b = false; // 初始化删除标志为false
        // SQL语句，用于根据公司ID删除公司
        String sql = "delete from company where companyid = '" + companyId + "'";
        try {
            ConnectDB cdb = new ConnectDB(); // 创建ConnectDB对象
            ct = cdb.getConn(); // 获取数据库连接
            sta = ct.prepareStatement(sql); // 预编译SQL语句
            int a = sta.executeUpdate(); // 执行更新操作
            if (a == 1) { // 如果成功删除一条记录
                b = true; // 设置删除标志为true
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // 打印异常信息
        } finally {
            this.closeM(); // 关闭数据库资源
        }
        return b; // 返回删除标志
    }

    // 获取所有公司列表的方法
    public ArrayList<Company> getAllCompanies() {
        ArrayList<Company> companyList = new ArrayList<Company>(); // 创建一个ArrayList对象，用于存储公司信息
        String sql = "select * from company"; // SQL语句，用于获取所有公司信息
        try {
            ConnectDB cdb = new ConnectDB(); // 创建ConnectDB对象
            ct = cdb.getConn(); // 获取数据库连接
            sta = ct.prepareStatement(sql); // 预编译SQL语句
            rs = sta.executeQuery(); // 执行查询
            while (rs.next()) { // 遍历结果集
                Company company = new Company(); // 创建一个Company对象
                // 设置Company对象的各个属性
                company.setCompanyID(rs.getInt("companyid"));
                company.setCompanyName(rs.getString("companyname"));
                company.setAddress(rs.getString("address"));
                company.setTypeID(rs.getInt("typeid"));
                company.setMonitorName(rs.getString("monitorname"));
                company.setPhone(rs.getString("cellphone")); // 注意：这里应该是"cellphone"而不是"cellphont"
                companyList.add(company); // 将Company对象添加到ArrayList中
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // 打印异常信息
        } finally {
            this.closeM(); // 关闭数据库资源
        }
        return companyList; // 返回公司列表
    }

    // 根据公司ID获取类型ID的方法
    public int getTypeIDByID(int companyid) {
        int id = 0; // 初始化类型ID为0
        // SQL语句，用于根据公司ID获取类型ID
        String sql = "select typeid from company where companyid='" + companyid + "'";
        try {
            ConnectDB cdb = new ConnectDB(); // 创建ConnectDB对象
            ct = cdb.getConn(); // 获取数据库连接
            sta = ct.prepareStatement(sql); // 预编译SQL语句
            rs = sta.executeQuery(); // 执行查询
            if (rs.next()) { // 如果结果集有数据
                id = rs.getInt("typeid"); // 获取类型ID
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // 打印异常信息
        } finally {
            this.closeM(); // 关闭数据库资源
        }
        return id; // 返回类型ID
    }

    // 根据公司名称获取公司ID的方法
    public int getIDByName(String name) {
        int id = 0; // 初始化公司ID为0
        // SQL语句，用于根据公司名称获取公司ID
        String sql = "select companyid from company where companyname='" + name + "'";
        try {
            ConnectDB cdb = new ConnectDB(); // 创建ConnectDB对象
            ct = cdb.getConn(); // 获取数据库连接
            sta = ct.prepareStatement(sql); // 预编译SQL语句
            rs = sta.executeQuery(); // 执行查询
            if (rs.next()) { // 如果结果集有数据
                id = rs.getInt("companyid"); // 获取公司ID
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // 打印异常信息
        } finally {
            this.closeM(); // 关闭数据库资源
        }
        return id; // 返回公司ID
    }

    // 根据公司ID获取公司名称的方法
    public String getNameByID(int companyid) {
        String name = ""; // 初始化公司名称为空字符串
        // SQL语句，用于根据公司ID获取公司名称
        String sql = "select companyname from company where companyid ='" + companyid + "'";
        try {
            ConnectDB cdb = new ConnectDB(); // 创建ConnectDB对象
            ct = cdb.getConn(); // 获取数据库连接
            sta = ct.prepareStatement(sql); // 预编译SQL语句
            rs = sta.executeQuery(); // 执行查询
            if (rs.next()) { // 如果结果集有数据
                name = rs.getString("companyname"); // 获取公司名称
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // 打印异常信息
        } finally {
            this.closeM(); // 关闭数据库资源
        }
        System.out.println("CompanyPro getName Test: " + name); // 打印测试信息
        return name; // 返回公司名称
    }

    // 根据公司ID获取公司列表的方法
    public ArrayList<Company> getCompanyByID(int id) {
        ArrayList<Company> companyList = new ArrayList<Company>(); // 创建一个ArrayList对象，用于存储公司信息
        // SQL语句，用于根据公司ID获取公司列表
        String sql = "select * from company where companyid='" + id + "'";
        try {
            ConnectDB cdb = new ConnectDB(); // 创建ConnectDB对象
            ct = cdb.getConn(); // 获取数据库连接
            sta = ct.prepareStatement(sql); // 预编译SQL语句
            rs = sta.executeQuery(); // 执行查询
            while (rs.next()) { // 遍历结果集
                Company company = new Company(); // 创建一个Company对象
                // 设置Company对象的各个属性
                company.setCompanyID(rs.getInt("companyid"));
                company.setCompanyName(rs.getString("companyname"));
                company.setAddress(rs.getString("address"));
                company.setTypeID(rs.getInt("typeid"));
                company.setMonitorName(rs.getString("monitorname"));
                company.setPhone(rs.getString("cellphone"));
                companyList.add(company); // 将Company对象添加到ArrayList中
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // 打印异常信息
        } finally {
            this.closeM(); // 关闭数据库资源
        }
        return companyList; // 返回公司列表
    }

    // 添加公司信息的方法
    public boolean addCompany(String companyname, String address, int typeid, String name, String cellphone) {
        boolean b = false; // 初始化添加标志为false
        // SQL语句，用于添加公司信息
        String sql = "insert into company (companyname,address,typeid,monitorname,cellphone) values('" + companyname + "','" + address + "','" + typeid + "','" + name + "','" + cellphone + "')";
        try {
            ConnectDB cdb = new ConnectDB(); // 创建ConnectDB对象
            ct = cdb.getConn(); // 获取数据库连接
            sta = ct.prepareStatement(sql); // 预编译SQL语句
            int a = sta.executeUpdate(); // 执行更新操作
            if (a == 1) { // 如果成功添加一条记录
                b = true; // 设置添加标志为true
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // 打印异常信息
        } finally {
            this.closeM(); // 关闭数据库资源
        }
        return b; // 返回添加标志
    }

    // 根据公司ID更新公司信息的方法
    public boolean updateCompany(int id, String companyname, String address, int typeid, String monitorname, String cellphone) {
        boolean b = false; // 初始化更新标志为false
        // SQL语句，用于根据公司ID更新公司信息
        String sql = "UPDATE company SET companyname = '" + companyname + "', address = '" + address + "' , typeid = '" + typeid + "', monitorname = '" + monitorname + "', cellphone = '" + cellphone + "' WHERE companyid = '" + id + "'";
        try {
            ConnectDB cdb = new ConnectDB(); // 创建ConnectDB对象
            ct = cdb.getConn(); // 获取数据库连接
            sta = ct.prepareStatement(sql); // 预编译SQL语句
            int a = sta.executeUpdate(); // 执行更新操作
            if (a == 1) { // 如果成功更新一条记录
                b = true; // 设置更新标志为true
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // 打印异常信息
        } finally {
            this.closeM(); // 关闭数据库资源
        }
        return b; // 返回更新标志
    }

    // 关闭数据库资源的方法
    public void closeM() {
        if (rs != null) {
            try {
                rs.close(); // 关闭结果集
                rs = null; // 将结果集对象置为null
            } catch (SQLException e) {
                e.printStackTrace(); // 打印异常信息
            }
        }
        if (ct != null) {
            try {
                ct.close(); // 关闭数据库连接
                ct = null; // 将数据库连接对象置为null
            } catch (SQLException e) {
                e.printStackTrace(); // 打印异常信息
            }
        }
        if (sta != null) {
            try {
                sta.close(); // 关闭预编译语句
                sta = null; // 将预编译语句对象置为null
            } catch (SQLException e) {
                e.printStackTrace(); // 打印异常信息
            }
        }
    }

}