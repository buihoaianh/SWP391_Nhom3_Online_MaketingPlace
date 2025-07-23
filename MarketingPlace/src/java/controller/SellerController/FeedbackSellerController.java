/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.SellerController;

import dao.CategoriesDAO;
import dao.ColorDAO;
import dao.FeedbackDAO;
import dao.ProductDAO;
import dao.SizeDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
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
 * @author MinhTran
 */
@WebServlet(name="FeedbackSellerController", urlPatterns={"/seller/feedback"})
public class FeedbackSellerController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        // 0. Lấy seller đang đăng nhập
        HttpSession session = request.getSession();
        Account seller = (Account) session.getAttribute("user");
        if (seller == null) {
            response.sendRedirect("Home");
            return;
        }
        int sellerId = seller.getAccountID();

        FeedbackDAO     feedbackDAO   = new FeedbackDAO();
        UserDAO         accountDAO    = new UserDAO();
        SizeDAO         sizeDAO       = new SizeDAO();
        ColorDAO        colorDAO      = new ColorDAO();
        ProductDAO      productDAO    = new ProductDAO();
        CategoriesDAO   categoryDAO   = new CategoriesDAO();

        // 2. Lấy danh sách order thành công của seller đăng đăng nhập vì mỗi tl seller là khác nhau 
        List<Order> successfulOrders = feedbackDAO.getSuccessfulOrdersBySeller(sellerId);
        //o.OrderID, o.OrderDate, o.TotalAmount, o.CustomerID 

        List<FeedbackDisplayItem> feedbackItems = new ArrayList<>();

        // 3. Lặp qua từng order
        for (Order o : successfulOrders) {
            List<OrderDetail> details = feedbackDAO.getOrderProductDetailsByOrderIDSeller(o.getOrderId());

            for (OrderDetail od : details) {
                int orderId     = o.getOrderId();
                int variantId   = od.getProductVariant().getProductVariantId();

                // 4. Lấy Feedback theo OrderID + VariantID
                Feedbacks fb = feedbackDAO.getFeedbackByOrderAndVariant(orderId, variantId);
                if (fb == null) continue;   // chưa có feedback thì bỏ qua

                // 5. Build DTO để đẩy lên JSP
                FeedbackDisplayItem item = new FeedbackDisplayItem();
                // — thông tin đơn + customer
                item.setOrderId(orderId);
                item.setOrderDate(o.getOrderDate());
                Account customer = accountDAO.getAccountById(o.getCustomerId());
                item.setCustomerName(customer.getFullName());

                // — thông tin sản phẩm
                Product p = productDAO.getProductByIdFb(od.getProductVariant().getProductId());
                item.setProductName(p.getProductName());
                item.setThumbnailUrl(p.getThumbnailURL());
                
                Size s = sizeDAO.getSizeById(od.getProductVariant().getSizeId());
                item.setSizeName(s.getName());
                
                Color c = colorDAO.getColorById(od.getProductVariant().getColorId());
                item.setColorName(c.getName());
                
                Categories cat = categoryDAO.getCategoryById(p.getCategoryID());
                item.setCategoryName(cat.getCategoryName());
                
                item.setQuantity(od.getQuantity());
                item.setUnitPrice(od.getUnitPrice());
                item.setProductVariantId(variantId);

                // — phần feedback
                item.setRating(fb.getRating());
                item.setFeedbackDate(fb.getCreateFeedbackDate());
                //Feedback text (nếu có)
                item.setFeedbackText(fb.getFeedbackText());
                // — list ảnh (nếu có)
                List<String> imgs = feedbackDAO.getImageUrlsByFeedbackId(fb.getFeedbackID());
                item.setFeedbackImages(imgs);

                feedbackItems.add(item);
            }
        }

        // 6. Forward sang JSP
        request.setAttribute("feedbackItems", feedbackItems);
        request.getRequestDispatcher("/jsp/seller/FeedbackToSeller.jsp")
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
//        request.setCharacterEncoding("UTF-8");
//
//        HttpSession session = request.getSession();
//        Account acc = (Account) session.getAttribute("user");
//        if (acc == null) {
//            response.sendRedirect("login");
//            return;
//        }
//
//        int accountId = acc.getAccountID();
//        int productVariantId = Integer.parseInt(request.getParameter("productVariantId"));
//        int orderId = Integer.parseInt(request.getParameter("orderId"));
//        int orderDetailId = Integer.parseInt(request.getParameter("orderDetailId"));
//        int rating = Integer.parseInt(request.getParameter("rating")); // ⭐ Bắt buộc
//        String comment = request.getParameter("comment");              // 📝 Tùy chọn
//
//        FeedbackDAO feedbackDAO = new FeedbackDAO();
//
//        // 1. Insert feedback chính
//        int feedbackId = feedbackDAO.insertFeedback(accountId, comment, rating, productVariantId, orderId);
//
//        // 2. Xử lý ảnh (nếu có)
//        Collection<Part> parts = request.getParts();
//        for (Part part : parts) {
//            if (part.getName().equals("imageFiles") && part.getSize() > 0) {
//                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//                String uploadDir = getServletContext().getRealPath("/uploads/feedback/");
//                File uploadFolder = new File(uploadDir);
//                if (!uploadFolder.exists()) uploadFolder.mkdirs();
//
//                String filePath = uploadDir + File.separator + fileName;
//                part.write(filePath);
//
//                // Ghi vào DB
//                feedbackDAO.insertImageFeedback(feedbackId, "uploads/feedback/" + fileName);
//            }
//        }
//
//        // 3. Cập nhật trạng thái OrderDetail
//        feedbackDAO.updateOrderDetailStatus(orderDetailId, 1);
//
//        // 4. Redirect lại hoặc thông báo thành công
//        request.getRequestDispatcher("/jsp/seller/FeedbackToSeller.jsp").forward(request, response);
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
