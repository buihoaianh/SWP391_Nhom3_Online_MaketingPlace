/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.UserController;

import dao.CategoriesDAO;
import dao.ColorDAO;
import dao.FeedbackDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.SizeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.mail.Session;
import model.Account;
import model.Categories;
import model.Color;
import model.FeedbackDisplayItem;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.Size;

/**
 *
 * @author Hi Windows 11 Home
 */
@WebServlet(name="FeedBackController", urlPatterns={"/feedback"})
public class FeedBackController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Lấy tài khoản đang đăng nhập
       HttpSession session = request.getSession();
       Account acc = (Account) session.getAttribute("user");

        if (acc == null) {
            response.sendRedirect("Home");
            return;
        }

        int accountId = acc.getAccountID();

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        SizeDAO sizeDAO = new SizeDAO();
        ColorDAO colorDAO = new ColorDAO();
        ProductDAO productDAO = new ProductDAO();
        CategoriesDAO categoryDAO = new CategoriesDAO();

//        private int orderId;
//    private Date orderDate;
//
//    private int orderDetailId;
//    private int quantity;
//    private String unitPrice;
//
//    private int productVariantId;
//    private String productName;
//    private String thumbnailUrl;
//
//    private String sizeName;
//    private String colorName;
//    private String categoryName;
        // Danh sách order thành công
        List<Order> successfulOrders = feedbackDAO.getSuccessfulOrders(accountId);
//.OrderID, o.OrderDate, o.TotalAmount, o.SellerID 

        List<FeedbackDisplayItem> feedbackItems = new ArrayList<>();

        for (Order o : successfulOrders) {
            List<OrderDetail> orderDetails = feedbackDAO.getOrderProductDetailsByOrderID(o.getOrderId());
// od.OrderDetailsID,\n" +
//"    od.OrderID,\n" +
//"    od.ProductVariantID,\n" +
//"    od.Quantity,\n" +
//"    od.UnitPrice,\n" +
//"    pv.Price,\n" +
//"    pv.SizeID,\n" +
//"    pv.ColorID,\n" +
//"    pv.ProductID\n" +
            for (OrderDetail od : orderDetails) {
                int variantId = od.getProductVariant().getProductVariantId();
                if (feedbackDAO.isFeedbackExist(accountId, variantId)) continue;

                // Lấy thông tin từ nhiều bảng
                Product p = productDAO.getProductByIdFb(od.getProductVariant().getProductId());
                Size s = sizeDAO.getSizeById(od.getProductVariant().getSizeId());
                Color c = colorDAO.getColorById(od.getProductVariant().getColorId());
                Categories cat = categoryDAO.getCategoryById(p.getCategoryID());

                // Gộp vào FeedbackDisplayItem
                FeedbackDisplayItem item = new FeedbackDisplayItem();
                item.setOrderId(o.getOrderId());
                item.setOrderDate(o.getOrderDate());
                item.setOrderDetailId(od.getOrderDetailsId());
                item.setQuantity(od.getQuantity());
                item.setUnitPrice(od.getUnitPrice());
                item.setProductVariantId(variantId);
                item.setProductName(p.getProductName());
                item.setThumbnailUrl(p.getThumbnailURL());
                item.setSizeName(s.getName());
                item.setColorName(c.getName());
                item.setCategoryName(cat.getCategoryName());

                feedbackItems.add(item);
            }
        }

        request.setAttribute("feedbackItems", feedbackItems);
        request.getRequestDispatcher("/jsp/guest/ListProductFeedback.jsp").forward(request, response);
    
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
