/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.UserController;

import model.Account;
import dao.UserDAO;
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
@WebServlet(name = "VerifyAccount", urlPatterns = {"/VerifyAccount"})
public class VerifyAccount extends HttpServlet {

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
            String userType = (String) session.getAttribute("userType");
            int n = 3;
            if("seller".equals(userType)){
                n = 2;
            }
            // Tạo tài khoản trong DB
            UserDAO dao = new UserDAO();// Tạo user mới
            Account newUser = new Account(
                    0, // Tạm thời đặt ID là 0 vì nó tự động tăng
                    n, 
                    null,
                    fullName,
                    email,
                    password,
                    phone,
                    localAddress, // Giả sử PhoneNumber có thể để trống nếu chưa có
                    LocalDateTime.now(), // Ngày tạo tài khoản
                    true, // Giả sử mặc định tài khoản được kích hoạt
                    "",
                    ""// Mô tả có thể để trống nếu không cần nhập
            );
            dao.registerUser(newUser);

            // Clear session
            session.invalidate();

            // Hiển thị đăng ký thành công 3 giây
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<html><head><meta http-equiv='refresh' content='3;URL=jsp/admin/loginRegister.jsp'></head><body>");
            out.println("<h2>Đăng ký thành công! Đang chuyển hướng...</h2>");
            out.println("</body></html>");

        } else {
            request.setAttribute("msg", "Mã OTP không chính xác!");
            request.getRequestDispatcher("jsp/admin/verify.jsp").forward(request, response);
        }
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
