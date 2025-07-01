package dao;

import config.ConnectDB;
import model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Category;

public class CategoryDAO extends ConnectDB {
    
    //thêm mới
    public List<Category> getAllCategoriesL() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT c.CategoryID, c.CategoryName, c.Description "
                + "FROM Categories c ";
        try {
            Connection connection = ConnectDB.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setCategoryID(resultSet.getInt("CategoryID"));
                category.setCategoryName(resultSet.getString("CategoryName"));
                category.setDescription(resultSet.getString("Description"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
    
        // CREATE
    public boolean addCategory(Category category) {
        String sql = "INSERT INTO [dbo].[Categories]\n"
                + "           ([CategoryName]\n"
                + "           ,[ImageURL]\n"
                + "           ,[Description])\n"
                + "     VALUES\n"
                + "           (?, ?, ?)";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setString(1, category.getCategoryName());
            pre.setString(2, category.getImageURL());
            pre.setString(3, category.getDescription());
            return pre.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("addCategory error: " + e.getMessage());
        }
        return false;
    }

    // UPDATE
    public boolean updateCategory(Category category) {
        String sql = """
                     UPDATE [dbo].[Categories]
                        SET [CategoryName] = ?
                           ,[ImageURL] = ?
                           ,[Description] = ?
                      WHERE CategoryID = ?
                     """;
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setString(1, category.getCategoryName());
            pre.setString(2, category.getImageURL());
            pre.setString(3, category.getDescription());
            pre.setInt(4, category.getCategoryID());
            return pre.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("updateCategory error: " + e.getMessage());
        }
        return false;
    }

    // DELETE
    public boolean deleteCategory(int id) {
        String sql = "DELETE FROM [dbo].[Categories]\n"
                + "      WHERE CategoryID = ?";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setInt(1, id);
            return pre.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("deleteCategory error: " + e.getMessage());
        }
        return false;
    }

// Search
    public List<Category> searchCategoryByName(String keyword) {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM Categories WHERE CategoryName COLLATE Latin1_General_CI_AI LIKE ?";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setString(1, "%" + keyword + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Category c = new Category(
                        rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getString("ImageURL"),
                        rs.getString("Description")
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("searchCategoryByName error: " + e.getMessage());
        }
        return list;
    }

    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM Categories";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Category c = new Category(
                        rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getString("ImageURL"),
                        rs.getString("Description")
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("getAllCategories error: " + e.getMessage());
        }
        return list;
    }

    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM Categories WHERE CategoryID = ?";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return new Category(
                        rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getString("ImageURL"),
                        rs.getString("Description")
                );
            }
        } catch (SQLException e) {
            System.out.println("getCategoryById error: " + e.getMessage());
        }
        return null;
    }

    public static void printCategoryList(List<Category> list) {
        if (list.isEmpty()) {
            System.out.println("No categories found.");
            return;
        }

        System.out.printf("%-5s | %-20s | %-40s | %-30s%n", "ID", "Name", "Image URL", "Description");
        for (Category c : list) {
            System.out.println(c);
        }
    }

    // MAIN TEST
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        // ADD 
//        Categories newCategory = new Categories(0, "Cong nghe", "https://example.com/tech.jpg", "Thiet bi cong nghe");
//        if (dao.addCategory(newCategory)) {
//            System.out.println("New category added successfully!");
//        }
//        printCategoryList(dao.getAllCategories());

        // UPDATE 
//        Categories c = dao.getCategoryById(4);
//        if (c != null) {
//            c.setCategoryName("Do cong nghe");
//            c.setImageURL("https://example.com/updated.jpg");
//            c.setDescription("Updated description");
//            if (dao.updateCategory(c)) {
//                System.out.println("Category updated successfully!");
//            }
//        }
//        printCategoryList(dao.getAllCategories());
        // DELETE
//        if (dao.deleteCategory(4)) {
//            System.out.println("Category with ID 4 deleted successfully!");
//        }
//        printCategoryList(dao.getAllCategories());
        List<Category> list = dao.getAllCategories();
        printCategoryList(list);
    }


}
