package dao;

import config.ConnectDB;
import model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Categories;

public class TagDAO extends ConnectDB {

    private final Connection connect = ConnectDB.getConnection();

    // Lấy toàn bộ tag
    public List<BlogTag> getAllTags() {
        List<BlogTag> list = new ArrayList<>();
        String sql = "SELECT * FROM BlogTags";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BlogTag tag = new BlogTag(rs.getInt("TagID"), rs.getString("TagName"));
                list.add(tag);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Thêm tag mới
    public boolean addTag(String tagName) {
        String sql = "INSERT INTO BlogTags (TagName) VALUES (?)";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setString(1, tagName);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa tag theo ID
    public boolean deleteTag(int tagId) {
        String sql = "DELETE FROM BlogTags WHERE TagID = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, tagId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật tên tag
    public boolean updateTag(int tagId, String newTagName) {
        String sql = "UPDATE BlogTags SET TagName = ? WHERE TagID = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setString(1, newTagName);
            ps.setInt(2, tagId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lấy tag theo ID
    public BlogTag getTagById(int tagId) {
        String sql = "SELECT * FROM BlogTags WHERE TagID = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, tagId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new BlogTag(rs.getInt("TagID"), rs.getString("TagName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<BlogTag> getTagsByBlogId(int blogId) {
        List<BlogTag> tags = new ArrayList<>();
        String sql = "SELECT t.TagID, t.TagName FROM BlogTagMap m JOIN BlogTags t ON m.TagID = t.TagID WHERE m.BlogID = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, blogId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BlogTag tag = new BlogTag();
                tag.setTagId(rs.getInt("TagID"));
                tag.setTagName(rs.getString("TagName"));
                tags.add(tag);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tags;
    }

}
