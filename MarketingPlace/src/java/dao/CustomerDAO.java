package dao;

import config.ConnectDB;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Role;

public class CustomerDAO extends ConnectDB {

    private Connection connect;

    public CustomerDAO() {
        try {
            this.connect = ConnectDB.getConnection();
            if (this.connect == null) {
                System.err.println("Fatal error: connect in CustomerDAO is null.");
                throw new SQLException("Unable to create Connection.");
            } else {
                System.out.println("Successfully connected to database in CustomerDAO.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Integer> getCustomerAccountIDs() {
        List<Integer> customerIds = new ArrayList<>();
        String sql = "SELECT AccountID FROM Account WHERE RoleID = 3";

        try (PreparedStatement ps = connect.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                customerIds.add(rs.getInt("AccountID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerIds;
    }

    public Account getCustomerById(int accountId) {
        Account acc = null;
        String sql = "SELECT a.*, r.RoleName, m.MemberName "
                + "FROM Account a "
                + "JOIN Roles r ON a.RoleID = r.RoleID "
                + "LEFT JOIN CustomerMemberLevel cml ON a.AccountID = cml.CustomerID "
                + "LEFT JOIN Member m ON cml.MemberID = m.MemberID "
                + "WHERE a.RoleID = 3 AND a.AccountID = ?";

        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    acc = new Account();
                    acc.setAccountID(accountId);
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
                    String level = rs.getString("MemberName");
                    acc.setDescription(level != null ? level : "Unranked");

                    Role role = new Role(rs.getInt("RoleID"), rs.getString("RoleName"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return acc;
    }

    public void printAllCustomers() {
        List<Integer> customerIds = getCustomerAccountIDs();
        if (customerIds.isEmpty()) {
            System.out.println("Not find customer (RoleID = 3).");
            return;
        }

        System.out.println("List Customer (RoleID = 3):");
        for (Integer id : customerIds) {
            Account customer = getCustomerById(id);
            if (customer != null) {
                System.out.println("----- Customer ID: " + customer.getAccountID() + " -----");
                System.out.println("FullName   : " + customer.getFullName());
                System.out.println("Email      : " + customer.getEmail());
                System.out.println("Phone      : " + customer.getPhoneNumber());
                System.out.println("Address    : " + customer.getAddress());
                System.out.println("Status     : " + (customer.isStatus() ? "Active" : "Inactive"));
                System.out.println("CreateDate : " + customer.getCreateDate());
                System.out.println("-----------------------------------\n");
            }
        }
    }

    public List<Account> searchCustomer(String keyword) {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT a.*, r.RoleName, m.MemberName "
                + "FROM Account a "
                + "JOIN Roles r ON a.RoleID = r.RoleID "
                + "LEFT JOIN CustomerMemberLevel cml ON a.AccountID = cml.CustomerID "
                + "LEFT JOIN Member m ON cml.MemberID = m.MemberID "
                + "WHERE a.RoleID = 3 AND ("
                + "a.AccountID LIKE ? OR "
                + "a.FullName COLLATE Latin1_General_CI_AI LIKE ?)";

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
                    String level = rs.getString("MemberName");
                    acc.setDescription(level != null ? level : "Unranked");

                    list.add(acc);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }



    public void updateCustomerDescriptionsFromMemberLevel() {
        String sql = """
        UPDATE A
        SET A.Description = M.MemberName
        FROM Account A
        JOIN CustomerMemberLevel CML ON A.AccountID = CML.CustomerID
        JOIN Member M ON CML.MemberID = M.MemberID
        WHERE A.RoleID = 3
    """;
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void setUnrankedDescriptionForUnlinkedCustomers() {
        String sql = """
        UPDATE Account
        SET Description = 'Unranked'
        WHERE RoleID = 3
          AND AccountID NOT IN (SELECT CustomerID FROM CustomerMemberLevel)
    """;
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        dao.printAllCustomers();
    }
}
