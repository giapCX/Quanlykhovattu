package Dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    // Thông tin kết nối
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/school_inventory?useSSL=false&serverTimezone=UTC";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "quan123456";

    static {
        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("Không tìm thấy JDBC Driver!");
            e.printStackTrace();
        }
    }

    
    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
        } catch (SQLException e) {
            System.err.println("Kết nối đến database thất bại!");
            e.printStackTrace();
            return null;
        }
    }
}
