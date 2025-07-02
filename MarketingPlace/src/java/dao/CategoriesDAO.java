package dao;

import config.ConnectDB;
import model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Categories;

public class CategoriesDAO extends ConnectDB {

    //thêm mới
    public List<Categories> getAllCategoriesL() {
        List<Categories> categories = new ArrayList<>();
        String sql = "SELECT c.CategoryID, c.CategoryName, c.Description "
                + "FROM Categories c ";
        try {
            Connection connection = ConnectDB.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Categories category = new Categories();
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
    public boolean addCategory(Categories category) {
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
    public boolean updateCategory(Categories category) {
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
    public List<Categories> searchCategoryByName(String keyword) {
        List<Categories> list = new ArrayList<>();
        String sql = "SELECT * FROM Categories WHERE CategoryName COLLATE Latin1_General_CI_AI LIKE ?";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setString(1, "%" + keyword + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Categories c = new Categories(
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

    public List<Categories> getAllCategories() {
        List<Categories> list = new ArrayList<>();
        String sql = "SELECT * FROM Categories";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Categories c = new Categories(
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

    public Categories getCategoryById(int id) {
        String sql = "SELECT * FROM Categories WHERE CategoryID = ?";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return new Categories(
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

    public static void printCategoryList(List<Categories> list) {
        if (list.isEmpty()) {
            System.out.println("No categories found.");
            return;
        }

        System.out.printf("%-5s | %-20s | %-40s | %-30s%n", "ID", "Name", "Image URL", "Description");
        for (Categories c : list) {
            System.out.println(c);
        }
    }

    public List<Categories> getCategoriesByPage(int pageIndex, int pageSize) {
        List<Categories> list = new ArrayList<>();
        String sql = "SELECT * FROM Categories ORDER BY CategoryID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, (pageIndex - 1) * pageSize);
            ps.setInt(2, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = new Categories(
                        rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getString("ImageURL"),
                        rs.getString("Description")
                );
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int countCategories() {
        String sql = "SELECT COUNT(*) FROM Categories";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
        CategoriesDAO dao = new CategoriesDAO();
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
        List<Categories> list = dao.getAllCategories();
        printCategoryList(list);
    }

}
