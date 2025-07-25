package dao;

import config.ConnectDB;
import java.sql.*;
import java.util.LinkedHashMap;
import java.util.Map;
import java.text.DecimalFormat;

public class DashboardDAO extends ConnectDB {

    public int getTotalSellers() {
        String sql = "SELECT COUNT(DISTINCT AccountID) FROM SellerRequests WHERE Status = 'Approve'";
        try (PreparedStatement ps = connect.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTotalCustomers() {
        String sql = "SELECT COUNT(*) FROM Account WHERE RoleID = 3";
        try (PreparedStatement ps = connect.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTotalProducts() {
        String sql = "SELECT COUNT(*) FROM Products";
        try (PreparedStatement ps = connect.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public String formatRevenue(double totalRevenue) {
        DecimalFormat df = new DecimalFormat("#,###");
        return df.format(totalRevenue);
    }

    public double getTotalRevenue() {
        String sql = "SELECT SUM(CAST(TotalAmount AS FLOAT)) FROM [Order] WHERE OrderStatusID = 2";
        try (PreparedStatement ps = connect.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                double totalRevenue = rs.getDouble(1);
                return totalRevenue;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0.0;
    }

    public Map<String, Double> getTopSellersRevenue() {
        String sql = """
        SELECT TOP 5 a.FullName, SUM(CAST(o.TotalAmount AS FLOAT)) AS Revenue
        FROM [Order] o
        JOIN Account a ON o.SellerID = a.AccountID
        WHERE o.OrderStatusID = 2
        GROUP BY a.FullName
        ORDER BY Revenue DESC
        """;
        Map<String, Double> data = new LinkedHashMap<>();
        try (PreparedStatement ps = connect.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                data.put(rs.getString("FullName"), rs.getDouble("Revenue"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public Map<String, Double> getTopCustomersSpending() {
        String sql = """
        SELECT TOP 5 a.FullName, SUM(oh.OrderTotalAmount) AS TotalSpent
        FROM OrderHistory oh
        JOIN Account a ON oh.CustomerID = a.AccountID
        GROUP BY a.FullName
        ORDER BY TotalSpent DESC
        """;
        Map<String, Double> data = new LinkedHashMap<>();
        try (PreparedStatement ps = connect.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                data.put(rs.getString("FullName"), rs.getDouble("TotalSpent"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public Map<String, Integer> getProductCountByCategory() {
        String sql = """
    SELECT c.CategoryName, COUNT(p.ProductId) AS ProductCount
    FROM Products p
    JOIN Categories c ON p.CategoryID = c.CategoryID
    GROUP BY c.CategoryName
    ORDER BY ProductCount DESC
    """;
        Map<String, Integer> productCount = new LinkedHashMap<>();
        try (PreparedStatement ps = connect.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                productCount.put(rs.getString("CategoryName"), rs.getInt("ProductCount"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productCount;
    }

}
