/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.Order;
import model.OrderItem;
import model.Product;
import model.ProductImage;

/**
 *
 * @author Admin
 */
public class OrderDAO extends ConnectDB {

    public int getTotalOrderBySeller(int sellerId) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM [Order] WHERE SellerID = ?";
        try (
                PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, sellerId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public double getTotalRevenueBySeller(int sellerId) {
        String sql = "SELECT SUM(CAST(TotalAmount AS FLOAT)) FROM [Order] WHERE SellerID = ?";
        try (
                PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public Map<String, Integer> getOrderStatusStatsBySeller(int sellerId) {
        Map<String, Integer> result = new LinkedHashMap<>();
        String sql = """
        SELECT 
            SUM(CASE WHEN OrderStatusID = 2 THEN 1 ELSE 0 END) AS SuccessOrders,
            SUM(CASE WHEN OrderStatusID = 3 THEN 1 ELSE 0 END) AS CancelledOrders
        FROM [Order]
        WHERE SellerID = ?
    """;
        try (PreparedStatement ps = connect.prepareStatement(sql)) {

            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result.put("Thành công", rs.getInt("SuccessOrders"));
                result.put("Đã hủy", rs.getInt("CancelledOrders"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public Map<String, Double> getRevenueByMonth(int sellerId) {
        Map<String, Double> revenueStats = new LinkedHashMap<>();

        String sql = "SELECT FORMAT(OrderDate, 'yyyy-MM') AS Month, "
                + "SUM(CAST(TotalAmount AS FLOAT)) AS TotalAmount "
                + "FROM [Order] "
                + "WHERE SellerID = ? "
                + "GROUP BY FORMAT(OrderDate, 'yyyy-MM') "
                + "ORDER BY Month";

        try (
                PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                revenueStats.put(rs.getString("Month"), rs.getDouble("TotalAmount"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return revenueStats;
    }

    public List<Order> getOrdersByCustomerId(int customerId) throws SQLException {
        List<Order> orders = new ArrayList<>();

        String sql = """
        SELECT 
            o.OrderID, o.OrderDate, o.TotalAmount,
            o.PaymentID, o.OrderStatusID,
            pay.PaymentMethodID,
            os.OrderStatusName,
            o.ProvinceName, o.DistrictName, o.WardName,
            od.Quantity, od.UnitPrice,
            pv.Price,
            p.ProductID, p.ProductName,
            img.ImageURL
        FROM [Order] o
        JOIN OrderDetails od ON o.OrderID = od.OrderID
        JOIN ProductVariant pv ON od.ProductVariantID = pv.ProductVariantId
        JOIN Products p ON pv.ProductId = p.ProductID
        JOIN OrderStatus os ON o.OrderStatusID = os.OrderStatusID
        JOIN Payments pay ON o.PaymentID = pay.PaymentID
        OUTER APPLY (
            SELECT TOP 1 ImageURL FROM ProductImages 
            WHERE ProductID = p.ProductID ORDER BY ImageID
        ) AS img
        WHERE o.CustomerID = ?
        ORDER BY o.OrderDate DESC
    """;

        PreparedStatement ps = connect.prepareStatement(sql);
        ps.setInt(1, customerId);
        ResultSet rs = ps.executeQuery();

        Map<Integer, Order> orderMap = new LinkedHashMap<>();

        while (rs.next()) {
            int orderId = rs.getInt("OrderID");
            Order order = orderMap.get(orderId);
            if (order == null) {
                order = new Order();
                order.setOrderId(orderId);
                order.setOrderDate(rs.getTimestamp("OrderDate"));
                order.setTotalAmount(rs.getString("TotalAmount"));
                order.setOrderStatusId(rs.getInt("OrderStatusID")); // ✅ status ID
                order.setOrderStatusName(rs.getString("OrderStatusName"));
                order.setPaymentId(rs.getInt("PaymentID"));
                order.setPaymentMethodId(rs.getInt("PaymentMethodID")); // ✅ method ID (1=COD, 2=VNPay)
                order.setProvinceName(rs.getString("ProvinceName"));
                order.setDistrictName(rs.getString("DistrictName"));
                order.setWardName(rs.getString("WardName"));
                order.setItems(new ArrayList<>());
                orderMap.put(orderId, order);
            }

            Product product = new Product();
            product.setProductId(rs.getInt("ProductID"));
            product.setProductName(rs.getString("ProductName"));

            ProductImage productImage = new ProductImage();
            productImage.setImageUrl(rs.getString("ImageURL"));
            List<ProductImage> images = new ArrayList<>();
            images.add(productImage);
            product.setImages(images);

            OrderItem item = new OrderItem();
            item.setProduct(product);
            item.setQuantity(rs.getInt("Quantity"));
            item.setUnitPrice(rs.getString("UnitPrice"));

            order.getItems().add(item);
        }

        return new ArrayList<>(orderMap.values());
    }

    public Order getOrderById(int orderId) {
        String sql = "SELECT * FROM [Order] WHERE OrderID = ?";
        try (
                PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setOrderDate(rs.getDate("OrderDate")); // hoặc getTimestamp nếu model dùng Timestamp
                order.setTotalAmount(rs.getString("TotalAmount"));
                order.setSellerId(rs.getInt("SellerID"));
                // Thêm các field khác nếu cần
                return order;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean updateOrderStatus(int orderId, int newStatusId) {
        String sql = "UPDATE [Order] SET OrderStatusID = ? WHERE OrderID = ?";
        try (PreparedStatement ps = connect.prepareStatement(sql)) {
            ps.setInt(1, newStatusId);
            ps.setInt(2, orderId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int insertOrder(Order order) {
        String sql = "INSERT INTO [Order] (SellerID, CustomerID, OrderDate, TotalAmount, "
                + "PaymentID, OrderStatusID, ProvinceCode, ProvinceName, DistrictCode, "
                + "DistrictName, WardCode, WardName) "
                + "VALUES (?, ?, GETDATE(), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stm = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stm.setInt(1, order.getSellerId());
            stm.setInt(2, order.getCustomerId());
            stm.setDouble(3, Double.parseDouble(order.getTotalAmount())); // TotalAmount
            stm.setInt(4, order.getPaymentId());
            stm.setInt(5, order.getOrderStatusId()); // OrderStatusID
            stm.setInt(6, order.getProvinceCode());
            stm.setString(7, order.getProvinceName());
            stm.setInt(8, order.getDistrictCode());
            stm.setString(9, order.getDistrictName());
            stm.setInt(10, order.getWardCode());
            stm.setString(11, order.getWardName());

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

    public List<Order> getAllOrdersBySellerId(int sellerId) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT o.OrderID, o.CustomerID, a.FullName AS CustomerName, "
                + "o.OrderDate, o.TotalAmount, os.OrderStatusName AS StatusName "
                + "FROM [Order] o "
                + "JOIN OrderStatus os ON o.OrderStatusID = os.OrderStatusID "
                + "JOIN Account a ON o.CustomerID = a.AccountID "
                + "WHERE o.SellerID = ? "
                + "ORDER BY o.OrderID DESC";

        try (PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setInt(1, sellerId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("OrderID"));
                o.setCustomerId(rs.getInt("CustomerID"));
                o.setCustomerName(rs.getString("CustomerName")); // Tên khách
                o.setOrderDate(rs.getTimestamp("OrderDate"));
                o.setTotalAmount(rs.getString("TotalAmount"));
                o.setOrderStatusName(rs.getString("StatusName"));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    

   
    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAO();
        try {
            List<Order> orders = orderDAO.getOrdersByCustomerId(24);

            if (orders.isEmpty()) {
                System.out.println("Không có đơn hàng nào cho khách hàng này.");
                return;
            }

            for (Order order : orders) {
                System.out.println("============== ĐƠN HÀNG ==============");
                System.out.println("Order ID     : " + order.getOrderId());
                System.out.println("Order Date   : " + order.getOrderDate());
                System.out.println("Status       : " + order.getOrderStatusName() + " (ID: " + order.getOrderStatusId() + ")");
                System.out.println("Payment ID   : " + order.getPaymentId());
                System.out.println("Method ID    : " + order.getPaymentMethodId());
                System.out.println("Total Amount : " + order.getTotalAmount());
                System.out.println("Address      : " + order.getWardName() + ", "
                        + order.getDistrictName() + ", " + order.getProvinceName());
                System.out.println("----- Sản phẩm -----");

                for (OrderItem item : order.getItems()) {
                    Product p = item.getProduct();
                    System.out.println(" - Tên sản phẩm: " + p.getProductName());
                    if (p.getImages() != null && !p.getImages().isEmpty()) {
                        System.out.println("   Ảnh: " + p.getImages().get(0).getImageUrl());
                    } else {
                        System.out.println("   Ảnh: Không có ảnh");
                    }
                    System.out.println("   Số lượng: " + item.getQuantity());
                    System.out.println("   Giá: " + item.getUnitPrice());
                }

                System.out.println("======================================\n");
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi lấy đơn hàng: " + e.getMessage());
            e.printStackTrace();
        }
    }

}
