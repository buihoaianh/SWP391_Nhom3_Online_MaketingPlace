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
        String sort = request.getParameter("sort");
        int page = 1;
        int productsPerPage = 4;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }
        ProductDAO dao = new ProductDAO();
        ArrayList<Product> fullList;

        if (keyword != null && !keyword.trim().isEmpty()) {
            fullList = dao.searchProductsInCategoryByName(categoryId, keyword);
        } else if (priceFilter != null && !priceFilter.trim().isEmpty()) {
            fullList = dao.getProductsByCategoryWithPriceFilter(categoryId, priceFilter);
        } else if (sort != null && !sort.trim().isEmpty()) {
            switch (sort) {
                case "lowtohigh":
                    fullList = dao.getProductsSortedByPrice(categoryId, true);
                    break;
                case "hightolow":
                    fullList = dao.getProductsSortedByPrice(categoryId, false);
                    break;
                case "newest":
                    fullList = dao.getNewestProductsInCategory(categoryId);
                    break;
                default:
                    fullList = dao.getProductsByCategoryWithPrice(categoryId);
            }
        } else {
            fullList = dao.getProductsByCategoryWithPrice(categoryId);
        }

 
        int totalProducts = fullList.size();
        int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);
        int start = (page - 1) * productsPerPage;
        int end = Math.min(start + productsPerPage, totalProducts);

        ArrayList<Product> paginatedList = new ArrayList<>();
        if (start < end) {
            paginatedList.addAll(fullList.subList(start, end));
        }

        request.setAttribute("products", paginatedList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("cid", categoryId);
        request.setAttribute("query", keyword);
        request.setAttribute("price", priceFilter);
        request.setAttribute("sort", sort);

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
