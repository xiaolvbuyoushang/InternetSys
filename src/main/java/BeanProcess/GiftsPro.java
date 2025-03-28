package BeanProcess;

import DatabaseConnect.ConnectDB;
import model.Gift;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// GiftsPro类用于处理与礼品相关的业务逻辑，包括数据库操作（查询、插入、更新、删除）
public class GiftsPro {
    // 数据库连接对象
    private Connection ct = null;
    // 结果集对象，用于存储数据库查询结果
    private ResultSet rs = null;
    // 预编译语句对象，用于执行SQL语句
    private PreparedStatement sta = null;

    // 获取所有礼品数据的方法
    public ArrayList<Gift> getAllGifts() {
        // 创建一个ArrayList用于存储查询到的礼品对象
        ArrayList<Gift> al = new ArrayList<>();
        // SQL查询语句，用于获取所有礼品信息
        String sql = "SELECT giftid, giftname, requiredpoints, stock FROM gifts";

        try {
            // 通过ConnectDB类获取数据库连接
            ct = new ConnectDB().getConn();
            // 创建预编译语句对象
            PreparedStatement pstmt = ct.prepareStatement(sql);
            // 执行查询并获取结果集
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                // 创建一个Gift对象
                Gift g = new Gift();
                // 设置Gift对象的属性值，从结果集中获取相应字段的值
                g.setGiftID(rs.getInt("giftid"));
                g.setGiftName(rs.getString("giftname"));
                g.setRequiredPoints(rs.getInt("requiredpoints"));
                g.setStock(rs.getInt("stock"));
                // 将Gift对象添加到ArrayList中
                al.add(g);
            }
        } catch (Exception e) {
            // 如果发生异常，打印异常堆栈信息
            e.printStackTrace();
        } finally {
            // 无论是否发生异常，都关闭相关数据库资源
            this.closeM();
        }
        // 返回包含查询结果的ArrayList
        return al;
    }

    // 获取总页数的方法
    public int getPageCount() {
        // SQL查询语句，用于统计gifts表中的记录总数
        String sql = "select count(*) from gifts";
        try {
            // 通过ConnectDB类获取数据库连接
            ct = new ConnectDB().getConn();
            // 创建预编译语句对象
            sta = ct.prepareStatement(sql);
            // 执行查询并获取结果集
            rs = sta.executeQuery();
            if (rs.next()) {
                // 获取查询结果集中的第一列（即记录总数）
                int rowCount = rs.getInt(1);
                // 根据总行数和每页显示记录数计算总页数
                int pageSize = 10; // 假设每页显示10条记录
                if (rowCount % pageSize == 0) {
                    return rowCount / pageSize;
                } else {
                    return rowCount / pageSize + 1;
                }
            }
        } catch (Exception e) {
            // 如果发生异常，打印异常堆栈信息
            e.printStackTrace();
        } finally {
            // 无论是否发生异常，都关闭相关数据库资源
            this.closeM();
        }
        // 返回默认的总页数
        return 1;
    }

    // 分页查询礼品
    public ArrayList<Gift> getGiftsByPage(int pageNow) {
        // 创建一个ArrayList用于存储查询到的礼品对象
        ArrayList<Gift> al = new ArrayList<>();
        // SQL查询语句，用于获取指定页码和每页数量的礼品信息
        String sql = "SELECT giftid, giftname, requiredpoints, stock FROM gifts LIMIT ?, ?";

        try {
            // 通过ConnectDB类获取数据库连接
            ct = new ConnectDB().getConn();
            // 创建预编译语句对象
            PreparedStatement pstmt = ct.prepareStatement(sql);
            // 设置第一个参数，即偏移量，用于指定从哪条记录开始查询
            int pageSize = 10; // 假设每页显示10条记录
            pstmt.setInt(1, (pageNow - 1) * pageSize);
            // 设置第二个参数，即每页返回的记录数
            pstmt.setInt(2, pageSize);

            // 执行查询并获取结果集
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                // 创建一个Gift对象
                Gift g = new Gift();
                // 设置Gift对象的属性值，从结果集中获取相应字段的值
                g.setGiftID(rs.getInt("giftid"));
                g.setGiftName(rs.getString("giftname"));
                g.setRequiredPoints(rs.getInt("requiredpoints"));
                g.setStock(rs.getInt("stock"));
                // 将Gift对象添加到ArrayList中
                al.add(g);
            }
        } catch (Exception e) {
            // 如果发生异常，打印异常堆栈信息
            e.printStackTrace();
        } finally {
            // 无论是否发生异常，都关闭相关数据库资源
            this.closeM();
        }
        // 返回包含查询结果的ArrayList
        return al;
    }

    // 新增礼品
    public boolean addGift(String giftName, int requiredPoints, int stock) {
        boolean b = false;
        // SQL插入语句，用于向gifts表中插入新礼品信息
        String sql = "INSERT INTO gifts (giftname, requiredpoints, stock) VALUES (?, ?, ?)";
        try {
            // 通过ConnectDB类获取数据库连接
            ct = new ConnectDB().getConn();
            // 创建预编译语句对象
            sta = ct.prepareStatement(sql);
            // 设置参数
            sta.setString(1, giftName);
            sta.setInt(2, requiredPoints);
            sta.setInt(3, stock);
            // 执行插入操作并获取影响的行数
            int a = sta.executeUpdate();
            if (a == 1) {
                // 如果插入成功（影响行数为1），返回true
                b = true;
            }
        } catch (Exception ex) {
            // 如果发生异常，打印异常堆栈信息
            ex.printStackTrace();
        } finally {
            // 无论是否发生异常，都关闭相关数据库资源
            this.closeM();
        }
        // 返回插入操作的结果
        return b;
    }

    // 更新礼品信息
    public boolean updateGift(int giftID, String giftName, int requiredPoints, int stock) {
        boolean b = false;
        // SQL更新语句，用于更新gifts表中指定礼品ID的礼品信息
        String sql = "UPDATE gifts SET giftname = ?, requiredpoints = ?, stock = ? WHERE giftid = ?";
        try {
            // 通过ConnectDB类获取数据库连接
            ct = new ConnectDB().getConn();
            // 创建预编译语句对象
            sta = ct.prepareStatement(sql);
            // 设置参数
            sta.setString(1, giftName);
            sta.setInt(2, requiredPoints);
            sta.setInt(3, stock);
            sta.setInt(4, giftID);
            // 执行更新操作并获取影响的行数
            int a = sta.executeUpdate();
            if (a == 1) {
                // 如果更新成功（影响行数为1），返回true
                b = true;
            }
        } catch (Exception ex) {
            // 如果发生异常，打印异常堆栈信息
            ex.printStackTrace();
        } finally {
            // 无论是否发生异常，都关闭相关数据库资源
            this.closeM();
        }
        // 返回更新操作的结果
        return b;
    }

    // 删除礼品
    public boolean deleteGift(int giftID) {
        boolean b = false;
        // SQL删除语句，用于删除gifts表中指定礼品ID的礼品信息
        String sql = "DELETE FROM gifts WHERE giftid = ?";
        try {
            // 通过ConnectDB类获取数据库连接
            ct = new ConnectDB().getConn();
            // 创建预编译语句对象
            sta = ct.prepareStatement(sql);
            // 设置参数
            sta.setInt(1, giftID);
            // 执行删除操作并获取影响的行数
            int a = sta.executeUpdate();
            if (a == 1) {
                // 如果删除成功（影响行数为1），返回true
                b = true;
            }
        } catch (Exception ex) {
            // 如果发生异常，打印异常堆栈信息
            ex.printStackTrace();
        } finally {
            // 无论是否发生异常，都关闭相关数据库资源
            this.closeM();
        }
        // 返回删除操作的结果
        return b;
    }

    // 兑换礼品
    public boolean exchangeGift(int userID, int giftID) {
        boolean b = false;
        // SQL插入语句，用于向exchange_records表中插入兑换记录
        String sql = "INSERT INTO exchangerecords (userid, giftid) VALUES (?, ?)";
        try {
            // 通过ConnectDB类获取数据库连接
            ct = new ConnectDB().getConn();
            // 创建预编译语句对象
            sta = ct.prepareStatement(sql);
            // 设置参数
            sta.setInt(1, userID);
            sta.setInt(2, giftID);
            // 执行插入操作并获取影响的行数
            int a = sta.executeUpdate();
            if (a == 1) {
                // 如果插入成功（影响行数为1），返回true
                b = true;
            }
        } catch (Exception ex) {
            // 如果发生异常，打印异常堆栈信息
            ex.printStackTrace();
        } finally {
            // 无论是否发生异常，都关闭相关数据库资源
            this.closeM();
        }
        // 返回插入操作的结果
        return b;
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
