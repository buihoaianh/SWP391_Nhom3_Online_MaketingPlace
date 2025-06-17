/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.UserController;

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
        String localAddress = request.getParameter("fullAddress");
        String userType = request.getParameter("userType");

        UserDAO dao = new UserDAO();
        if (!isValidPhone(phone)) {
            request.setAttribute("error", "Số điện thoại không hợp lệ! Phải bắt đầu bằng 0 và gồm đúng 10 chữ số.");
            request.getRequestDispatcher("jsp/admin/loginRegister.jsp?tab=register").forward(request, response);
            return;
        }
        
        if (!isValidFullName(fullName)) {
            request.setAttribute("errorf", "Họ và tên không được chứa ký tự đặc biệt và không được toàn số.");
            request.getRequestDispatcher("jsp/admin/loginRegister.jsp?tab=register").forward(request, response);
            return;
        }

        if (!isValidPassword(password)) {
            request.setAttribute("errorp", "Mật khẩu chỉ được chứa chữ, số và ký tự '@'.");
            request.getRequestDispatcher("jsp/admin/loginRegister.jsp?tab=register").forward(request, response);
            return;
        }
        


        // Kiểm tra email phải kết thúc bằng @gmail.com
        if (email == null || !email.matches("^[A-Za-z0-9._%+-]+@gmail\\.com$")) {
            request.setAttribute("msg", "Email phải hợp lệ và kết thúc bằng @gmail.com");
            request.getRequestDispatcher("jsp/admin/loginRegister.jsp?tab=register").forward(request, response);
            return; // Dừng xử lý nếu không hợp lệ
        }


        if (dao.isEmailExist(email)) {
            request.setAttribute("msg", "Email đã tồn tại!");
            request.getRequestDispatcher("jsp/admin/loginRegister.jsp?tab=register").forward(request, response);
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
        session.setAttribute("userType", userType);

        response.sendRedirect("jsp/admin/verify.jsp");
    }
    
    
    public boolean isValidPhone(String phone) {
        return phone != null && phone.matches("^0\\d{9}$");
    }
    
    public boolean isValidFullName(String fullName) {
        // Cho phép chữ cái và số, ít nhất 1 chữ cái, không ký tự đặc biệt
        return fullName != null &&
               fullName.matches("^[a-zA-Z0-9\\s]+$") &&         // Chỉ chữ cái + số + khoảng trắng
               fullName.matches(".*[a-zA-Z].*");                // Phải có ít nhất một chữ cái
    }
    
    public boolean isValidPassword(String password) {
        return password != null && password.matches("^[a-zA-Z0-9@]+$");
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