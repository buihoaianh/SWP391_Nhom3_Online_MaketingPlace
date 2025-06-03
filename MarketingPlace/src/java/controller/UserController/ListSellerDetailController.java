/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.UserController;

import dao.SellerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import model.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ListSellerDetailController", urlPatterns = {"/admin/list-seller-detail"})
public class ListSellerDetailController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ListSellerDetailController</title>");  
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ListSellerDetailController at " + request.getContextPath () + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    } 

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
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/list-seller");
            return;
        }

        int sellerId = 0;
        try {
            sellerId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/list-seller");
            return;
        }

        SellerDao dao = new SellerDao();
        Account seller = dao.getSellerById(sellerId);
        if (seller == null) {
            request.setAttribute("errorMessage", "Not find seller have ID = " + sellerId);
            request.getRequestDispatcher("/jsp/admin/Error.jsp").forward(request, response);
            return;
        }
        
        LocalDateTime ldt = seller.getCreateDate();
        if (ldt != null) {
            // ZoneId.systemDefault() sẽ lấy múi giờ của server
            Date createDateAsDate = Date.from(ldt.atZone(ZoneId.systemDefault()).toInstant());
            request.setAttribute("createDateAsDate", createDateAsDate);
        } else {
            request.setAttribute("createDateAsDate", null);
        }

        request.setAttribute("sellerDetail", seller);
        request.getRequestDispatcher("/jsp/admin/ListSellerDetail.jsp")
                .forward(request, response);
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
