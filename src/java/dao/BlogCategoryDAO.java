package dao;

import config.ConnectDB;
import model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Categories;

public class BlogCategoryDAO extends ConnectDB {

    private final Connection connect = ConnectDB.getConnection();

    public List<BlogCategory> getAllCategories() {
        List<BlogCategory> list = new ArrayList<>();
        String sql = "SELECT CategoryID, CategoryName, Description FROM BlogCategories";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BlogCategory c = new BlogCategory();
                c.setCategoryId(rs.getInt("CategoryID"));
                c.setCategoryName(rs.getString("CategoryName"));
                c.setDescription(rs.getString("Description"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public BlogCategory getCategoryById(int id) {
        String sql = "SELECT * FROM BlogCategories WHERE CategoryID = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                BlogCategory category = new BlogCategory();
                category.setCategoryId(rs.getInt("CategoryID"));
                category.setCategoryName(rs.getString("CategoryName"));
                category.setDescription(rs.getString("Description"));
                return category;
            }
        } catch (SQLException e) {
            System.out.println("getCategoryById error: " + e.getMessage());
        }
        return null;
    }

}
