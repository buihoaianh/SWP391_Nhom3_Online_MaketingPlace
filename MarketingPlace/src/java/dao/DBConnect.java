package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    // Sửa thông tin kết nối ở đây
    private final String url = "jdbc:sqlserver://localhost:1433;databaseName=Online_Maketingplace;encrypt=true;trustServerCertificate=true";
    private final String user = "sa";          // hoặc tên user khác
    private final String password = "12345";  // nhập đúng mật khẩu

    private Connection conn;

    public DBConnect() {
        connect();
    }

    private void connect() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("✔ Kết nối database thành công!");
        } catch (ClassNotFoundException e) {
            System.err.println("✘ Không tìm thấy JDBC Driver.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("✘ Kết nối database thất bại!");
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return conn;
    }

    public void close() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("✔ Đã đóng kết nối.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

// Hàm main test
    public static void main(String[] args) {
        DBConnect db = new DBConnect();
        if (db.getConnection() != null) {
            System.out.println("✔ Kết nối thành công!");
        } else {
            System.out.println("✘ Kết nối thất bại!");
        }
        db.close();
    }
}
