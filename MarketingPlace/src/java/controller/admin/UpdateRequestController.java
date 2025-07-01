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
import model.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateRequestController", urlPatterns = {"/admin/request/update"})
public class UpdateRequestController extends HttpServlet {

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
         HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        int reviewerID = acc.getAccountID();
        //Lấy HttpSession hiện tại để biết ai đang đăng nhập.
        //Lấy Account từ session → chính là admin hiện tại.
        //Lấy accountID của admin để ghi vào cột ReviewedBy.
        
        int requestID = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");
        //lấy về được Approve hay là reject 

        String status = "";
        String reason = request.getParameter("reason") != null ? request.getParameter("reason") : "";
        //status: chuẩn bị gán giá trị "Approve" hoặc "Reject".
        //reason: nếu form có lý do từ chối, lấy nó. Nếu không có (null) thì để rỗng.

        SellerRequestDAO dao = new SellerRequestDAO();

        try {
            if ("approve".equalsIgnoreCase(action)) {
                status = "Approve";
                // Cập nhật SellerRequests
                dao.updateRequestStatus(requestID, status, reviewerID, null);
                // Cập nhật trạng thái account → ACTIVE
                dao.updateAccountStatusToActive(requestID);
            } else if ("reject".equalsIgnoreCase(action)) {
                status = "Reject";
                //Gán status = "Reject" và gọi DAO cập nhật SellerRequests:
                dao.updateRequestStatus(requestID, status, reviewerID, reason);
            }

            response.sendRedirect(request.getContextPath() + "/admin/requests");
        } catch (Exception e) {
            throw new ServletException(e);
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
