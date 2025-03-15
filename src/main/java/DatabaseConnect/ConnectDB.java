package DatabaseConnect;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {
    private Connection ct = null;

    public Connection getConn() {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/internetsys";
        String user = "root";
        String password = "root";
        try {
            Class.forName(driver);
            ct = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return ct;
    }
}
