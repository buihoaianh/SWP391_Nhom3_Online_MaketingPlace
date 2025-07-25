package dao;

import config.ConnectDB;
import model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Categories;

public class TagBlogMapDAO extends ConnectDB {

    private final Connection connect = ConnectDB.getConnection();

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

}
