/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author MinhTran
 */
import com.sun.jdi.connect.spi.Connection;
import config.ConnectDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;
import model.Account;
import model.Color;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.ProductVariant;
import model.Size;
import static org.apache.coyote.http11.Constants.a;
/**
 *
 * @author Hi Windows 11 Home
 */
public class FeedbackDAO {
     //thêm mới
    java.sql.Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    
    // lấy ra những orderID đã Success
    public List<Order> getSuccessfulOrders(int accountId) {
    List<Order> list = new ArrayList<>();
    String sql = "SELECT o.OrderID, o.OrderDate, o.TotalAmount, o.SellerID " +
                 "FROM [Order] o " +
                 "JOIN OrderStatus os ON o.OrderStatusID = os.OrderStatusID " +
                 "WHERE o.CustomerID = ? AND os.OrderStatusName = 'Success'";

    try (
         PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {

        ps.setInt(1, accountId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Order order = new Order();
            order.setOrderId(rs.getInt("OrderID"));
            order.setOrderDate(rs.getDate("OrderDate")); // dùng java.sql.Date
            order.setTotalAmount(rs.getString("TotalAmount")); // để kiểu String
            order.setSellerId(rs.getInt("SellerID"));

            list.add(order);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return list;
}
    
    //lấy về các giá trị như sql bên dưới
    public List<OrderDetail> getOrderProductDetailsByOrderID(int orderID) {
        List<OrderDetail> list = new ArrayList<>();

        String sql = "SELECT \n" +
                "    od.OrderDetailsID,\n" +
                "    od.OrderID,\n" +
                "    od.ProductVariantID,\n" +
                "    od.Quantity,\n" +
                "    od.UnitPrice,\n" +
                "    pv.Price,\n" +
                "    pv.SizeID,\n" +
                "    pv.ColorID,\n" +
                "    pv.ProductID\n" +
                "FROM OrderDetails od\n" +
                "JOIN ProductVariant pv ON od.ProductVariantID = pv.ProductVariantID\n" +
                "WHERE od.OrderID = ?;";

        try (
             PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {

            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetail opd = new OrderDetail();
                opd.setOrderDetailsId(rs.getInt("OrderDetailsID"));
                opd.setOrderId(rs.getInt("OrderID"));
                opd.setQuantity(rs.getInt("Quantity"));
                opd.setUnitPrice(rs.getString("UnitPrice"));

                ProductVariant pv = new ProductVariant();
                pv.setProductVariantId(rs.getInt("ProductVariantID"));
                pv.setPrice(rs.getLong("Price"));
                pv.setSizeId(rs.getInt("SizeId"));
                pv.setColorId(rs.getInt("ColorId"));
                pv.setProductId(rs.getInt("ProductId"));

                opd.setProductVariant(pv);

                list.add(opd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
  
    public boolean isFeedbackExist(int accountId, int productVariantId) {
        String sql = "SELECT 1 FROM Feedbacks " +
                     "WHERE AccountID = ? AND ProductVariantID = ? AND Status = 1";
        try (PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ps.setInt(2, productVariantId);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // nếu có ít nhất 1 dòng => đã feedback rồi
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public OrderDetail getOrderDetail(int orderId, int productVariantId) {
        String sql = "SELECT od.*, pv.ProductID, pv.SizeID, pv.ColorID " +
                     "FROM OrderDetails od " +
                     "JOIN ProductVariants pv ON od.ProductVariantID = pv.ProductVariantID " +
                     "WHERE od.OrderID = ? AND od.ProductVariantID = ?";

        try (PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ps.setInt(2, productVariantId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ProductVariant pv = new ProductVariant();
                pv.setProductVariantId(productVariantId);
                pv.setProductId(rs.getInt("ProductID"));
                pv.setSizeId(rs.getInt("SizeID"));
                pv.setColorId(rs.getInt("ColorID"));

                OrderDetail od = new OrderDetail();
                od.setOrderDetailsId(rs.getInt("OrderDetailsID"));
                od.setOrderId(orderId);
                od.setProductVariant(pv);
                od.setQuantity(rs.getInt("Quantity"));
                od.setUnitPrice(rs.getString("UnitPrice"));
                return od;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Lấy 1 sản phẩm trong đơn hàng theo orderId và productVariantId
    public OrderDetail getOrderDetailByOrderIdAndVariantId(int orderId, int productVariantId) {
        String sql = "SELECT \n" +
                "    od.OrderDetailsID,\n" +
                "    od.OrderID,\n" +
                "    od.ProductVariantID,\n" +
                "    od.Quantity,\n" +
                "    od.UnitPrice,\n" +
                "    pv.Price,\n" +
                "    pv.SizeID,\n" +
                "    pv.ColorID,\n" +
                "    pv.ProductID\n" +
                "FROM OrderDetails od\n" +
                "JOIN ProductVariant pv ON od.ProductVariantID = pv.ProductVariantID\n" +
                "WHERE od.OrderID = ? AND od.ProductVariantID = ?";

        try (PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ps.setInt(2, productVariantId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                
                OrderDetail opd = new OrderDetail();
                opd.setOrderDetailsId(rs.getInt("orderDetailsId"));
                opd.setOrderId(rs.getInt("orderId"));
                opd.setQuantity(rs.getInt("quantity"));
                opd.setUnitPrice(rs.getString("unitPrice"));

                ProductVariant pv = new ProductVariant();
                pv.setProductVariantId(rs.getInt("productVariantId"));
                pv.setPrice(rs.getLong("price"));
                pv.setSizeId(rs.getInt("SizeId"));
                pv.setColorId(rs.getInt("ColorId"));
                pv.setProductId(rs.getInt("productId"));

                opd.setProductVariant(pv);

                return opd;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

//    gửi về cho seller
    // Lấy đơn hàng thành công giữa buyer và seller cụ thể
    public List<Order> getSuccessfulOrdersByCustomerAndSeller(int sellerId) {
        List<Order> list = new ArrayList<>();

        String sql = """
            SELECT o.OrderID, o.OrderDate, o.TotalAmount, o.SellerID, o.CustomerID
            FROM [Order] o
            JOIN OrderStatus os ON o.OrderStatusID = os.OrderStatusID
            WHERE o.SellerID = ?
              AND os.OrderStatusName = 'Success'
        """;

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setTotalAmount(rs.getString("TotalAmount"));
                order.setSellerId(rs.getInt("SellerID"));
                order.setCustomerId(rs.getInt("CustomerID"));
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
    //lấy về các giá trị như sql bên dưới đưa về seller
    public List<OrderDetail> getOrderProductDetailsByOrderIDSeller(int orderID) {
        List<OrderDetail> list = new ArrayList<>();

        String sql = "SELECT \n" +
            "    od.OrderDetailsID,\n" +
            "    od.OrderID,\n" +
            "    od.ProductVariantID,\n" +
            "    od.Quantity,\n" +
            "    od.UnitPrice,\n" +
            "    pv.Price,\n" +
            "    pv.SizeID,\n" +
            "    pv.ColorID,\n" +
            "    pv.ProductID,\n" +
            "    o.CustomerID\n" +
            "FROM OrderDetails od\n" +
            "JOIN ProductVariant pv ON od.ProductVariantID = pv.ProductVariantID\n" +
            "JOIN [Order] o ON od.OrderID = o.OrderID\n" +
            "WHERE od.OrderID = ? AND od.Status = 1;";

        try (PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetail opd = new OrderDetail();
                opd.setOrderDetailsId(rs.getInt("OrderDetailsID"));
                opd.setOrderId(rs.getInt("OrderID"));
                opd.setQuantity(rs.getInt("Quantity"));
                opd.setUnitPrice(rs.getString("UnitPrice"));

                ProductVariant pv = new ProductVariant();
                pv.setProductVariantId(rs.getInt("ProductVariantID"));
                pv.setPrice(rs.getLong("Price"));
                pv.setSizeId(rs.getInt("SizeID"));
                pv.setColorId(rs.getInt("ColorID"));
                pv.setProductId(rs.getInt("ProductID"));
                opd.setProductVariant(pv);

                // CustomerID nằm trong bảng Order, nếu OrderDetail có chỗ chứa thì set vào:
                Order o = new Order();
                o.setCustomerId(rs.getInt("CustomerID")); // Lấy từ bảng Order
                opd.setOrder(o); // Gán order vào cho OrderDetail


                list.add(opd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}

