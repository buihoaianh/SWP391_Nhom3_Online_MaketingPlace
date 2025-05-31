/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.User;
import dal.UserDAO;
import dal.sendEmail;
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
            request.getRequestDispatcher("loginRegister.jsp").forward(request, response);
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

        response.sendRedirect("admin/verify.jsp");
    }
    
    /*@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); // tránh lỗi tiếng Việt nếu có
        response.setContentType("text/html;charset=UTF-8");

        UserDAO daoUser = new UserDAO();
        
        String email = request.getParameter("email");
        //email nó có tồn tại ở trong DB hay ko
        User userExist = daoUser.checkEmailExists(email);
        // Kiểm tra email tồn tại
        if (userExist != null){
            request.setAttribute("msg", "Email đã tồn tại.");
            request.getRequestDispatcher("admin/loginRegister.jsp").forward(request, response);
            return;
        }
        
        //email chưa tồn tài 
        // Lấy dữ liệu từ form
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String localAddress = request.getParameter("localAddress");

        // Tạo user mới
        User newUser = new User(
            0, // Tạm thời đặt ID là 0 vì nó tự động tăng
            3, // Giả sử RoleID mặc định là 3, là customer
            email,
            password,
            fullName,
            phone,
            localAddress, // Giả sử PhoneNumber có thể để trống nếu chưa có
            LocalDateTime.now(), // Ngày tạo tài khoản
            1, // Giả sử mặc định tài khoản được kích hoạt
            ""  // Mô tả có thể để trống nếu không cần nhập
        );


        // Gọi DAO để đăng ký
        User registeredUser = daoUser.registerUser(newUser);

        
        // Tạo mã xác minh và gửi mail
        sendEmail send = new sendEmail();
        String token = send.generateToken();
        String verifyLink = "http://localhost:8080/MarketingPlace/verify?token=" + token;
        send.sendEmail(email, verifyLink, fullName);

        // Lưu vào session
        HttpSession session = request.getSession();
        // THÀNH CÔNG: chuyển hướng hoặc hiện thông báo
        session.setAttribute("mess", "Đăng ký thành công!");
        session.setAttribute("tempUser", newUser);
        response.sendRedirect("verify.jsp"); // Trang yêu cầu xác nhận
       
}
    */


    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}