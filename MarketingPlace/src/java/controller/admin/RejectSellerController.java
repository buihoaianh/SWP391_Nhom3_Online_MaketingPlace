/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dao.SellerRequestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import model.Account;

/**
 *
 * @author MinhTran
 */
@WebServlet(name="RejectSellerController", urlPatterns={"/admin/request/reject"})
public class RejectSellerController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RejectSellerController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RejectSellerController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
         // Lấy requestId và lý do từ form gửi lên
        int requestId = Integer.parseInt(request.getParameter("requestId"));
        String reason = request.getParameter("reason");

        // Lấy người review (admin) từ session
        HttpSession session = request.getSession();
        Account admin = (Account) session.getAttribute("user");

        if (admin == null || admin.getRoleID() != 1) {
            response.sendRedirect(request.getContextPath() + "/loginAccount"); // chưa login
            return;
        }

        int reviewerId = admin.getAccountID(); // dùng ID thật của admin
        LocalDateTime now = LocalDateTime.now();

        // Gọi DAO để cập nhật DB
        SellerRequestDAO dao = new SellerRequestDAO();
        dao.rejectRequest(requestId, reason, reviewerId, now);

        // Quay lại trang chi tiết yêu cầu
        request.getRequestDispatcher("/jsp/admin/RequestList.jsp").forward(request, response);
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
