package BeanProcess;

import model.Dispose;
import DatabaseConnect.ConnectDB; // 引入ConnectDB类

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DisposePro {

    // 数据库连接对象
    private Connection connection = null;

    public DisposePro() {
        // 初始化数据库连接
        connection = new ConnectDB().getConn();
        if (connection == null) {
            System.err.println("Database connection is null in DisposePro constructor.");
        } else {
            System.out.println("Database connection established in DisposePro constructor.");
        }
    }

    /**
     * 添加处置记录
     *
     * @param taskid       任务ID
     * @param disposeTime  处置时间
     * @param disposeStatus 处置状态
     * @param auditorID    处置人员ID
     * @param basis        处置依据
     * @return 是否添加成功
     */
    public boolean addDispose(String taskid, Date disposeTime, String disposeStatus, String auditorID, String basis) {
        if (connection == null) {
            System.err.println("Database connection is null in addDispose method.");
            return false;
        }
        String sql = "INSERT INTO taskone (taskid, dispose_time, dispose_status, auditorID, basis) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            if (ps == null) {
                System.err.println("PreparedStatement is null in addDispose method.");
                return false;
            }
            ps.setString(1, taskid);
            ps.setTimestamp(2, new java.sql.Timestamp(disposeTime.getTime()));
            ps.setString(3, disposeStatus);
            ps.setString(4, auditorID);
            ps.setString(5, basis);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            closeResources(ps, null, null);
        }
    }

    /**
     * 分页查询处置记录
     *
     * @param pageNow 当前页码
     * @return 处置记录列表
     */
    public List<Dispose> getDisposesByPage(int pageNow) {
        if (connection == null) {
            System.err.println("Database connection is null in getDisposesByPage method.");
            return new ArrayList<>();
        }
        int pageSize = 10; // 每页显示的记录数
        int offset = (pageNow - 1) * pageSize;
        String sql = "SELECT taskid, tasktype, assigndate, status, auditcomment, content, companyid, level, dispose_status, auditorID, dispose_time, basis FROM taskone ORDER BY taskid LIMIT ? OFFSET ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement(sql);
            if (ps == null) {
                System.err.println("PreparedStatement is null in getDisposesByPage method.");
                return new ArrayList<>();
            }
            ps.setInt(1, pageSize);
            ps.setInt(2, offset);
            rs = ps.executeQuery();
            List<Dispose> disposes = new ArrayList<>();
            while (rs.next()) {
                Dispose dispose = new Dispose();
                dispose.setTaskid(rs.getString("taskid"));
                dispose.setTaskType(rs.getString("tasktype"));
                dispose.setAssignDate(rs.getTimestamp("assigndate"));
                dispose.setStatus(rs.getInt("status"));
                dispose.setAuditComment(rs.getString("auditcomment"));
                dispose.setVulnerabilityContent(rs.getString("content"));
                dispose.setCompanyID(rs.getInt("companyid"));
                dispose.setLevel(rs.getInt("level"));
                dispose.setDisposeStatus(rs.getString("dispose_status"));
                dispose.setAuditorID(rs.getString("auditorID"));
                dispose.setDisposeTime(rs.getTimestamp("dispose_time"));
                dispose.setBasis(rs.getString("basis"));
                disposes.add(dispose);
            }
            return disposes;
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();
        } finally {
            closeResources(ps, rs, null);
        }
    }

    /**
     * 获取总页数
     *
     * @return 总页数
     */
    public int getPageCount() {
        if (connection == null) {
            System.err.println("Database connection is null in getPageCount method.");
            return 0;
        }
        String sql = "SELECT COUNT(*) FROM taskone";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement(sql);
            if (ps == null) {
                System.err.println("PreparedStatement is null in getPageCount method.");
                return 0;
            }
            rs = ps.executeQuery();
            if (rs.next()) {
                int totalRecords = rs.getInt(1);
                int pageSize = 10; // 每页显示的记录数
                return (int) Math.ceil((double) totalRecords / pageSize);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(ps, rs, null);
        }
        return 0;
    }

    /**
     * 按任务ID查找处置记录
     *
     * @param pageNow 当前页码
     * @param taskId  任务ID
     * @return 处置记录列表
     */
    public List<Dispose> getDisposeByTaskId(int pageNow, String taskId) {
        if (connection == null) {
            System.err.println("Database connection is null in getDisposeByTaskId method.");
            return new ArrayList<>();
        }
        int pageSize = 10; // 每页显示的记录数
        int offset = (pageNow - 1) * pageSize;
        String sql = "SELECT taskid, tasktype, assigndate, status, auditcomment, content, companyid, level, dispose_status, auditorID, dispose_time, basis FROM taskone WHERE taskid = ? ORDER BY taskid LIMIT ? OFFSET ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement(sql);
            if (ps == null) {
                System.err.println("PreparedStatement is null in getDisposeByTaskId method.");
                return new ArrayList<>();
            }
            ps.setString(1, taskId);
            ps.setInt(2, pageSize);
            ps.setInt(3, offset);
            rs = ps.executeQuery();
            List<Dispose> disposes = new ArrayList<>();
            while (rs.next()) {
                Dispose dispose = new Dispose();
                dispose.setTaskid(rs.getString("taskid"));
                dispose.setTaskType(rs.getString("tasktype"));
                dispose.setAssignDate(rs.getTimestamp("assigndate"));
                dispose.setStatus(rs.getInt("status"));
                dispose.setAuditComment(rs.getString("auditcomment"));
                dispose.setVulnerabilityContent(rs.getString("content"));
                dispose.setCompanyID(rs.getInt("companyid"));
                dispose.setLevel(rs.getInt("level"));
                dispose.setDisposeStatus(rs.getString("dispose_status"));
                dispose.setAuditorID(rs.getString("auditorID"));
                dispose.setDisposeTime(rs.getTimestamp("dispose_time"));
                dispose.setBasis(rs.getString("basis"));
                disposes.add(dispose);
            }
            return disposes;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(ps, rs, null);
        }
        return new ArrayList<>();
    }

    /**
     * 关闭数据库资源（结果集、连接、预编译语句）的方法
     */
    private void closeResources(PreparedStatement ps, ResultSet rs, Connection connection) {
        if (rs != null) {
            try {
                rs.close();
                rs = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (ps != null) {
            try {
                ps.close();
                ps = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
                connection = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
