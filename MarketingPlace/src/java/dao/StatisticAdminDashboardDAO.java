/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.CategoryProductCount;
import model.ProductReportDTO;

public class StatisticAdminDashboardDAO extends ConnectDB {

    public Map<String, Integer> getProductCountByCategory() {
        Map<String, Integer> map = new HashMap<>();
        String sql = "SELECT c.CategoryName, COUNT(p.ProductID) AS ProductCount "
                + "FROM Categories c "
                + "LEFT JOIN Products p ON c.CategoryID = p.CategoryID "
                + "GROUP BY c.CategoryName";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                map.put(rs.getString("CategoryName"), rs.getInt("ProductCount"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    public List<CategoryProductCount> getSortedProductCount(boolean asc) {
        List<CategoryProductCount> list = new ArrayList<>();
        String sql = "SELECT c.CategoryName, COUNT(p.ProductID) AS ProductCount "
                + "FROM Categories c "
                + "LEFT JOIN Products p ON c.CategoryID = p.CategoryID "
                + "GROUP BY c.CategoryName "
                + "ORDER BY ProductCount " + (asc ? "ASC" : "DESC");

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new CategoryProductCount(rs.getString("CategoryName"), rs.getInt("ProductCount")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProductReportDTO> getProductsSortedByCategoryProductCount(boolean asc) {
        List<ProductReportDTO> list = new ArrayList<>();
        String sql = """
        SELECT c.CategoryName, p.ProductID, p.ThumbnailURL, p.ProductName, p.Description
        FROM Categories c
        LEFT JOIN Products p ON c.CategoryID = p.CategoryID
        GROUP BY c.CategoryID, c.CategoryName, p.ProductID, p.ThumbnailURL, p.ProductName, p.Description
        ORDER BY (SELECT COUNT(*) FROM Products pr WHERE pr.CategoryID = c.CategoryID) 
        """ + (asc ? "ASC" : "DESC") + ", c.CategoryName, p.ProductName";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new ProductReportDTO(
                        rs.getString("CategoryName"),
                        rs.getInt("ProductID"),
                        rs.getString("ThumbnailURL"),
                        rs.getString("ProductName"),
                        rs.getString("Description")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
