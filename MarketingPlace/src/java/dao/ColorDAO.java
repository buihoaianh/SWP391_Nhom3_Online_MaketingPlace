/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Color;

/**
 *
 * @author Admin
 */
public class ColorDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Color> getColors() {
        List<Color> list = new ArrayList<>();
        String query = "select * from [Color]";
        try {

            ps = ConnectDB.getConnection().prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Color o = new Color(rs.getInt(1),
                        rs.getString(2));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    //nhận về màu của sản phẩm
    public Color getColorById(int colorId) {
        String sql = "SELECT * FROM Color WHERE ColorID = ?";
        try (PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, colorId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Color color = new Color();
                    color.setId(rs.getInt("ColorID"));
                    color.setName(rs.getString("ColorName"));
                    return color;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
