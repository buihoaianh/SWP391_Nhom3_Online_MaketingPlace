/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.sun.jdi.connect.spi.Connection;
import config.ConnectDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;
import java.util.LinkedHashMap;
import java.util.Map;
import model.Account;
import model.Color;
import model.Feedbacks;
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
    
    //
    
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

        try (PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
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
<<<<<<< Updated upstream
// 1. Insert Feedback chính
=======
    
    // 1. Insert Feedback chính
>>>>>>> Stashed changes
    public int insertFeedback(int accountId, String text, int rating, int variantId, int orderId) {
        String sql =
        "INSERT INTO [dbo].[Feedbacks] " +
        "([AccountID], [FeedbackText], [Rating], [CreateFeedbackDate], [ProductVariantID], [OrderID], [Status]) " +
        "VALUES (?, ?, ?, GETDATE(), ?, ?, 1)";
        try (
            PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
<<<<<<< Updated upstream
=======

            ps.setInt(1, accountId);
            ps.setString(2, text);
            ps.setInt(3, rating);
            ps.setInt(4, variantId);
            ps.setInt(5, orderId);

            int affected = ps.executeUpdate();
            if (affected == 0) {
                throw new SQLException("Chưa có dòng nào được insert vào Feedbacks");
            }
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }   

    // 2. Insert ảnh vào ImageFeedback
    public boolean insertImageFeedback(int feedbackId, String imagePath) throws SQLException {
        String sql = "INSERT INTO dbo.ImageFeedback (FeedbackID, ImageURL) VALUES (?, ?)";
        try (
             PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            ps.setString(2, imagePath);
            return ps.executeUpdate() == 1;
        }
    }

    // 3. Cập nhật OrderDetails.Status
    public void updateOrderDetailStatus(int orderDetailId, int status) {
        String sql = "UPDATE OrderDetails SET Status = ? WHERE OrderDetailsID = ?";
        try (
             PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, status);
            ps.setInt(2, orderDetailId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //Phân biệt feedback còn “hiện hữu” hay đã bị xoá mềm (soft-delete).
    public Feedbacks getFeedbackByOrderAndVariant(int orderId, int productVariantId) {
        String sql = "SELECT * FROM Feedbacks WHERE OrderID = ? AND ProductVariantID = ? AND Status = 1";

        try (PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ps.setInt(2, productVariantId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Feedbacks f = new Feedbacks();
                f.setFeedbackID(rs.getInt("FeedbackID"));
                f.setAccountID(rs.getInt("AccountID"));
                f.setFeedbackText(rs.getString("FeedbackText"));
                f.setRating(rs.getInt("Rating"));
                f.setCreateFeedbackDate(rs.getTimestamp("CreateFeedbackDate"));
                f.setProductVariantID(rs.getInt("ProductVariantID"));
                f.setPOrderID(rs.getInt("OrderID"));
                f.setStatus(rs.getInt("Status"));
                return f;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<String> getImageUrlsByFeedbackId(int feedbackId) {
        List<String> images = new ArrayList<>();
        String sql = "SELECT ImageURL FROM ImageFeedback WHERE FeedbackID = ?";
        try (PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                images.add(rs.getString("ImageURL"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return images;
    }
    
     public int updateFeedback(Feedbacks fb) throws SQLException {
        String sql = 
            "UPDATE dbo.Feedbacks\n" +
            "   SET AccountID           = ?,\n" +
            "       FeedbackText        = ?,\n" +
            "       Rating              = ?,\n" +
            "       CreateFeedbackDate  = ?,\n" +
            "       ProductVariantID    = ?,\n" +
            "       OrderID             = ?,\n" +
            "       Status              = ?\n" +
            " WHERE FeedbackID         = ?";

        try (
             PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {


            ps.setInt(   1, fb.getAccountID());
            ps.setString(2, fb.getFeedbackText());
            ps.setInt(   3, fb.getRating());
            ps.setTimestamp(4, new Timestamp(fb.getCreateFeedbackDate().getTime()));
            ps.setInt(   5, fb.getProductVariantID());
            ps.setInt(   6, fb.getPOrderID());
            ps.setInt(   7, fb.getStatus());
            ps.setInt(   8, fb.getFeedbackID());

            return ps.executeUpdate();
        }
    }
     
     /** Xóa toàn bộ ảnh cũ của một feedback */
    public void deleteImagesByFeedbackId(int feedbackId) throws SQLException {
        String sql = "DELETE FROM dbo.ImageFeedback WHERE FeedbackID = ?";
        try (
             PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            ps.executeUpdate();
        }
    }
    
     public void softResetFeedback(int feedbackId) throws SQLException {
        // 1) Xóa ảnh cũ trước
        deleteImagesByFeedbackId(feedbackId);

        // 2) Reset feedback
        String sql =
          "UPDATE dbo.Feedbacks\n" +
          "   SET Rating             = 0,\n" +
          "       FeedbackText       = NULL,\n" +
          "       Status             = 0,\n" +
          "       CreateFeedbackDate = GETDATE()\n" +
          " WHERE FeedbackID = ?";
        try (
             PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            ps.executeUpdate();
        }
    }
     
     //seller
     //lấy về tất cả các orderID đã thành công giao và nhận và của đúng thằng seller đang đăng nhập
    public List<Order> getSuccessfulOrdersBySeller(int accountId) {
            List<Order> list = new ArrayList<>();
            String sql =
                "SELECT o.OrderID, o.OrderDate, o.TotalAmount, o.CustomerID " +
                "FROM [Order] o " +
                "  JOIN Account a       ON o.SellerID      = a.AccountID " +
                "  JOIN OrderStatus os  ON o.OrderStatusID = os.OrderStatusID " +
                "WHERE a.AccountID = ? " +
                "  AND os.OrderStatusName = 'Success'";

            try (
                 PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {

                ps.setInt(1, accountId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Order order = new Order();
                        order.setOrderId    (rs.getInt   ("OrderID"));
                        order.setOrderDate  (rs.getDate  ("OrderDate"));
                        order.setTotalAmount(rs.getString("TotalAmount"));
                        order.setCustomerId(rs.getInt   ("CustomerID"));
                        list.add(order);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
        }
        return list;
    }

     
     // Nếu cần lấy danh sách Feedback object với ảnh.
        public List<Feedbacks> getFeedbacksWithImagesByOrderId(int orderId) {
        String sql = ""
          + "SELECT "
          + "  f.FeedbackID, f.OrderID, f.AccountID, f.ProductVariantID, "
          + "  f.Rating, f.FeedbackText, f.CreateFeedbackDate, f.Status, "
          + "  i.ImageURL "
          + "FROM Feedbacks f "
          + "LEFT JOIN ImageFeedback i "
          + "  ON f.FeedbackID = i.FeedbackID "
          + "WHERE f.OrderID = ?";

        Map<Integer, Feedbacks> map = new LinkedHashMap<>();
        try (
             PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {

            ps.setInt(1, orderId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int fid = rs.getInt("FeedbackID");

                    // nếu chưa tạo object Feedback này thì khởi tạo
                    Feedbacks fb = map.get(fid);
                    if (fb == null) {
                        fb = new Feedbacks();
                        fb.setFeedbackID(fid);
                        fb.setPOrderID(rs.getInt("OrderID"));
                        fb.setAccountID(rs.getInt("AccountID"));
                        fb.setProductVariantID(rs.getInt("ProductVariantID"));
                        fb.setRating            (rs.getInt("Rating"));
                        fb.setFeedbackText      (rs.getString("FeedbackText"));
                        fb.setCreateFeedbackDate(rs.getTimestamp("CreateFeedbackDate"));
                        fb.setStatus            (rs.getInt("Status"));
                        map.put(fid, fb);
                    }

                    // thêm ảnh nếu có
                    String url = rs.getString("ImageURL");
                    if (url != null) {
                        fb.getImageUrls().add(url);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new ArrayList<>(map.values());
    }

    
>>>>>>> Stashed changes

            ps.setInt(1, accountId);
            ps.setString(2, text);
            ps.setInt(3, rating);
            ps.setInt(4, variantId);
            ps.setInt(5, orderId);

            int affected = ps.executeUpdate();
            if (affected == 0) {
                throw new SQLException("Chưa có dòng nào được insert vào Feedbacks");
            }
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }   

    // 2. Insert ảnh vào ImageFeedback
    public boolean insertImageFeedback(int feedbackId, String imagePath) throws SQLException {
        String sql = "INSERT INTO dbo.ImageFeedback (FeedbackID, ImageURL) VALUES (?, ?)";
        try (
             PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            ps.setString(2, imagePath);
            return ps.executeUpdate() == 1;
        }
    }

    // 3. Cập nhật OrderDetails.Status
    public void updateOrderDetailStatus(int orderDetailId, int status) {
        String sql = "UPDATE OrderDetails SET Status = ? WHERE OrderDetailsID = ?";
        try (
             PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, status);
            ps.setInt(2, orderDetailId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //Phân biệt feedback còn “hiện hữu” hay đã bị xoá mềm (soft-delete).
    public Feedbacks getFeedbackByOrderAndVariant(int orderId, int productVariantId) {
        String sql = "SELECT * FROM Feedbacks WHERE OrderID = ? AND ProductVariantID = ? AND Status = 1";

        try (PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ps.setInt(2, productVariantId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Feedbacks f = new Feedbacks();
                f.setFeedbackID(rs.getInt("FeedbackID"));
                f.setAccountID(rs.getInt("AccountID"));
                f.setFeedbackText(rs.getString("FeedbackText"));
                f.setRating(rs.getInt("Rating"));
                f.setCreateFeedbackDate(rs.getTimestamp("CreateFeedbackDate"));
                f.setProductVariantID(rs.getInt("ProductVariantID"));
                f.setPOrderID(rs.getInt("OrderID"));
                f.setStatus(rs.getInt("Status"));
                return f;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<String> getImageUrlsByFeedbackId(int feedbackId) {
        List<String> images = new ArrayList<>();
        String sql = "SELECT ImageURL FROM ImageFeedback WHERE FeedbackID = ?";
        try (PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                images.add(rs.getString("ImageURL"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return images;
    }
    
     public int updateFeedback(Feedbacks fb) throws SQLException {
        String sql = 
            "UPDATE dbo.Feedbacks\n" +
            "   SET AccountID           = ?,\n" +
            "       FeedbackText        = ?,\n" +
            "       Rating              = ?,\n" +
            "       CreateFeedbackDate  = ?,\n" +
            "       ProductVariantID    = ?,\n" +
            "       OrderID             = ?,\n" +
            "       Status              = ?\n" +
            " WHERE FeedbackID         = ?";

        try (
             PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {


            ps.setInt(   1, fb.getAccountID());
            ps.setString(2, fb.getFeedbackText());
            ps.setInt(   3, fb.getRating());
            ps.setTimestamp(4, new Timestamp(fb.getCreateFeedbackDate().getTime()));
            ps.setInt(   5, fb.getProductVariantID());
            ps.setInt(   6, fb.getPOrderID());
            ps.setInt(   7, fb.getStatus());
            ps.setInt(   8, fb.getFeedbackID());

            return ps.executeUpdate();
        }
    }
     
     /** Xóa toàn bộ ảnh cũ của một feedback */
    public void deleteImagesByFeedbackId(int feedbackId) throws SQLException {
        String sql = "DELETE FROM dbo.ImageFeedback WHERE FeedbackID = ?";
        try (
             PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            ps.executeUpdate();
        }
    }
    
     public void softResetFeedback(int feedbackId) throws SQLException {
        // 1) Xóa ảnh cũ trước
        deleteImagesByFeedbackId(feedbackId);

        // 2) Reset feedback
        String sql =
          "UPDATE dbo.Feedbacks\n" +
          "   SET Rating             = 0,\n" +
          "       FeedbackText       = NULL,\n" +
          "       Status             = 0,\n" +
          "       CreateFeedbackDate = GETDATE()\n" +
          " WHERE FeedbackID = ?";
        try (
             PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            ps.executeUpdate();
        }
    }
     
     //seller
     //lấy về tất cả các orderID đã thành công giao và nhận và của đúng thằng seller đang đăng nhập
    public List<Order> getSuccessfulOrdersBySeller(int accountId) {
            List<Order> list = new ArrayList<>();
            String sql =
                "SELECT o.OrderID, o.OrderDate, o.TotalAmount, o.CustomerID " +
                "FROM [Order] o " +
                "  JOIN Account a       ON o.SellerID      = a.AccountID " +
                "  JOIN OrderStatus os  ON o.OrderStatusID = os.OrderStatusID " +
                "WHERE a.AccountID = ? " +
                "  AND os.OrderStatusName = 'Success'";

            try (
                 PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {

                ps.setInt(1, accountId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Order order = new Order();
                        order.setOrderId    (rs.getInt   ("OrderID"));
                        order.setOrderDate  (rs.getDate  ("OrderDate"));
                        order.setTotalAmount(rs.getString("TotalAmount"));
                        order.setCustomerId(rs.getInt   ("CustomerID"));
                        list.add(order);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
        }
        return list;
    }

     
     // Nếu cần lấy danh sách Feedback object với ảnh.
        public List<Feedbacks> getFeedbacksWithImagesByOrderId(int orderId) {
        String sql = ""
          + "SELECT "
          + "  f.FeedbackID, f.OrderID, f.AccountID, f.ProductVariantID, "
          + "  f.Rating, f.FeedbackText, f.CreateFeedbackDate, f.Status, "
          + "  i.ImageURL "
          + "FROM Feedbacks f "
          + "LEFT JOIN ImageFeedback i "
          + "  ON f.FeedbackID = i.FeedbackID "
          + "WHERE f.OrderID = ?";

        Map<Integer, Feedbacks> map = new LinkedHashMap<>();
        try (
             PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql)) {

            ps.setInt(1, orderId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int fid = rs.getInt("FeedbackID");

                    // nếu chưa tạo object Feedback này thì khởi tạo
                    Feedbacks fb = map.get(fid);
                    if (fb == null) {
                        fb = new Feedbacks();
                        fb.setFeedbackID(fid);
                        fb.setPOrderID(rs.getInt("OrderID"));
                        fb.setAccountID(rs.getInt("AccountID"));
                        fb.setProductVariantID(rs.getInt("ProductVariantID"));
                        fb.setRating            (rs.getInt("Rating"));
                        fb.setFeedbackText      (rs.getString("FeedbackText"));
                        fb.setCreateFeedbackDate(rs.getTimestamp("CreateFeedbackDate"));
                        fb.setStatus            (rs.getInt("Status"));
                        map.put(fid, fb);
                    }

                    // thêm ảnh nếu có
                    String url = rs.getString("ImageURL");
                    if (url != null) {
                        fb.getImageUrls().add(url);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new ArrayList<>(map.values());
    }
}
