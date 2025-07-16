/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.UserController;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Product;

/**
 *
 * @author tulok
 */
@WebServlet(name = "ProductByCategory", urlPatterns = {"/ProductByCategory"})
public class ProductByCategory extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        int categoryId = Integer.parseInt(request.getParameter("cid"));
        String keyword = request.getParameter("query");
        String priceFilter = request.getParameter("price");
        ProductDAO dao = new ProductDAO();
        ArrayList<Product> products;
        if (keyword != null && !keyword.trim().isEmpty()) {
         
            products = dao.searchProductsInCategoryByName(categoryId, keyword);
        } else if (priceFilter != null && !priceFilter.trim().isEmpty()) {
          
            products = dao.getProductsByCategoryWithPriceFilter(categoryId, priceFilter);
        } else {
           
            products = dao.getProductsByCategoryWithPrice(categoryId);
        }

        request.setAttribute("products", products);
        request.setAttribute("cid", categoryId);
        request.setAttribute("query", keyword);
        request.setAttribute("price", priceFilter);
        request.getRequestDispatcher("jsp/public/Category.jsp").forward(request, response);
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
        request.getRequestDispatcher("/jsp/public/Category.jsp").forward(request, response);
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
