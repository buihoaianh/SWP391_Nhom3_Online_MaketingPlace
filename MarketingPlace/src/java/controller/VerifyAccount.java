/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.User;
import dal.UserDAO;
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
@WebServlet(name="VerifyAccount", urlPatterns={"/VerifyAccount"})
public class VerifyAccount extends HttpServlet {
   
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
            out.println("<title>Servlet VerifyAccount</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyAccount at " + request.getContextPath () + "</h1>");
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

        String inputOtp = request.getParameter("otp");
        HttpSession session = request.getSession();

        String sessionOtp = (String) session.getAttribute("otp");

        if (inputOtp.equals(sessionOtp)) {
            // Lấy dữ liệu đăng ký đã lưu
            String email = (String) session.getAttribute("email");
            String password = (String) session.getAttribute("password");
            String fullName = (String) session.getAttribute("fullName");
            String phone = (String) session.getAttribute("phone");
            String localAddress = (String) session.getAttribute("localAddress");

            // Tạo tài khoản trong DB
            UserDAO dao = new UserDAO();// Tạo user mới
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
            dao.registerUser(newUser);

            // Clear session
            session.invalidate();

            // Hiển thị đăng ký thành công 3 giây
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<html><head><meta http-equiv='refresh' content='3;URL=index.html'></head><body>");
            out.println("<h2>Đăng ký thành công! Đang chuyển hướng...</h2>");
            out.println("</body></html>");

        } else {
            request.setAttribute("msg", "Mã OTP không chính xác!");
            request.getRequestDispatcher("admin/verify.jsp").forward(request, response);
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
