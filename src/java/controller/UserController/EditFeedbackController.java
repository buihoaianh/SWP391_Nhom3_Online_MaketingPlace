/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.UserController;

import dao.FeedbackDAO;
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
import java.util.UUID;
import model.Account;
import model.Feedbacks;
import utils.Helpers;

/**
 *
 * @author MinhTran
 */
@WebServlet(name="EditFeedbackController", urlPatterns={"/edit-feedback"})
@MultipartConfig(
  fileSizeThreshold = 1024*1024*2, // 2MB
  maxFileSize       = 1024*1024*10,// 10MB
  maxRequestSize    = 1024*1024*50 // 50MB
)
public class EditFeedbackController extends HttpServlet {
   
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
            out.println("<title>Servlet EditFeedbackController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditFeedbackController at " + request.getContextPath () + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int orderId       = Integer.parseInt(request.getParameter("orderId"));
        int variantId     = Integer.parseInt(request.getParameter("productVariantId"));
        int newRating     = Integer.parseInt(request.getParameter("rating"));
        String newComment = request.getParameter("comment");

        FeedbackDAO dao = new FeedbackDAO();
        try {
            // 1) Lấy existing feedback
            Feedbacks existing = dao.getFeedbackByOrderAndVariant(orderId, variantId);
            if (existing == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Feedback không tồn tại để cập nhật");
                return;
            }
            int feedbackId = existing.getFeedbackID();

            // 2) Cập nhật rating/comment nếu thay đổi
            if (existing.getRating() != newRating
             || (newComment != null && !newComment.equals(existing.getFeedbackText()))) {
                existing.setRating(newRating);
                existing.setFeedbackText(newComment);
                dao.updateFeedback(existing);  // method updateFeedback(Feedbacks)
            }

            // 3) XÓA TOÀN BỘ ẢNH CŨ TRONG DB
            dao.deleteImagesByFeedbackId(feedbackId);

            // 4) CHÈN LẠI ẢNH MỚI (nếu có); nếu không upload thì DB giờ không có ảnh nào
            for (Part part : request.getParts()) {
                if ("imageFiles".equals(part.getName()) && part.getSize() > 0) {
//                    String original  = Paths.get(part.getSubmittedFileName())
//                                            .getFileName().toString();
//                    String unique    = UUID.randomUUID() + "_" + original;
//                    String uploadDir = getServletContext().getRealPath("/uploads/feedback");
//                    File folder = new File(uploadDir);
//                    if (!folder.exists()) folder.mkdirs();
//
//                    File file = new File(folder, unique);
//                    part.write(file.getAbsolutePath());
                    String fileName = Helpers.saveImage(part, request, "feedback");
                    dao.insertImageFeedback(feedbackId, fileName);
                }
            }

            // 5) Chuyển về trang detail
            // Cuối cùng chọn redirect:
            String returnTo = request.getParameter("returnTo");  // "list" hoặc "detail"
            if ("detail".equals(returnTo)) {
                // quay về trang detail đúng item
                String url = String.format("%s/feedback-detail?orderId=%d&productVariantId=%d",
                                           request.getContextPath(), orderId, variantId);
                response.sendRedirect(url + "&updated=true");
            } else {
                // mặc định quay về list
                response.sendRedirect(request.getContextPath() + "/feedback?success=true");
            }

        } catch (Exception e) {
            throw new ServletException("Lỗi khi cập nhật feedback", e);
        }


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
