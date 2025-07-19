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
import model.Size;

/**
 *
 * @author Admin
 */
public class SizeDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Size> getSizes() {
        List<Size> list = new ArrayList<>();
        String query = "select * from [Size]";
        try {
            conn = ConnectDB.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Size o = new Size(rs.getInt(1),
                        rs.getString(2));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    //nhận về list size
    public Size getSizeById(int sizeId) {
        String sql = "SELECT * FROM Size WHERE SizeID = ?";
        try (PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, sizeId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Size size = new Size();
                    size.setId(rs.getInt("SizeID"));
                    size.setName(rs.getString("SizeName"));
                    return size;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
