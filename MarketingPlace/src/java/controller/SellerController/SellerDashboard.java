/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.SellerController;

import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import model.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SellerDashboard", urlPatterns = {"/saller-dashboard"})
public class SellerDashboard extends HttpServlet {

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
        request.getRequestDispatcher("jsp/seller/SellerDashboard.jsp").forward(request, response);
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
        UserDAO dao = new UserDAO();

        // B1: Khởi tạo danh sách 12 tháng với giá trị mặc định là 0
        Map<String, Integer> stats = new java.util.LinkedHashMap<>();
        for (int i = 1; i <= 12; i++) {
            String month = String.format("2025-%02d", i); // format: yyyy-MM
            stats.put(month, 0);
        }

        // B2: Gộp dữ liệu từ DB vào map đã khởi tạo
        Map<String, Integer> dbStats = dao.getCustomerAccountStatsByMonth(); // đã lấy dữ liệu thật
        for (Map.Entry<String, Integer> entry : dbStats.entrySet()) {
            stats.put(entry.getKey(), entry.getValue()); // cập nhật lại giá trị nếu có
        }

        List<Account> topCustomers = dao.getRandomTopCustomers(3);
        request.setAttribute("topCustomers", topCustomers);

        // B3: Gửi đến JSP
        request.setAttribute("stats", stats);
        request.getRequestDispatcher("jsp/seller/SellerDashboard.jsp").forward(request, response);
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
        processRequest(request, response);
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
