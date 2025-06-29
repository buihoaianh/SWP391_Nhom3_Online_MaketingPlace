/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.ConnectDB;
import java.sql.*;
import model.Order;

/**
 *
 * @author Admin
 */
public class OrderDAO extends ConnectDB {

    public int insertOrder(Order order) {
        String sql = "INSERT INTO [Order] (SellerID, CustomerID, OrderDate, TotalAmount, PaymentID, OrderStatusID) VALUES (?, ?, GETDATE(), ?, ?, ?)";
        try (PreparedStatement stm = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stm.setInt(1, order.getSellerId());
            stm.setInt(2, order.getCustomerId());
            stm.setDouble(3, Double.parseDouble(order.getTotalAmount())); // TotalAmount
            stm.setInt(4, order.getPaymentId());
            stm.setInt(5, order.getOrderStatusId()); // OrderStatusID

            int rows = stm.executeUpdate();
            if (rows > 0) {
                ResultSet rs = stm.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    
     public static void main(String[] args) {
        // Tạo order mẫu
        Order order = new Order();
        order.setSellerId(17);         // ID phải tồn tại trong bảng Account
        order.setCustomerId(20);       // ID phải tồn tại trong bảng Account
        order.setPaymentId(1);        // ID phải tồn tại trong bảng Payments
        order.setOrderStatusId(1);    // ID phải tồn tại trong bảng OrderStatus
        order.setTotalAmount("150000"); // Tổng tiền đơn hàng (chuỗi)

        OrderDAO dao = new OrderDAO();
        int orderId = dao.insertOrder(order);

        if (orderId > 0) {
            System.out.println("✅ Insert thành công! OrderID = " + orderId);
        } else {
            System.out.println("❌ Insert thất bại.");
        }
    }

}
