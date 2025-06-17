/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.UserController;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.UserDAO;
import model.Account;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

/**
 *
 * @author Hi Windows 11 Home
 */
@WebFilter("/*")
public class AutoLoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
                         FilterChain chain) throws IOException, ServletException {

        //Filter sẽ chạy trước bất kỳ servlet hoặc JSP nào.
        // nó cố gắng tự động đăng nhập từ cookie.
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        HttpSession session = request.getSession(false);
        //getSession(false) chỉ lấy session hiện có, KHÔNG tạo session mới nếu chưa tồn tại.
        //Nếu chưa có session → trả về null.
        // Nếu chưa có session hoặc chưa có user trong session → bắt đầu kiểm tra cookie.
        if (session == null || session.getAttribute("user") == null) {
            // Chưa đăng nhập -> kiểm tra cookie
            Cookie[] cookies = request.getCookies();
            String email = null;
            String pass = null;
            String remember = null;

            if (cookies != null) {
                for (Cookie c : cookies) {
                    switch (c.getName()) {
                        case "email":
                            email = c.getValue();
                            break;
                        case "pass":
                            pass = c.getValue();
                            break;
                        case "remember":
                            remember = c.getValue();
                            break;
                    }
                }
            }

            // Nếu đủ thông tin và remember = true
            if (email != null && pass != null && "true".equals(remember)) {
                UserDAO dao = new UserDAO();
                if (dao.login(email, pass)) {
                    Account acc = dao.getUserByEmail(email);
                    request.getSession(true).setAttribute("user", acc);
                    System.out.println("AutoLogin - User restored from cookie: " + acc);
                }
            }
        }

        chain.doFilter(servletRequest, servletResponse);
    }

    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
