
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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

import java.nio.file.Paths;
import java.util.Arrays;
import model.Account;
import model.Categories;
import model.Color;
import model.FeedbackDisplayItem;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.Size;


@WebServlet(name = "FeedbackDetailController", urlPatterns = {"/seller/feedback-detail"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class FeedbackDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int variantId = Integer.parseInt(request.getParameter("productVariantId"));
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        if (acc == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        SizeDAO sizeDAO = new SizeDAO();
        ColorDAO colorDAO = new ColorDAO();
        ProductDAO productDAO = new ProductDAO();
        CategoriesDAO categoryDAO = new CategoriesDAO();
        OrderDAO orderDAO = new OrderDAO(); // để lấy orderDate

        OrderDetail od = feedbackDAO.getOrderDetailByOrderIdAndVariantId(orderId, variantId);
        Product p = productDAO.getProductByIdFb(od.getProductVariant().getProductId());
        Size s = sizeDAO.getSizeById(od.getProductVariant().getSizeId());
        Color c = colorDAO.getColorById(od.getProductVariant().getColorId());
        Categories cat = categoryDAO.getCategoryById(p.getCategoryID());
        Order order = orderDAO.getOrderById(orderId); // Lấy ngày đặt

        FeedbackDisplayItem item = new FeedbackDisplayItem();
        item.setOrderId(orderId);
        item.setOrderDate(order.getOrderDate());
        item.setQuantity(od.getQuantity());
        item.setUnitPrice(od.getUnitPrice());
        item.setProductVariantId(variantId);
        item.setProductName(p.getProductName());
        item.setThumbnailUrl(p.getThumbnailURL());
        item.setSizeName(s.getName());
        item.setColorName(c.getName());
        item.setCategoryName(cat.getCategoryName());

        request.setAttribute("feedbackItems", Arrays.asList(item));
        request.getRequestDispatcher("/jsp/guest/FeedbackDetail.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        if (acc == null) {
            response.sendRedirect("login");
            return;
        }

        int accountId = acc.getAccountID();
        int productVariantId = Integer.parseInt(request.getParameter("productVariantId"));
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        // Xử lý file ảnh
        Part filePart = request.getPart("imageFile");
        String imagePath = null;

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadDir = getServletContext().getRealPath("/uploads/feedback");
            File uploadFolder = new File(uploadDir);
            if (!uploadFolder.exists()) uploadFolder.mkdirs();

            File file = new File(uploadFolder, fileName);
            filePart.write(file.getAbsolutePath());

            imagePath = "uploads/feedback/" + fileName;
        }

        // Insert vào DB
        FeedbackDAO dao = new FeedbackDAO();
        //dao.insertFeedback(accountId, productVariantId, orderId, rating, comment, imagePath);

        response.sendRedirect(request.getContextPath() + "/feedback");
    }
}

