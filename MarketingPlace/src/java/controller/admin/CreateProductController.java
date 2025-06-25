/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.CategoryDAO;
import dao.ColorDAO;
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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import model.Account;
import model.Category;
import model.Color;
import model.Product;
import model.ProductVariant;
import model.Size;
import utils.Helpers;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateProductController", urlPatterns = {"/admin/create-product"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
public class CreateProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            CategoryDAO cdao = new CategoryDAO();
            List<Category> categories = cdao.getAllCategories();
            request.setAttribute("categories", categories);

            SizeDAO sdao = new SizeDAO();
            List<Size> sizes = sdao.getSizes();
            request.setAttribute("sizes", sizes);

            ColorDAO colorDAO = new ColorDAO();
            List<Color> colors = colorDAO.getColors();
            request.setAttribute("colors", colors);

            request.getRequestDispatcher("/jsp/admin/CreateProduct.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            ProductDAO pdao = new ProductDAO();
            // Lấy dữ liệu từ form
            String productName = request.getParameter("productName");
            String categoryID = request.getParameter("categoryID");
            String description = request.getParameter("description");
            Part imagePart = request.getPart("image");
            Timestamp createDate = new Timestamp(System.currentTimeMillis());

            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("user");
            int createdBy = acc.getAccountID();

            // Lấy danh sách biến thể sản phẩm
            String[] colors = request.getParameterValues("color[]");
            String[] sizes = request.getParameterValues("size[]");
            String[] prices = request.getParameterValues("price[]");
            String[] quantities = request.getParameterValues("quantity[]");

            List<ProductVariant> variants = new ArrayList<>();

            // Lấy ảnh đúng
            String imageName = Helpers.saveImage(imagePart, request);

            for (int i = 0; i < colors.length; i++) {
                ProductVariant variant = new ProductVariant(
                        new Color(Integer.parseInt(colors[i])),
                        new Size(Integer.parseInt(sizes[i])),
                        Long.parseLong(prices[i]),
                        Integer.parseInt(quantities[i]));
                variants.add(variant);
            }

            // Lưu vào DB
//            Product product = new Product(createdBy,imageName, productName, Integer.parseInt(categoryID), createDate, description, "Active", variants);
//            pdao.createProduct(product);

            // Chuyển hướng sau khi tạo sản phẩm thành công
            request.setAttribute("message", "Create Product Success!");
            request.getRequestDispatcher("products").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Create Product Fail!: " + e.getMessage());
            request.getRequestDispatcher("products").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
