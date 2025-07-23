/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.UserController;

import dao.CategoriesDAO;
import dao.ColorDAO;
import dao.FeedbackDAO;
import dao.ProductDAO;
import dao.SizeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Categories;
import model.Color;
import model.FeedbackDisplayItem;
import model.Feedbacks;
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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        if (acc == null) {
            response.sendRedirect("Home");
            return;
        }
        int accountId = acc.getAccountID();

        FeedbackDAO   feedbackDAO   = new FeedbackDAO();
        SizeDAO       sizeDAO       = new SizeDAO();
        ColorDAO      colorDAO      = new ColorDAO();
        ProductDAO    productDAO    = new ProductDAO();
        CategoriesDAO categoryDAO   = new CategoriesDAO();

        // 1) Lấy các đơn đã Success
        List<Order> successfulOrders = feedbackDAO.getSuccessfulOrders(accountId);

        // 2) Build raw list
        List<FeedbackDisplayItem> raw = new ArrayList<>();
        for (Order o : successfulOrders) {
            List<OrderDetail> details =
                feedbackDAO.getOrderProductDetailsByOrderID(o.getOrderId());
            for (OrderDetail od : details) {
                int orderId   = o.getOrderId();
                int variantId = od.getProductVariant().getProductVariantId();

                // Lấy feedback nếu có
                Feedbacks fb = feedbackDAO.getFeedbackByOrderAndVariant(orderId, variantId);

                // Lấy thông tin sản phẩm
                Product p = productDAO.getProductByIdFb(od.getProductVariant().getProductId());
                Size    s = sizeDAO.getSizeById(od.getProductVariant().getSizeId());
                Color   c = colorDAO.getColorById(od.getProductVariant().getColorId());
                Categories cat = categoryDAO.getCategoryById(p.getCategoryID());

                // Tạo item
                FeedbackDisplayItem item = new FeedbackDisplayItem();
                item.setOrderId(orderId);
                item.setOrderDetailId(od.getOrderDetailsId());
                item.setOrderDate(o.getOrderDate());
                item.setProductVariantId(variantId);
                item.setProductName(p.getProductName());
                item.setThumbnailUrl(p.getThumbnailURL());
                item.setSizeName(s.getName());
                item.setColorName(c.getName());
                item.setCategoryName(cat.getCategoryName());
                item.setQuantity(od.getQuantity());
                item.setUnitPrice(od.getUnitPrice());
                item.setTotalPrice(od.getQuantity() * Long.parseLong(od.getUnitPrice())
                );

                // Gán feedback nếu có
                if (fb != null) {
                    item.setRating(fb.getRating());
                    item.setFeedbackText(fb.getFeedbackText());
                    item.setFeedbackImages(
                      feedbackDAO.getImageUrlsByFeedbackId(fb.getFeedbackID())
                    );
                }

                raw.add(item);
            }
        }

        // 3) Gom nhóm theo variantId + orderDate
        Map<String, FeedbackDisplayItem> map = new LinkedHashMap<>();
        for (FeedbackDisplayItem it : raw) {
            String key = it.getProductVariantId() + "_" + it.getOrderDate();
            if (map.containsKey(key)) {
                FeedbackDisplayItem exist = map.get(key);
                // cộng dồn số lượng
                int newQty = exist.getQuantity() + it.getQuantity();
                exist.setQuantity(newQty);
                // tổng tiền cập nhật
                long unit = Long.parseLong(exist.getUnitPrice());
                exist.setTotalPrice(unit * newQty);
                // nếu chưa có feedback, nhưng it có, ưu tiên it (thường chỉ 1 feedback mỗi group)
                if (it.getRating() > 0) {
                    // nếu group chưa có feedback (rating=0) và it có rating >0
                    exist.setRating(it.getRating());
                    exist.setFeedbackText(it.getFeedbackText());
                    exist.setFeedbackImages(it.getFeedbackImages());
                }
            } else {
                map.put(key, it);
            }
        }
        List<FeedbackDisplayItem> groupedList = new ArrayList<>(map.values());

        // 4) Forward
        request.setAttribute("feedbackItems", groupedList);
        request.getRequestDispatcher("/jsp/guest/ListProductFeedback.jsp")
               .forward(request, response);
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
