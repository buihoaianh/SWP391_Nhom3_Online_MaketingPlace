/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.UserController;

import model.Account;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Cookie;
import org.mindrot.jbcrypt.BCrypt;
import java.util.UUID;

/**
 *
 * @author Hi Windows 11 Home
 */
@WebServlet(name = "LoginAccount", urlPatterns = {"/loginAccount"})
public class LoginAccount extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String email = request.getParameter("email");

        String password = request.getParameter("password");

        String remember = request.getParameter("remember"); // lấy giá trị checkbox

        UserDAO dao = new UserDAO();
        Boolean emailExist = dao.isEmailExist(email);
        Account user = dao.getUserByEmail(email);

        if (!emailExist || null == user) {
            request.setAttribute("mess", "Sai email!");
            request.getRequestDispatcher("jsp/admin/loginRegister.jsp").forward(request, response);
            return;
        }

        // Lấy hashedPassword từ database
        String hashedPassword = user.getPassword(); // Giả sử Account có getPassword() trả về hashedPassword

        // So sánh mật khẩu người dùng nhập với hashedPassword
        boolean isPasswordMatch = BCrypt.checkpw(password, hashedPassword);

        if (!isPasswordMatch) {
            request.setAttribute("mess", "Sai mật khẩu!");
            request.getRequestDispatcher("jsp/admin/loginRegister.jsp").forward(request, response);
            return;
        }
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        if (remember != null) {
            // Sinh token ngẫu nhiên
            String token = UUID.randomUUID().toString();

            // Lưu token vào DB liên kết với user
            dao.storeLoginToken(user.getAccountID(), token); // Lưu token vào DB

            // Tạo cookie lưu token
            Cookie rememberCookie = new Cookie("remember_token", token);
            //Bạn gửi token này về trình duyệt qua cookie
            rememberCookie.setMaxAge(30 * 24 * 60 * 60); // 30 ngày
            rememberCookie.setHttpOnly(true);
            rememberCookie.setSecure(true); // chỉ nếu bạn dùng HTTPS
            rememberCookie.setPath("/");

            response.addCookie(rememberCookie);
            //Bạn gửi token này về trình duyệt qua cookie
        } else {
            // Xóa cookie nếu không tick remember
            Cookie rememberCookie = new Cookie("remember_token", "");
            rememberCookie.setMaxAge(0);
            rememberCookie.setPath("/");
            response.addCookie(rememberCookie);
        }

        // Chuyển trang và lưu thông báo vào localStorage
        // Xử lý đăng nhập thành công
        // Sau khi kiểm tra đăng nhập thành công:
        String fullName = user.getFullName(); // hoặc thông tin gì mày muốn truyền sang home.jsp
        session.setAttribute("message", "Login successful! Welcome " + fullName);

        // Sau khi đăng nhập thành công
        int role = user.getRoleID(); // Giả sử bạn có trường roleID trong Account

        if (role == 2) {
            // Chuyển đến trang admin
            response.sendRedirect(request.getContextPath() + "/saller-dashboard");
        } else {
            // Chuyển đến trang người dùng bình thường
            request.getRequestDispatcher("/jsp/public/Home.jsp").forward(request, response);
        }//chinh
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
