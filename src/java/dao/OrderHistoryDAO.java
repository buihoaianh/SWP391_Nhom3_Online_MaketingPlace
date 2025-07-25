package dao;

import config.ConnectDB;
import java.sql.PreparedStatement;

public class OrderHistoryDAO extends ConnectDB {

    public void insertOrderHistory(int orderId, int customerId, double totalAmount) {
        String sql = "INSERT INTO OrderHistory (OrderID, CustomerID, OrderTotalAmount, CreatedDate) VALUES (?, ?, ?, GETDATE())";
        try (
                PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ps.setInt(2, customerId);
            ps.setDouble(3, totalAmount);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        // Các giá trị giả định đã tồn tại trong CSDL
        int orderId = 6;        // OrderID hợp lệ (đã tồn tại trong bảng [Order])
        int customerId = 24;     // CustomerID hợp lệ (đã tồn tại trong bảng [Account])
        double totalAmount = 250000.0;

        OrderHistoryDAO dao = new OrderHistoryDAO();
        try {
            dao.insertOrderHistory(orderId, customerId, totalAmount);
            System.out.println("✅ Thêm lịch sử đơn hàng thành công.");
        } catch (Exception e) {
            System.out.println("❌ Lỗi khi thêm lịch sử đơn hàng.");
            e.printStackTrace();
        }
    }
}
