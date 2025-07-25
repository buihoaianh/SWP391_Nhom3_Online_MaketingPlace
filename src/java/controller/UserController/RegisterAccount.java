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
import org.mindrot.jbcrypt.BCrypt;


/**
 *
 * @author Hi Windows 11 Home
 */
@WebServlet(name="LoginRegister", urlPatterns={"/registerAccount"})
public class RegisterAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        
        String password = request.getParameter("password");
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        
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
        session.setAttribute("password", hashedPassword);
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
        return fullName != null &&
               fullName.matches("^[\\p{L}0-9\\s]+$") &&
               fullName.matches(".*\\p{L}.*");
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