/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.ConnectDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import model.User;

/**
 *
 * @author Admin
 */
public class UserDAO extends ConnectDB {

    public ResultSet getListCustomer(int currentPage, int pageSize) {
        ResultSet rs = null;
        String sql = "Select * from Account where RoleID = 2 order by AccountID offset ? rows fetch next ? rows only";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setInt(1, (currentPage - 1) * pageSize);
            pre.setInt(2, pageSize);
            rs = pre.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public ResultSet getDetailCustomer(int customerId) {
        ResultSet rs = null;
            String sql = "Select p.ProductName, od.Quantity, od.UnitPrice from OrderDetails od "
                + "inner join Orders o on o.OrderID = od.OrderID "
                + "inner join Products p on od.ProductID = p.ProductID "
                + "where o.CustomerID = ?";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setInt(1, customerId);
            rs = pre.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
    
     //check email exist
    public User checkEmailExists(String email) {
    String sql = "SELECT * FROM Account WHERE Email = ?";
    try (PreparedStatement ps = connect.prepareStatement(sql)) {
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new User(
                rs.getInt("AccountID"),
                rs.getInt("RoleID"),
                rs.getString("ImageURL"),
                rs.getString("FullName"),
                rs.getString("Email"),
                rs.getString("Password"),
                rs.getString("PhoneNumber"),
                rs.getString("Address"),
                rs.getTimestamp("CreateDate").toLocalDateTime(),
                rs.getBoolean("Status"),
                rs.getString("Description")
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

    String sql = "INSERT INTO Account (RoleID, ImageURL, FullName, Email, Password, PhoneNumber, Address, CreateDate, Status, Description) " +
                 "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    try (PreparedStatement ps = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
        ps.setInt(1, user.getRoleID());
        ps.setString(2, user.getImageURL());
        ps.setString(3, user.getFullName());
        ps.setString(4, user.getEmail());
        ps.setString(5, user.getPassword());
        ps.setString(6, user.getPhoneNumber());
        ps.setString(7, user.getAddress());
        ps.setTimestamp(8, Timestamp.valueOf(user.getCreateDate()));
        ps.setBoolean(9, user.isStatus());
        ps.setString(10, user.getDescription());

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

    return null;
}
   
    public boolean login(String email, String password) {
    String sql = "SELECT 1 FROM Account WHERE Email = ? AND Password = ?";

    try (PreparedStatement ps = connect.prepareStatement(sql)) {
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        return rs.next(); // Có bản ghi thì đúng tài khoản
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return false;
}
    
    
    public User getUserByEmail(String email) {
    String sql = "SELECT * FROM Account WHERE Email = ?";
    try (PreparedStatement ps = connect.prepareStatement(sql)) {
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new User(
                rs.getInt("AccountID"),
                rs.getInt("RoleID"),
                rs.getString("ImageURL"),
                rs.getString("FullName"),
                rs.getString("Email"),
                rs.getString("Password"),
                rs.getString("PhoneNumber"),
                rs.getString("Address"),
                rs.getTimestamp("CreateDate").toLocalDateTime(),
                rs.getBoolean("Status"),
                rs.getString("Description")
            );
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}
    
    
   public boolean isEmailExist(String email) {
    String sql = "SELECT 1 FROM Account WHERE Email = ?";
    try (PreparedStatement ps = connect.prepareStatement(sql)) {
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        return rs.next();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}
    
}
