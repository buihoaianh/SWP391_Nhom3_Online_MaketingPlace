package dal;

import Model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private final Connection conn;

    public UserDAO() {
        DBConnect db = new DBConnect();
        this.conn = db.getConnection();
        
    }
    
    
     //check email exist
    public User checkEmailExists(String email) {
        String sql = "SELECT * FROM Account WHERE Email = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                    rs.getInt("AccountID"),
                    rs.getInt("RoleID"),
                    rs.getString("Email"),
                    rs.getString("Password"),
                    rs.getString("FullName"),
                    rs.getString("PhoneNumber"),
                    rs.getString("Address"),
                    rs.getTimestamp("CreateDate").toLocalDateTime(),
                    rs.getInt("Status"),
                    rs.getString("Description") // có thể null
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    return null;
}

    
   public User registerUser(User user) {
    if (checkEmailExists(user.getEmail()) != null) {
        return null; // Email đã tồn tại
    }
    
    String sql = "INSERT INTO Account (RoleID, Email, Password, FullName, PhoneNumber, Address, CreateDate, Status, Description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    try (PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
        ps.setInt(1, user.getRoleID());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getPassword());
        ps.setString(4, user.getFullName());
        ps.setString(5, user.getPhoneNumber());
        ps.setString(6, user.getAddress());
        ps.setTimestamp(7, Timestamp.valueOf(user.getCreateDate()));
        ps.setInt(8, user.getStatus()); // Không kiểm tra null, để database tự xử lý
        ps.setString(9, user.getDescription()); // Tương tự

        int rowsAffected = ps.executeUpdate();
        
        if (rowsAffected > 0) {
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    user.setAccountID(generatedKeys.getInt(1));
                    return user;
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return null; // Có lỗi trong quá trình insert
}

    
    public boolean login(String email, String password) {
        String sql = "select Email, Password from Account where Email = ? and Password = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            return rs.next(); // Nếu có kết quả trả về, nghĩa là đăng nhập hợp lệ
        } catch (SQLException e) {
            e.printStackTrace();
        }
    
        return false; // Nếu không tìm thấy tài khoản
    }
    
    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM Account WHERE email = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                    rs.getInt("AccountID"),
                    rs.getInt("RoleID"),
                    rs.getString("Email"),
                    rs.getString("Password"),
                    rs.getString("FullName"),
                    rs.getString("PhoneNumber"),
                    rs.getString("Address"),
                    rs.getTimestamp("CreateDate").toLocalDateTime(),
                    rs.getInt("Status"),
                    rs.getString("Description")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    return null;
}

    
        public boolean isEmailExist(String email) {
        String sql = "SELECT * FROM Account WHERE email = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
/*
    public void createAccount(String email, String password, String fullName, String phone, String localAddress) {
        String sql = "INSERT INTO Account (email, password, full_name, phone, local_address) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password); // Cần mã hoá mật khẩu ở đây nếu dùng thật
            ps.setString(3, fullName);
            ps.setString(4, phone);
            ps.setString(5, localAddress);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
*/



}
