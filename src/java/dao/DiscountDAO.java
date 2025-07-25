/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.ConnectDB;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import model.Discount;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author tulok
 */
public class DiscountDAO extends ConnectDB {

    

    public List<Discount> getDiscountsBySellerId(int sellerId) {
        List<Discount> list = new ArrayList<>();
        String sql = """
            SELECT DISTINCT d.*
            FROM Discounts d
            JOIN Products p ON p.DiscountID = d.DiscountID
            WHERE p.AccountID = ?
        """;

        try (
                Connection connect= getConnection();
                PreparedStatement ps = connect.prepareStatement(sql)) {
                ps.setInt(1, sellerId);
                ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Discount d = new Discount();
                d.setDiscountID(rs.getInt("DiscountID"));
                d.setDiscountName(rs.getString("DiscountName"));
                d.setDiscountType(rs.getString("DiscountType"));
                d.setDiscountValue(rs.getDouble("DiscountValue"));
                d.setStatus(rs.getString("Status"));
                d.setDescription(rs.getString("Description"));
                list.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
