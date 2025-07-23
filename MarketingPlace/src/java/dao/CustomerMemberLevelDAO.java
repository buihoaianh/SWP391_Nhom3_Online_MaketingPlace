package dao;

import config.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;
import model.CustomerLevelInfo;
import java.util.Date;

public class CustomerMemberLevelDAO extends ConnectDB {

    private Connection connect;

    public CustomerMemberLevelDAO() {
        try {
            this.connect = ConnectDB.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
// ham lay cap bac hien tai cua tung khach hang

    public List<CustomerLevelInfo> getCurrentCustomerLevels() {
        List<CustomerLevelInfo> list = new ArrayList<>();

        String sql = """
            SELECT 
                a.AccountID, a.FullName, a.Email,
                cml.TotalSpent, m.MemberName, m.Description, cml.LastUpdated
            FROM CustomerMemberLevel cml
            INNER JOIN (
                SELECT CustomerID, MAX(CustomerMemberLevelID) AS MaxID
                FROM CustomerMemberLevel
                GROUP BY CustomerID
            ) latest ON cml.CustomerMemberLevelID = latest.MaxID
            INNER JOIN Account a ON cml.CustomerID = a.AccountID
            INNER JOIN Member m ON cml.MemberID = m.MemberID
            WHERE a.RoleID = 3
        """;

        try (PreparedStatement ps = connect.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int customerID = rs.getInt("AccountID");
                String fullName = rs.getString("FullName");
                String email = rs.getString("Email");
                BigDecimal totalSpent = rs.getBigDecimal("TotalSpent");
                String memberName = rs.getString("MemberName");
                String description = rs.getString("Description");
                Date lastUpdated = new Date(rs.getTimestamp("LastUpdated").getTime());

                CustomerLevelInfo info = new CustomerLevelInfo(
                        customerID, fullName, email,
                        totalSpent, memberName, description, lastUpdated
                );

                list.add(info);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public void updateCustomerMemberLevelsFromOrders() {
        String totalSpentSQL = """
        SELECT CustomerID, SUM(CAST(OrderTotalAmount AS DECIMAL(18,2))) AS TotalSpent
        FROM OrderHistory
        GROUP BY CustomerID
    """;

        String getMemberLevelSQL = """
        SELECT TOP 1 MemberID FROM Member
        WHERE CAST(MinAmount AS DECIMAL) <= ? AND CAST(MaxAmount AS DECIMAL) >= ?
        ORDER BY MinAmount DESC
    """;

        String getLatestMemberLevelSQL = """
        SELECT TOP 1 MemberID FROM CustomerMemberLevel
        WHERE CustomerID = ?
        ORDER BY LastUpdated DESC
    """;

        String insertHistorySQL = """
        INSERT INTO CustomerMemberLevel (CustomerID, TotalSpent, MemberID, LastUpdated)
        VALUES (?, ?, ?, GETDATE())
    """;

        try (Connection conn = ConnectDB.getConnection(); PreparedStatement psTotalSpent = conn.prepareStatement(totalSpentSQL); ResultSet rs = psTotalSpent.executeQuery()) {

            while (rs.next()) {
                int customerID = rs.getInt("CustomerID");
                BigDecimal totalSpent = rs.getBigDecimal("TotalSpent");
                int newMemberID = -1;

                try (PreparedStatement psMember = conn.prepareStatement(getMemberLevelSQL)) {
                    psMember.setBigDecimal(1, totalSpent);
                    psMember.setBigDecimal(2, totalSpent);
                    ResultSet rsMember = psMember.executeQuery();
                    if (rsMember.next()) {
                        newMemberID = rsMember.getInt("MemberID");
                    }
                }

                if (newMemberID != -1) {
                    int lastMemberID = -1;
                    try (PreparedStatement psLatest = conn.prepareStatement(getLatestMemberLevelSQL)) {
                        psLatest.setInt(1, customerID);
                        ResultSet rsLatest = psLatest.executeQuery();
                        if (rsLatest.next()) {
                            lastMemberID = rsLatest.getInt("MemberID");
                        }
                    }

                    if (newMemberID != lastMemberID) {
                        try (PreparedStatement psInsert = conn.prepareStatement(insertHistorySQL)) {
                            psInsert.setInt(1, customerID);
                            psInsert.setBigDecimal(2, totalSpent);
                            psInsert.setInt(3, newMemberID);
                            psInsert.executeUpdate();
                        }
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateOrderStatusToSuccess(int orderId) {
        String updateOrderSQL = "UPDATE [Order] SET OrderStatusID = 2 WHERE OrderID = ?";
        String selectOrderSQL = "SELECT OrderID, CustomerID, TotalAmount, OrderDate FROM [Order] WHERE OrderID = ?";
        String checkExistSQL = "SELECT 1 FROM OrderHistory WHERE OrderID = ?";
        String insertOrderHistorySQL = """
        INSERT INTO OrderHistory (OrderID, CustomerID, OrderTotalAmount, CreatedDate)
        VALUES (?, ?, ?, ?)
    """;

        try (Connection conn = ConnectDB.getConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement psUpdate = conn.prepareStatement(updateOrderSQL)) {
                psUpdate.setInt(1, orderId);
                psUpdate.executeUpdate();
            }

            int customerId = 0;
            BigDecimal totalAmount = BigDecimal.ZERO;
            Timestamp orderDate = null;

            try (PreparedStatement psSelect = conn.prepareStatement(selectOrderSQL)) {
                psSelect.setInt(1, orderId);
                try (ResultSet rs = psSelect.executeQuery()) {
                    if (rs.next()) {
                        customerId = rs.getInt("CustomerID");
                        totalAmount = rs.getBigDecimal("TotalAmount");
                        orderDate = rs.getTimestamp("OrderDate");
                    }
                }
            }

            boolean alreadyExists = false;
            try (PreparedStatement psCheck = conn.prepareStatement(checkExistSQL)) {
                psCheck.setInt(1, orderId);
                try (ResultSet rsCheck = psCheck.executeQuery()) {
                    if (rsCheck.next()) {
                        alreadyExists = true;
                    }
                }
            }

            if (!alreadyExists) {
                try (PreparedStatement psInsert = conn.prepareStatement(insertOrderHistorySQL)) {
                    psInsert.setInt(1, orderId);
                    psInsert.setInt(2, customerId);
                    psInsert.setBigDecimal(3, totalAmount);
                    psInsert.setTimestamp(4, orderDate);
                    psInsert.executeUpdate();
                }
            }

            conn.commit();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // in ra danh sach khach hang theo tung cap bac
    public List<CustomerLevelInfo> getCustomersByMemberID(int memberID) {
        List<CustomerLevelInfo> list = new ArrayList<>();
        String sql = """
        SELECT 
            a.AccountID, a.FullName, a.Email,
            SUM(oh.OrderTotalAmount) AS TotalSpent,
            MAX(oh.CreatedDate) AS LastUpdated
        FROM OrderHistory oh
        JOIN Account a ON oh.CustomerID = a.AccountID
        JOIN (
            SELECT CustomerID, MAX(CustomerMemberLevelID) AS MaxID
            FROM CustomerMemberLevel
            GROUP BY CustomerID
        ) latest ON latest.CustomerID = a.AccountID
        JOIN CustomerMemberLevel cml ON cml.CustomerMemberLevelID = latest.MaxID
        WHERE cml.MemberID = ?
        GROUP BY a.AccountID, a.FullName, a.Email
    """;

        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, memberID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CustomerLevelInfo c = new CustomerLevelInfo();
                c.setCustomerID(rs.getInt("AccountID"));
                c.setFullName(rs.getString("FullName"));
                c.setEmail(rs.getString("Email"));
                c.setTotalSpent(rs.getBigDecimal("TotalSpent"));
                c.setLastUpdated(rs.getDate("LastUpdated"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

// lay nhung don hang moi và có orderStatusID = 2 
    public void syncOrderHistoryFromOrders() {
        String insertSQL = """
        INSERT INTO OrderHistory (OrderID, CustomerID, OrderTotalAmount, CreatedDate)
        SELECT o.OrderID, o.CustomerID, o.TotalAmount, o.OrderDate
        FROM [Order] o
        WHERE o.OrderStatusID = 2
        AND NOT EXISTS (
            SELECT 1 FROM OrderHistory oh WHERE oh.OrderID = o.OrderID
        )
    """;

        try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(insertSQL)) {
            int rows = ps.executeUpdate();
            System.out.println("Inserted " + rows + " new rows into OrderHistory.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String getMemberNameByID(int memberID) {
        String sql = "SELECT MemberName FROM Member WHERE MemberID = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, memberID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("MemberName");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Unknown";
    }

    // lay danh sach lich su mua hang cua khach hang va cap bac
    public List<CustomerLevelInfo> getCustomerLevelHistory(int customerID) {
        List<CustomerLevelInfo> list = new ArrayList<>();

        String sql = """
        SELECT 
            cml.CustomerMemberLevelID,
            a.AccountID, a.FullName, a.Email,
            cml.TotalSpent, m.MemberName, m.Description, cml.LastUpdated
        FROM CustomerMemberLevel cml
        INNER JOIN Account a ON cml.CustomerID = a.AccountID
        INNER JOIN Member m ON cml.MemberID = m.MemberID
        WHERE cml.CustomerID = ?
        ORDER BY cml.LastUpdated ASC
    """;

        try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CustomerLevelInfo info = new CustomerLevelInfo(
                        rs.getInt("AccountID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getBigDecimal("TotalSpent"),
                        rs.getString("MemberName"),
                        rs.getString("Description"),
                        rs.getTimestamp("LastUpdated")
                );
                list.add(info);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<CustomerLevelInfo> getCustomerOrderHistoryWithLevel(int customerID) {
        List<CustomerLevelInfo> list = new ArrayList<>();

        String sql = """
        SELECT 
            oh.OrderID,
            a.AccountID, a.FullName, a.Email,
            oh.OrderTotalAmount AS TotalSpent,
            m.MemberName, m.Description,
            oh.CreatedDate AS LastUpdated
        FROM OrderHistory oh
        INNER JOIN Account a ON oh.CustomerID = a.AccountID
        LEFT JOIN (
            SELECT cml.CustomerID, cml.MemberID, cml.LastUpdated
            FROM CustomerMemberLevel cml
            INNER JOIN (
                SELECT CustomerID, MAX(LastUpdated) AS MaxTime
                FROM CustomerMemberLevel
                GROUP BY CustomerID
            ) latest ON cml.CustomerID = latest.CustomerID AND cml.LastUpdated = latest.MaxTime
        ) latestLevel ON latestLevel.CustomerID = a.AccountID
        LEFT JOIN Member m ON latestLevel.MemberID = m.MemberID
        WHERE oh.CustomerID = ?
        ORDER BY oh.CreatedDate ASC
    """;

        try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CustomerLevelInfo info = new CustomerLevelInfo(
                        rs.getInt("AccountID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getBigDecimal("TotalSpent"),
                        rs.getString("MemberName"),
                        rs.getString("Description"),
                        rs.getTimestamp("LastUpdated")
                );
                list.add(info);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public void updateOrderAndRefreshLevel(int orderId) {
        updateOrderStatusToSuccess(orderId);
        updateCustomerMemberLevelsFromOrders();
    }

    public int countCustomersByMemberID(int memberID) {
        String sql = """
        SELECT COUNT(DISTINCT a.AccountID)
        FROM OrderHistory oh
        JOIN Account a ON oh.CustomerID = a.AccountID
        JOIN (
            SELECT CustomerID, MAX(CustomerMemberLevelID) AS MaxID
            FROM CustomerMemberLevel
            GROUP BY CustomerID
        ) latest ON latest.CustomerID = a.AccountID
        JOIN CustomerMemberLevel cml ON cml.CustomerMemberLevelID = latest.MaxID
        WHERE cml.MemberID = ?
    """;
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, memberID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<CustomerLevelInfo> getCustomersByMemberIDPaging(int memberID, int pageIndex, int pageSize) {
        List<CustomerLevelInfo> list = new ArrayList<>();
        String sql = """
        SELECT * FROM (
            SELECT 
                a.AccountID, a.FullName, a.Email,
                SUM(oh.OrderTotalAmount) AS TotalSpent,
                MAX(oh.CreatedDate) AS LastUpdated,
                ROW_NUMBER() OVER (ORDER BY MAX(oh.CreatedDate) DESC) AS rn
            FROM OrderHistory oh
            JOIN Account a ON oh.CustomerID = a.AccountID
            JOIN (
                SELECT CustomerID, MAX(CustomerMemberLevelID) AS MaxID
                FROM CustomerMemberLevel
                GROUP BY CustomerID
            ) latest ON latest.CustomerID = a.AccountID
            JOIN CustomerMemberLevel cml ON cml.CustomerMemberLevelID = latest.MaxID
            WHERE cml.MemberID = ?
            GROUP BY a.AccountID, a.FullName, a.Email
        ) AS sub
        WHERE rn BETWEEN ? AND ?
    """;

        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, memberID);
            int start = (pageIndex - 1) * pageSize + 1;
            int end = pageIndex * pageSize;
            ps.setInt(2, start);
            ps.setInt(3, end);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CustomerLevelInfo c = new CustomerLevelInfo();
                c.setCustomerID(rs.getInt("AccountID"));
                c.setFullName(rs.getString("FullName"));
                c.setEmail(rs.getString("Email"));
                c.setTotalSpent(rs.getBigDecimal("TotalSpent"));
                c.setLastUpdated(rs.getDate("LastUpdated"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int countOrderHistoryByCustomerID(int customerID) {
        String sql = "SELECT COUNT(*) FROM OrderHistory WHERE CustomerID = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<CustomerLevelInfo> getCustomerOrderHistoryWithLevelPaging(int customerID, int pageIndex, int pageSize) {
        List<CustomerLevelInfo> list = new ArrayList<>();
        String sql = """
        SELECT * FROM (
            SELECT 
                oh.OrderID,
                a.AccountID, a.FullName, a.Email,
                oh.OrderTotalAmount AS TotalSpent,
                m.MemberName, m.Description,
                oh.CreatedDate AS LastUpdated,
                ROW_NUMBER() OVER (ORDER BY oh.CreatedDate ASC) AS rn
            FROM OrderHistory oh
            INNER JOIN Account a ON oh.CustomerID = a.AccountID
            LEFT JOIN (
                SELECT cml.CustomerID, cml.MemberID, cml.LastUpdated
                FROM CustomerMemberLevel cml
                INNER JOIN (
                    SELECT CustomerID, MAX(LastUpdated) AS MaxTime
                    FROM CustomerMemberLevel
                    GROUP BY CustomerID
                ) latest ON cml.CustomerID = latest.CustomerID AND cml.LastUpdated = latest.MaxTime
            ) latestLevel ON latestLevel.CustomerID = a.AccountID
            LEFT JOIN Member m ON latestLevel.MemberID = m.MemberID
            WHERE oh.CustomerID = ?
        ) AS sub
        WHERE rn BETWEEN ? AND ?
    """;

        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            int start = (pageIndex - 1) * pageSize + 1;
            int end = pageIndex * pageSize;
            ps.setInt(1, customerID);
            ps.setInt(2, start);
            ps.setInt(3, end);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CustomerLevelInfo info = new CustomerLevelInfo(
                        rs.getInt("AccountID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getBigDecimal("TotalSpent"),
                        rs.getString("MemberName"),
                        rs.getString("Description"),
                        rs.getTimestamp("LastUpdated")
                );
                list.add(info);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static void main(String[] args) {

        CustomerMemberLevelDAO dao = new CustomerMemberLevelDAO();
        dao.updateOrderAndRefreshLevel(27); // Ví dụ OrderID = 27

    }

}
