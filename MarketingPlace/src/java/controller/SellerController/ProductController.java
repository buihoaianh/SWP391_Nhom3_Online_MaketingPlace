/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.SellerController;

import controller.admin.*;
import dao.CategoriesDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Categories;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProductController", urlPatterns = {"/seller/products"})
public class ProductController extends HttpServlet {

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
            ProductDAO dao = new ProductDAO();
            List<Product> products = dao.getProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("/jsp/seller/ProductList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi xảy ra: " + e.getMessage());
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
        
        String categoryName = request.getParameter("category");
        CategoriesDAO dao = new CategoriesDAO();
        ProductDAO daop = new ProductDAO();

        if (categoryName != null && !categoryName.trim().isEmpty()) {
            List<Categories> categoryList = dao.searchCategoryByName(categoryName);
            List<Product> matchedProducts = new ArrayList<>();

            for (Categories c : categoryList) {
                List<Product> productsByCat = daop.getProductsByCategoryId(c.getCategoryID());
                matchedProducts.addAll(productsByCat);
            }

            request.setAttribute("products", matchedProducts);
        } else {
            List<Product> allProducts = daop.getProducts();
            request.setAttribute("products", allProducts);
        }

        request.getRequestDispatcher("/jsp/seller/ProductList.jsp").forward(request, response);


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
