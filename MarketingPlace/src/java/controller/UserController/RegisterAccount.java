/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.UserController;

import model.User;
import dao.UserDAO;
import dao.sendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;


/**
 *
 * @author Hi Windows 11 Home
 */
@WebServlet(name="LoginRegister", urlPatterns={"/registerAccount"})
public class RegisterAccount extends HttpServlet {
   
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
            out.println("<title>Servlet LoginRegister</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginRegister at " + request.getContextPath () + "</h1>");
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
       //request.getRequestDispatcher("admin/loginRegister.jsp").forward(request, response);
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

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String localAddress = request.getParameter("localAddress");

        UserDAO dao = new UserDAO();

        if (dao.isEmailExist(email)) {
            request.setAttribute("msg", "Email đã tồn tại!");
            request.getRequestDispatcher("jsp/sdmin/loginRegister.jsp").forward(request, response);
            return;
        }

        // Tạo OTP và gửi email
        sendEmail mailer = new sendEmail();
        String otp = String.valueOf((int) (Math.random() * 900000 + 100000)); // 6 số
        mailer.sendEmail(email, otp, fullName);

        // Lưu dữ liệu và otp vào session
        HttpSession session = request.getSession();
        session.setAttribute("otp", otp);
        session.setAttribute("email", email);
        session.setAttribute("password", password);
        session.setAttribute("fullName", fullName);
        session.setAttribute("phone", phone);
        session.setAttribute("localAddress", localAddress);

        response.sendRedirect("jsp/admin/verify.jsp");
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