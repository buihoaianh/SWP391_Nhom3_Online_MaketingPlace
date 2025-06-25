package dao;

import config.ConnectDB;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import java.sql.PreparedStatement;
import java.sql.Statement;
import model.Role;

public class SellerDao extends ConnectDB {

    private Connection connect;

    public SellerDao() {
        try {
            this.connect = ConnectDB.getConnection();
            if (this.connect == null) {
                System.err.println("Fatal error: connect in SellerDao is null.");
                throw new SQLException("Unable to create Connection.");
            } else {
                System.out.println("Successfully connected to database in SellerDao.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Integer> getSellerAccountIDs() {
        List<Integer> sellerIds = new ArrayList<>();
        String sql = "SELECT AccountID FROM Account WHERE RoleID = 2";

        try (PreparedStatement ps = connect.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                sellerIds.add(rs.getInt("AccountID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sellerIds;
    }
    //lay 1 seller

    public Account getSellerById(int accountId) {
        Account acc = null;
        String sql = "SELECT "
                + "  a.AccountID, a.RoleID, a.ImageURL, a.FullName, a.Email, a.Password, "
                + "  a.PhoneNumber, a.Address, a.CreateDate, a.Status, a.Description, "
                + "  r.RoleID   AS r_RoleID, "
                + "  r.RoleName AS r_RoleName "
                + "FROM Account a "
                + "INNER JOIN Roles r ON a.RoleID = r.RoleID "
                + "WHERE a.RoleID = 2 AND a.AccountID = ?";

        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            try (ResultSet rs = ps.executeQuery()) {

                //Doc
                if (rs.next()) {
                    int roleId = rs.getInt("RoleID");
                    String imageURL = rs.getString("ImageURL");
                    String fullName = rs.getString("FullName");
                    String email = rs.getString("Email");
                    String password = rs.getString("Password");
                    String phone = rs.getString("PhoneNumber");
                    String address = rs.getString("Address");
                    Timestamp ts = rs.getTimestamp("CreateDate");
                    LocalDateTime createDate = (ts != null)
                            ? ts.toLocalDateTime()
                            : null;

                    boolean status = rs.getBoolean("Status");
                    String description = rs.getString("Description");

                    //gan
                    acc = new Account();
                    acc.setAccountID(accountId);
                    acc.setRoleID(roleId);
                    acc.setImageURL(imageURL);
                    acc.setFullName(fullName);
                    acc.setEmail(email);
                    acc.setPassword(password);
                    acc.setPhoneNumber(phone);
                    acc.setAddress(address);
                    acc.setCreateDate(createDate);
                    acc.setStatus(status);
                    acc.setDescription(description);

                    int r_RoleID = rs.getInt("r_RoleID");
                    String r_RoleName = rs.getString("r_RoleName");
                    Role r = new Role(r_RoleID, r_RoleName);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return acc;
    }

    public void printAllSellers() {
        List<Integer> sellerIds = getSellerAccountIDs();
        if (sellerIds.isEmpty()) {
            System.out.println("Not find seller (RoleID = 2).");
            return;
        }

        System.out.println("List Seller (RoleID = 2):");
        for (Integer id : sellerIds) {
            Account seller = getSellerById(id);
            if (seller != null) {
                System.out.println("----- Seller ID: " + seller.getAccountID() + " -----");
                System.out.println("FullName : " + seller.getFullName());
                System.out.println("Email    : " + seller.getEmail());
                System.out.println("Phone    : " + seller.getPhoneNumber());
                System.out.println("Address  : " + seller.getAddress());
                System.out.println("Status   : " + (seller.isStatus() ? "Active" : "Inactive"));
                System.out.println("CreateDate: " + seller.getCreateDate());
                System.out.println("-----------------------------------\n");
            }
        }
    }

    public List<Account> searchSeller(String keyword) {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT a.*, r.RoleName FROM Account a "
                + "JOIN Roles r ON a.RoleID = r.RoleID "
                + "WHERE a.RoleID = 2 AND ("
                + "    a.AccountID LIKE ? OR "
                + "    a.FullName COLLATE Latin1_General_CI_AI LIKE ?"
                + ")";

        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Account acc = new Account();
                    acc.setAccountID(rs.getInt("AccountID"));
                    acc.setRoleID(rs.getInt("RoleID"));
                    acc.setImageURL(rs.getString("ImageURL"));
                    acc.setFullName(rs.getString("FullName"));
                    acc.setEmail(rs.getString("Email"));
                    acc.setPassword(rs.getString("Password"));
                    acc.setPhoneNumber(rs.getString("PhoneNumber"));
                    acc.setAddress(rs.getString("Address"));
                    Timestamp ts = rs.getTimestamp("CreateDate");
                    acc.setCreateDate(ts != null ? ts.toLocalDateTime() : null);
                    acc.setStatus(rs.getBoolean("Status"));
                    acc.setDescription(rs.getString("Description"));
                    list.add(acc);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean changeSellerStatus(int accountId) {
        String sql = "UPDATE Account SET Status = ~Status WHERE AccountID = ? AND RoleID = 2";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        SellerDao dao = new SellerDao();
        dao.printAllSellers();
    }
}
