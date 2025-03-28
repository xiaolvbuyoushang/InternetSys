package BeanProcess;

import DatabaseConnect.ConnectDB;
import model.ExchangeRecord;

import java.sql.*;
import java.util.ArrayList;

// ExchangeRecordPro类用于处理与兑换记录相关的业务逻辑，包括数据库操作（查询、插入、更新、删除）
public class ExchangeRecordPro {
    // 数据库连接对象
    private Connection ct = null;
    // 结果集对象，用于存储数据库查询结果
    private ResultSet rs = null;
    // 预编译语句对象，用于执行SQL语句
    private PreparedStatement sta = null;

    // 获取用户的兑换记录
    public ArrayList<ExchangeRecord> getExchangeRecordsByUserID(int userID) {
        ArrayList<ExchangeRecord> exchangeRecords = new ArrayList<>();
        // SQL查询语句，用于获取指定用户ID的兑换记录
        String sql = "SELECT recordid, userid, giftid, exchangetime " +
                     "FROM exchangerecords " +
                     "WHERE userid = ?";

        try {
            // 通过ConnectDB类获取数据库连接
            ct = new ConnectDB().getConn();
            // 创建预编译语句对象
            sta = ct.prepareStatement(sql);
            // 设置参数
            sta.setInt(1, userID);
            // 执行查询并获取结果集
            rs = sta.executeQuery();
            while (rs.next()) {
                // 创建一个ExchangeRecord对象
                ExchangeRecord record = new ExchangeRecord();
                // 设置ExchangeRecord对象的属性值，从结果集中获取相应字段的值
                record.setRecordID(rs.getInt("recordid"));
                record.setUserID(rs.getInt("userid"));
                record.setGiftID(rs.getInt("giftid"));
                record.setExchangeTime(rs.getTimestamp("exchangetime"));
                // 将ExchangeRecord对象添加到ArrayList中
                exchangeRecords.add(record);
            }
        } catch (Exception e) {
            // 如果发生异常，打印异常堆栈信息
            e.printStackTrace();
        } finally {
            // 无论是否发生异常，都关闭相关数据库资源
            this.closeM();
        }
        // 返回包含查询结果的ArrayList
        return exchangeRecords;
    }

    // 关闭数据库资源（结果集、连接、预编译语句）的方法
    public void closeM() {
        if (rs != null) {
            try {
                // 关闭结果集
                rs.close();
                rs = null;
            } catch (SQLException e) {
                // 捕获并打印关闭结果集时可能发生的SQL异常
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
