package dao;

import config.ConnectDB;
import model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Categories;

public class BlogDAO extends ConnectDB {

    private final Connection connect = ConnectDB.getConnection();

    public List<Blog> getAllBlogs() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blogs";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(
                        rs.getInt("BlogID"),
                        rs.getInt("AuthorID"),
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("ThumbnailURL"),
                        rs.getInt("CategoryID"),
                        rs.getString("Status"),
                        rs.getTimestamp("CreatedAt").toLocalDateTime(),
                        rs.getTimestamp("UpdatedAt").toLocalDateTime(),
                        rs.getInt("ViewCount")
                );
                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addBlog(Blog b) {
        String sql = """
                INSERT INTO Blogs (AuthorID, Title, Content, ThumbnailURL, CategoryID, Status, CreatedAt, UpdatedAt, ViewCount)
                VALUES (?, ?, ?, ?, ?, ?, GETDATE(), GETDATE(), 0)
            """;
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, b.getAuthorID());
            ps.setString(2, b.getTitle());
            ps.setString(3, b.getContent());
            ps.setString(4, b.getThumbnailURL());
            ps.setInt(5, b.getCategoryID());
            ps.setString(6, b.getStatus());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateBlog(Blog b) {
        String sql = """
            UPDATE Blogs
            SET Title = ?, Content = ?, ThumbnailURL = ?, CategoryID = ?, Status = ?, UpdatedAt = GETDATE()
            WHERE BlogID = ?
        """;
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setString(1, b.getTitle());
            ps.setString(2, b.getContent());
            ps.setString(3, b.getThumbnailURL());
            ps.setInt(4, b.getCategoryID());
            ps.setString(5, b.getStatus());
            ps.setInt(6, b.getBlogID());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

//    public boolean deleteBlog(int id) {
//        String sql = "DELETE FROM Blogs WHERE BlogID = ?";
//        try (PreparedStatement ps = connect.prepareStatement(sql)) {
//            ps.setInt(1, id);
//            return ps.executeUpdate() > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
    public boolean deleteBlog(int blogId) {
        String deleteBlogTagMapSQL = "DELETE FROM BlogTagMap WHERE BlogID = ?";
        String deleteBlogSQL = "DELETE FROM Blogs WHERE BlogID = ?";
        try (PreparedStatement ps1 = connect.prepareStatement(deleteBlogTagMapSQL); PreparedStatement ps2 = connect.prepareStatement(deleteBlogSQL)) {

            // Xóa mapping tag trước
            ps1.setInt(1, blogId);
            ps1.executeUpdate();

            // Sau đó xóa blog
            ps2.setInt(1, blogId);
            return ps2.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Blog getBlogById(int id) {
        String sql = "SELECT * FROM Blogs WHERE BlogID = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Blog(
                        rs.getInt("BlogID"),
                        rs.getInt("AuthorID"),
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("ThumbnailURL"),
                        rs.getInt("CategoryID"),
                        rs.getString("Status"),
                        rs.getTimestamp("CreatedAt").toLocalDateTime(),
                        rs.getTimestamp("UpdatedAt").toLocalDateTime(),
                        rs.getInt("ViewCount")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

//    public List<Blog> getBlogsByPage(int pageIndex, int pageSize) {
//        List<Blog> list = new ArrayList<>();
//        String sql = """
//            SELECT * FROM Blogs ORDER BY CreatedAt DESC
//            OFFSET ? ROWS FETCH NEXT ? ROWS ONLY
//        """;
//        try (PreparedStatement ps = connect.prepareStatement(sql)) {
//            ps.setInt(1, (pageIndex - 1) * pageSize);
//            ps.setInt(2, pageSize);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                Blog b = new Blog(
//                        rs.getInt("BlogID"),
//                        rs.getInt("AuthorID"),
//                        rs.getString("Title"),
//                        rs.getString("Content"),
//                        rs.getString("ThumbnailURL"),
//                        rs.getInt("CategoryID"),
//                        rs.getString("Status"),
//                        rs.getTimestamp("CreatedAt").toLocalDateTime(),
//                        rs.getTimestamp("UpdatedAt").toLocalDateTime(),
//                        rs.getInt("ViewCount")
//                );
//                list.add(b);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
    public List<Blog> getBlogsByPage(int pageIndex, int pageSize) {
        List<Blog> list = new ArrayList<>();
//        String sql = """
//            SELECT * FROM Blogs ORDER BY CreatedAt DESC
//            OFFSET ? ROWS FETCH NEXT ? ROWS ONLY
//        """;
        String sql = """
    SELECT b.*, c.CategoryName 
    FROM Blogs b
    JOIN Categories c ON b.CategoryID = c.CategoryID
    ORDER BY b.CreatedAt DESC
    OFFSET ? ROWS FETCH NEXT ? ROWS ONLY
""";

        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, (pageIndex - 1) * pageSize);
            ps.setInt(2, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(
                        rs.getInt("BlogID"),
                        rs.getInt("AuthorID"),
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("ThumbnailURL"),
                        rs.getInt("CategoryID"),
                        rs.getString("Status"),
                        rs.getTimestamp("CreatedAt").toLocalDateTime(),
                        rs.getTimestamp("UpdatedAt").toLocalDateTime(),
                        rs.getInt("ViewCount")
                );
                b.setCategoryName(rs.getString("CategoryName")); // ? set tên category
                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int countBlogs() {
        String sql = "SELECT COUNT(*) FROM Blogs";
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

    public List<Blog> searchBlogByTitle(String keyword) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blogs WHERE Title COLLATE Latin1_General_CI_AI LIKE ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(
                        rs.getInt("BlogID"),
                        rs.getInt("AuthorID"),
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("ThumbnailURL"),
                        rs.getInt("CategoryID"),
                        rs.getString("Status"),
                        rs.getTimestamp("CreatedAt").toLocalDateTime(),
                        rs.getTimestamp("UpdatedAt").toLocalDateTime(),
                        rs.getInt("ViewCount")
                );
                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy BlogID mới nhất (tùy DB có thể dùng RETURNING hoặc @@IDENTITY)
    public int getLastInsertedBlogId() {
        String sql = "SELECT TOP 1 BlogID FROM Blogs ORDER BY BlogID DESC";
        try (PreparedStatement ps = connect.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("BlogID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

// Chèn vào bảng BlogTagMap
    public boolean insertBlogTagMapping(int blogId, int tagId) {
        String sql = "INSERT INTO BlogTagMap (BlogID, TagID) VALUES (?, ?)";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, blogId);
            ps.setInt(2, tagId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteAllTagsForBlog(int blogId) {
        String sql = "DELETE FROM BlogTagMap WHERE BlogID = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, blogId);
            return ps.executeUpdate() >= 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Integer> getTagIdsByBlogId(int blogId) {
        List<Integer> tagIds = new ArrayList<>();
        String sql = "SELECT TagID FROM BlogTagMap WHERE BlogID = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, blogId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tagIds.add(rs.getInt("TagID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tagIds;
    }

    public List<Blog> getBlogsByCategoryId(int categoryId) {
        List<Blog> blogs = new ArrayList<>();
        String sql = "SELECT * FROM Blogs WHERE CategoryID = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getInt("BlogID"),
                        rs.getInt("AuthorID"),
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("ThumbnailURL"),
                        rs.getInt("CategoryID"),
                        rs.getString("Status"),
                        rs.getTimestamp("CreatedAt").toLocalDateTime(),
                        rs.getTimestamp("UpdatedAt").toLocalDateTime(),
                        rs.getInt("ViewCount")
                );
                blogs.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }

    public List<Blog> getLatestBlogs(int limit) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT TOP (?) * FROM Blogs ORDER BY BlogID DESC";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getInt("BlogID"),
                        rs.getInt("AuthorID"),
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("ThumbnailURL"),
                        rs.getInt("CategoryID"),
                        rs.getString("Status"),
                        rs.getTimestamp("CreatedAt") != null ? rs.getTimestamp("CreatedAt").toLocalDateTime() : null,
                        rs.getTimestamp("UpdatedAt") != null ? rs.getTimestamp("UpdatedAt").toLocalDateTime() : null,
                        rs.getInt("ViewCount")
                );
                list.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        BlogDAO dao = new BlogDAO();

        List<Blog> blogs = dao.getLatestBlogs(3);
        System.out.println(blogs);
    }

}
