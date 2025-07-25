/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.ConnectDB;
import java.sql.*;
import model.OrderDetail;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO extends ConnectDB{
    public void insertOrderDetail(OrderDetail detail) {
    String sql = "INSERT INTO OrderDetails (OrderID, ProductVariantID, Quantity, UnitPrice) VALUES (?, ?, ?, ?)";
    try (PreparedStatement stm = connect.prepareStatement(sql)) {
        stm.setInt(1, detail.getOrderId());
        stm.setInt(2, detail.getProductVariantId());
        stm.setInt(3, detail.getQuantity());
        stm.setString(4, detail.getUnitPrice());
        stm.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

}
