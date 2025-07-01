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
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.Account;

/**
 *
 * @author Admin
 */
public class UserDAO extends ConnectDB {

    public ResultSet getListCustomer(int currentPage, int pageSize) {
        ResultSet rs = null;
        String sql = "Select * from Account where RoleID = 3 order by AccountID "
                + "offset ? rows"
                + " fetch next ? rows only";
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
    

    public ResultSet getListProductOfCustomer(int customerId) {
        ResultSet rs = null;
        String sql = "Select p.ProductName, od.Quantity, od.UnitPrice from OrderDetails od "
                + "inner join [Order] o on o.OrderID = od.OrderID "
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


    public Account checkEmailExists(String email) {
        String sql = "SELECT * FROM Account WHERE Email = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(
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
                        rs.getString("Description"),
                        rs.getString("remember_token")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Account registerUser(Account user) {
        if (checkEmailExists(user.getEmail()) != null) {
            return null; // Email đã tồn tại
        }

        String sql = "INSERT INTO Account (RoleID, ImageURL, FullName, Email, Password, PhoneNumber, Address, CreateDate, Status, Description) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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

    public Account getUserByEmail(String email) {
        String sql = "SELECT * FROM Account WHERE Email = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(
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
                        rs.getString("Description"),
                        rs.getString("remember_token")
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

    public boolean updateUser(Account user) {
        String sql = "UPDATE Account SET FullName = ?, Email = ?, PhoneNumber = ?, RoleID = ?, Password = ?, Address = ?, ImageURL = ?, CreateDate = ?, Status = ?, Description = ? WHERE AccountID = ?";
        try (PreparedStatement stmt = connect.prepareStatement(sql)) {
            stmt.setString(1, user.getFullName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPhoneNumber());
            stmt.setInt(4, user.getRoleID());
            stmt.setString(5, user.getPassword());
            stmt.setString(6, user.getAddress());
            stmt.setString(7, user.getImageURL());
            stmt.setTimestamp(8, Timestamp.valueOf(user.getCreateDate()));
            stmt.setBoolean(9, user.isStatus());
            stmt.setString(10, user.getDescription());
            stmt.setInt(11, user.getAccountID());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }
    
    

    public Account getUserById(int id) {
        String sql = "SELECT * FROM Account WHERE AccountID = ?";
        try (PreparedStatement stmt = connect.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Account user = new Account();
                user.setAccountID(rs.getInt("AccountID"));
                user.setFullName(rs.getString("FullName"));
                user.setEmail(rs.getString("Email"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setPassword(rs.getString("Password"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setAddress(rs.getString("Address"));
                user.setImageURL(rs.getString("ImageURL"));
                var ts = rs.getTimestamp("CreateDate");
                if (ts != null) {
                    user.setCreateDate(ts.toLocalDateTime());
                }
                user.setStatus(rs.getBoolean("Status"));
                user.setDescription(rs.getString("Description"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updatePassword(String email, String newPassword) {
        String sql = "UPDATE Account SET Password = ? WHERE Email = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setString(1, newPassword);
            ps.setString(2, email);
            int row = ps.executeUpdate();
            return row > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void storeLoginToken(int accountId, String token) {
        String sql = "UPDATE Account SET remember_token = ? WHERE AccountID = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setString(1, token);
            ps.setInt(2, accountId);
            ps.executeUpdate();
            System.out.println("Remember token saved: " + token); // Thêm dòng này để debug
        } catch (Exception e) {
            e.printStackTrace(); // hoặc log nếu bị lỗi DB
        }
    }

    public Account getUserByToken(String token) {
        String sql = "SELECT * FROM Account WHERE remember_token = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setString(1, token);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(
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
                        rs.getString("Description"),
                        rs.getString("remember_token")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Map<String, Integer> getCustomerAccountStatsByMonth() {
        Map<String, Integer> stats = new LinkedHashMap<>();
        String sql = "SELECT FORMAT(CreateDate, 'yyyy-MM') AS Month, COUNT(*) AS Total "
                + "FROM Account WHERE RoleID = 3 "
                + "GROUP BY FORMAT(CreateDate, 'yyyy-MM') ORDER BY Month";

        try (PreparedStatement ps = connect.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                stats.put(rs.getString("Month"), rs.getInt("Total"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stats;
    }

    public List<Account> getRandomTopCustomers(int limit) {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT TOP (?) * FROM Account WHERE RoleID = 3 ORDER BY NEWID()";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setAccountID(rs.getInt("AccountID"));
                acc.setFullName(rs.getString("FullName"));
                acc.setEmail(rs.getString("Email"));
                acc.setImageURL(rs.getString("ImageURL"));
                list.add(acc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Account getAccountById(int id) {
        String sql = "SELECT * FROM Account WHERE AccountID = ?";
        try (PreparedStatement stmt = connect.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Account(
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
    
    public boolean updateAccount(Account account) {
        String sql = "UPDATE Account SET FullName=?, Email=?, PhoneNumber=?, Address=?, ImageURL=?, Description=?, CreateDate=? WHERE AccountID=?";
        try (PreparedStatement stmt = connect.prepareStatement(sql)) {
            stmt.setString(1, account.getFullName());
            stmt.setString(2, account.getEmail());
            stmt.setString(3, account.getPhoneNumber());
            stmt.setString(4, account.getAddress());
            stmt.setString(5, account.getImageURL());
            stmt.setString(6, account.getDescription());
            stmt.setTimestamp(7, Timestamp.valueOf(account.getCreateDate()));
            stmt.setInt(8, account.getAccountID());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    

}
