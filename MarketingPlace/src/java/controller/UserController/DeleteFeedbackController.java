/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.UserController;

import dao.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Feedbacks;

/**
 *
 * @author MinhTran
 */
@WebServlet(name="DeleteFeedbackController", urlPatterns={"/delete-feedback"})
public class DeleteFeedbackController extends HttpServlet {
   
     

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // 1. Kiểm tra login
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 2. Đọc param
        int orderId      = Integer.parseInt(request.getParameter("orderId"));
        int variantId    = Integer.parseInt(request.getParameter("productVariantId"));

        FeedbackDAO dao = new FeedbackDAO();
        try {
            // 3. Lấy feedback hiện tại
            Feedbacks fb = dao.getFeedbackByOrderAndVariant(orderId, variantId);
            if (fb != null) {
                int feedbackId = fb.getFeedbackID();

                // 4a. Xóa sạch ảnh cũ
                dao.deleteImagesByFeedbackId(feedbackId);

                // 4b. Reset rating, text, status về trạng thái “chưa phản hồi”
                fb.setRating(0);
                fb.setFeedbackText(null);
                fb.setStatus(0);
                // Giữ nguyên CreateFeedbackDate nếu không muốn cập nhật ngày
                dao.updateFeedback(fb);
            }

            // 5. Redirect về list feedback
            response.sendRedirect(request.getContextPath() + "/feedback?success=true");
        } catch (Exception e) {
            throw new ServletException("Lỗi khi xóa mềm feedback", e);
        }
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
