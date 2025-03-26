package BeanProcess;

import DatabaseConnect.ConnectDB;
import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

// UserPro类用于处理与用户相关的业务逻辑，包括数据库操作（查询、插入、更新、删除）
public class UserPro {
	// 数据库连接对象
	private Connection ct = null;
	// 结果集对象，用于存储数据库查询结果
	private ResultSet rs = null;
	// 预编译语句对象，用于执行SQL语句
	private PreparedStatement sta = null;
	// 记录总行数
	private int rowCount;
	// 每页显示的记录数，默认设置为10
	private int pageSize = 10;
	// 总页数
	private int pageCount;

	// 获取总页数的方法
	public int getPageCount() {
		// SQL查询语句，用于统计user表中的记录总数
		String sql = "select count(*) from user";
		try {
			// 通过ConnectDB类获取数据库连接
			ct = new ConnectDB().getConn();
			// 创建预编译语句对象
			sta = ct.prepareStatement(sql);
			// 执行查询并获取结果集
			rs = sta.executeQuery();
			if (rs.next()) {
				// 获取查询结果集中的第一列（即记录总数）
				rowCount = rs.getInt(1);
			}
			// 根据总行数和每页显示记录数计算总页数
			if (rowCount % pageSize == 0) {
				pageCount = rowCount / pageSize;
			} else {
				pageCount = rowCount / pageSize + 1;
			}
		} catch (Exception e) {
			// 如果发生异常，打印异常堆栈信息
			e.printStackTrace();
		} finally {
			// 无论是否发生异常，都关闭相关数据库资源
			this.closeM();
		}
		// 返回计算出的总页数
		return pageCount;
	}

	// 英雄分页查询
	public ArrayList<User> getHerosByPage(int pageNow){
		// 创建一个ArrayList用于存储查询到的用户对象
		ArrayList<User> al = new ArrayList<>();
		// SQL查询语句，用于获取指定页码和每页数量的英雄信息
		String sql = "SELECT user_name,phone,status,level FROM security_hero LIMIT?,?";

		try {
			// 通过ConnectDB类获取数据库连接
			ct = new ConnectDB().getConn();
			// 创建预编译语句对象
			PreparedStatement pstmt = ct.prepareStatement(sql);
			// 设置第一个参数，即偏移量，用于指定从哪条记录开始查询
			pstmt.setInt(1, (pageNow - 1) * pageSize);
			// 设置第二个参数，即每页返回的记录数
			pstmt.setInt(2, pageSize);

			// 执行查询并获取结果集
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				// 创建一个User对象
				User u = new User();
				// 设置User对象的属性值，从结果集中获取相应字段的值
				u.setUserName(rs.getString("user_name"));
				u.setPhone(rs.getString("phone"));
				u.setStatus(rs.getInt("status"));
				u.setLevel(rs.getInt("level"));
				// 将User对象添加到ArrayList中
				al.add(u);
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

	// 新增英雄总页数计算
	public int getHeroPageCount() {
		int count = 0;
		// SQL查询语句，用于统计security_hero表中的记录总数
		String sql = "SELECT COUNT(*) FROM security_hero";
		try {
			// 通过ConnectDB类获取数据库连接
			ct = new ConnectDB().getConn();
			// 创建普通Statement对象
			Statement stmt = ct.createStatement();
			// 执行查询并获取结果集
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				// 获取查询结果集中的第一列（即记录总数）
				int total = rs.getInt(1);
				// 计算总页数，使用ceil函数向上取整
				count = (int) Math.ceil(total / (double) pageSize);
			}
		} catch (Exception e) {
			// 如果发生异常，打印异常堆栈信息
			e.printStackTrace();
		} finally {
			// 无论是否发生异常，都关闭相关数据库资源
			this.closeM();
		}
		// 返回计算出的总页数
		return count;
	}

	// 根据公司ID分页获取用户列表的方法
	public ArrayList<User> getUserPageByComID(int id, int pageNow) {
		// 创建一个ArrayList用于存储查询到的用户对象
		ArrayList<User> al = new ArrayList<User>();
		// SQL查询语句，用于根据公司ID获取指定页码和每页数量的用户信息
		String sql = "select * from user where companyid = '" + id + "' limit " + (pageNow - 1) * pageSize + "," + pageSize;
		try {
			// 通过ConnectDB类获取数据库连接
			ct = new ConnectDB().getConn();
			// 创建预编译语句对象
			sta = ct.prepareStatement(sql);
			// 执行查询并获取结果集
			rs = sta.executeQuery();
			while (rs.next()) {
				// 创建一个User对象
				User user = new User();
				// 设置User对象的各个属性值，从结果集中获取相应字段的值
				user.setUserID(rs.getInt("userid"));
				user.setUserName(rs.getString("username"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));
				user.setWechat(rs.getString("wechat"));
				user.setCompanyID(rs.getInt("companyid"));
				user.setStatus(rs.getInt("status"));
				user.setOperation(rs.getString("operation"));
				user.setLevel(rs.getInt("level"));
				user.setUserPass(rs.getString("userpass"));
				// 将User对象添加到ArrayList中
				al.add(user);
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

	// 分页获取所有用户列表的方法
public ArrayList<User> getUsersByPage(int pageNow) {
    // 创建一个ArrayList用于存储查询到的用户对象
    ArrayList<User> al = new ArrayList<User>();
    // SQL查询语句，用于获取指定页码和每页数量的用户信息
    String sql = "select * from user limit " + (pageNow - 1) * pageSize + "," + pageSize;
    try {
        // 通过ConnectDB类获取数据库连接
        ct = new ConnectDB().getConn();
        // 创建预编译语句对象
        sta = ct.prepareStatement(sql);
        // 执行查询并获取结果集
        rs = sta.executeQuery();
        while (rs.next()) {
            // 创建一个User对象
            User user = new User();
            // 设置User对象的各个属性值，从结果集中获取相应字段的值
            user.setUserID(rs.getInt("userid"));
            user.setUserName(rs.getString("username"));
            user.setPhone(rs.getString("phone"));
            user.setEmail(rs.getString("email"));
            user.setWechat(rs.getString("wechat"));
            user.setCompanyID(rs.getInt("companyid"));
            user.setStatus(rs.getInt("status"));
            user.setOperation(rs.getString("operation"));
            user.setLevel(rs.getInt("level"));
            user.setUserPass(rs.getString("userpass"));
            user.setUserPoints(rs.getInt("score"));

            // 打印用户信息
            System.out.println("User ID: " + user.getUserID());
            System.out.println("User Name: " + user.getUserName());
            System.out.println("Phone: " + user.getPhone());
            System.out.println("Email: " + user.getEmail());
            System.out.println("Wechat: " + user.getWechat());
            System.out.println("Company ID: " + user.getCompanyID());
            System.out.println("Status: " + user.getStatus());
            System.out.println("Operation: " + user.getOperation());
            System.out.println("Level: " + user.getLevel());
            System.out.println("User Pass: " + user.getUserPass());
            System.out.println("User Points: " + user.getUserPoints());
            System.out.println("----------------------------------------");

            // 将User对象添加到ArrayList中
            al.add(user);
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


	// 根据用户名获取用户级别的方法
	public int getLevelByName(String name) {
		int level = 0;
		// SQL查询语句，用于根据用户名获取用户级别
		String sql = "select level from user where username='" + name + "'";
		try {
			// 通过ConnectDB类获取数据库连接
			ConnectDB cdb = new ConnectDB();
			ct = cdb.getConn();
			// 创建预编译语句对象
			sta = ct.prepareStatement(sql);
			// 执行查询并获取结果集
			rs = sta.executeQuery();
			if (rs.next()) {
				// 获取查询结果集中的用户级别
				level = rs.getInt("level");
			}
		} catch (Exception ex) {
			// 如果发生异常，打印异常堆栈信息
			ex.printStackTrace();
		} finally {
			// 无论是否发生异常，都关闭相关数据库资源
			this.closeM();
		}
		// 返回获取到的用户级别
		return level;
	}

	// 检查用户输入的用户名和密码是否正确，并验证用户状态的方法
	public boolean checkUserInput(String u, String p) {
		boolean b = false;
		// SQL查询语句，用于根据用户名获取用户密码、状态和用户ID
		String sql = "select userpass,status,userid from user where username='" + u + "'";
		try {
			// 通过ConnectDB类获取数据库连接
			ConnectDB cdb = new ConnectDB();
			ct = cdb.getConn();
			// 创建预编译语句对象
			sta = ct.prepareStatement(sql);
			// 执行查询并获取结果集
			rs = sta.executeQuery();
			if (rs.next()) {
				if (rs.getString("userpass").equals(p) && (rs.getInt("status") == 1)) {
					// 获取用户ID
					int userid = rs.getInt("userid");
					// 创建LogPro对象，可能用于记录用户登录日志
					LogPro logPro = new LogPro();
					// 获取当前时间的时间戳
					Timestamp loginDate = new Timestamp(new Date().getTime());
					// 调用LogPro对象的addLog方法记录用户登录日志
					logPro.addLog(userid, loginDate);
					// 如果密码和状态验证通过，返回true
					b = true;
				} else {
					// 否则返回false
					b = false;
				}
			}
		} catch (Exception ex) {
			// 如果发生异常，打印异常堆栈信息
			ex.printStackTrace();
		} finally {
			// 无论是否发生异常，都关闭相关数据库资源
			this.closeM();
		}
		// 返回验证结果
		return b;
	}

	// 根据用户ID获取公司ID的方法
	public int getName(int userid) {
		int companyid = 0;
		// SQL查询语句，用于根据用户ID获取公司ID
		String sql = "select companyid from user where userid = '" + userid + "'";
		try {
			// 通过ConnectDB类获取数据库连接
			ConnectDB cdb = new ConnectDB();
			ct = cdb.getConn();
			// 创建预编译语句对象
			sta = ct.prepareStatement(sql);
			// 执行查询并获取结果集
			rs = sta.executeQuery();
			if (rs.next()) {
				// 获取查询结果集中的公司ID
				companyid = rs.getInt(1);
			}
		} catch (Exception ex) {
			// 如果发生异常，打印异常堆栈信息
			ex.printStackTrace();
		} finally {
			// 无论是否发生异常，都关闭相关数据库资源
			this.closeM();
		}
		// 返回获取到的公司ID
		return companyid;
	}

	// 获取所有用户列表的方法
	public ArrayList<User> getAllUsers() {
		// 创建一个ArrayList用于存储查询到的用户对象
		ArrayList<User> userList = new ArrayList<User>();
		// SQL查询语句，用于获取所有用户信息
		String sql = "select * from user";
		try {
			// 通过ConnectDB类获取数据库连接
			ConnectDB cdb = new ConnectDB();
			ct = cdb.getConn();
			// 创建预编译语句对象
			sta = ct.prepareStatement(sql);
			// 执行查询并获取结果集
			rs = sta.executeQuery();
			while (rs.next()) {
				// 创建一个User对象
				User user = new User();
				// 设置User对象的各个属性值，从结果集中获取相应字段的值
				user.setUserID(rs.getInt("userid"));
				user.setUserName(rs.getString("username"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));
				user.setWechat(rs.getString("wechat"));
				user.setCompanyID(rs.getInt("companyid"));
				user.setStatus(rs.getInt("status"));
				user.setOperation(rs.getString("operation"));
				user.setLevel(rs.getInt("level"));
				user.setUserPass(rs.getString("userpass"));
				// 将User对象添加到ArrayList中
				userList.add(user);
			}
		} catch (Exception ex) {
			// 如果发生异常，打印异常堆栈信息
			ex.printStackTrace();
		} finally {
			// 无论是否发生异常，都关闭相关数据库资源
			this.closeM();
		}
		// 返回包含所有用户信息的ArrayList
		return userList;
	}

	// 插入新用户的方法
	public boolean addUser(String userName, String phone, int companyID, int status, int level, String userPass) {
		boolean b = false;
		// SQL插入语句，用于向user表中插入新用户信息
		String sql = "insert into user (username,phone,companyid,status,level,userpass) values('" + userName + "','" + phone + "','" + companyID + "','" + status + "','" + level + "','" + userPass + "')";
		try {
			// 通过ConnectDB类获取数据库连接
			ConnectDB cdb = new ConnectDB();
			ct = cdb.getConn();
			// 创建预编译语句对象
			sta = ct.prepareStatement(sql);
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

	// 更新用户信息的方法
	public boolean updateUser(int userid, String userName, String phone, int companyid, int status, String userPass) {
		boolean b = false;
		// SQL更新语句，用于更新user表中指定用户ID的用户信息
		String sql = "update user set username = '" + userName + "',phone = '" + phone + "', companyid = '" + companyid + "', status = '" + status + "', userpass = '" + userPass + "' where userid ='" + userid + "'";
		try {
			// 通过ConnectDB类获取数据库连接
			ConnectDB cdb = new ConnectDB();
			ct = cdb.getConn();
			// 创建预编译语句对象
			sta = ct.prepareStatement(sql);
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

	// 根据用户ID获取用户名的方法
	public String getUserNameByUserid(int userid) {
		String userName = "";
		// SQL查询语句，用于根据用户ID获取用户名
		String sql = "select username from user where userid = '" + userid + "'";
		try {
			// 通过ConnectDB类获取数据库连接
			ConnectDB cdb = new ConnectDB();
			ct = cdb.getConn();
			// 创建预编译语句对象
			sta = ct.prepareStatement(sql);
			// 执行查询并获取结果集
			rs = sta.executeQuery();
			if (rs.next()) {
				// 获取查询结果集中的用户名
				userName = rs.getString(1);
			}
		} catch (Exception ex) {
			// 如果发生异常，打印异常堆栈信息
			ex.printStackTrace();
		} finally {
			// 无论是否发生异常，都关闭相关数据库资源
			this.closeM();
		}
		// 返回获取到的用户名
		return userName;
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

	public boolean delUser(String userId) {
		// TODO Auto-generated method stub
		boolean b = false;
		String sql = "delete from user where userid = '" + userId + "'";
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

}
