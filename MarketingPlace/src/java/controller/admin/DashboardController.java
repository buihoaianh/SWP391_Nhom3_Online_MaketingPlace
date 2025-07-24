/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import controller.UserController.*;
import dao.DashboardDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DashboardController", urlPatterns = {"/admin"})
public class DashboardController extends HttpServlet {
private static final long serialVersionUID = 1L;
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        
//        request.getRequestDispatcher("/jsp/admin/Dashboard.jsp").forward(request, response);
//    }

    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    DashboardDAO dao = new DashboardDAO();

    int totalSellers = dao.getTotalSellers();
    int totalCustomers = dao.getTotalCustomers();
    int totalProducts = dao.getTotalProducts();

    Map<String, Double> topSellers = dao.getTopSellersRevenue();
    Map<String, Double> topCustomers = dao.getTopCustomersSpending();

    request.setAttribute("totalSellers", totalSellers);
    request.setAttribute("totalCustomers", totalCustomers);
    request.setAttribute("totalProducts", totalProducts);

    request.setAttribute("topSellers", topSellers);
    request.setAttribute("topCustomers", topCustomers);

    request.getRequestDispatcher("/jsp/admin/Dashboard.jsp")
           .forward(request, response);
}



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         doGet(request, response);
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
