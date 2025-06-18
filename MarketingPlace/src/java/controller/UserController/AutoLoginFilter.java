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
            Cookie[] cookies = request.getCookies();
            String token = null;

            if (cookies != null) {
                for (Cookie c : cookies) {
                    if ("remember_token".equals(c.getName())) {
                        token = c.getValue();
                        break;
                    }
                }
            }

            if (token != null) {
                UserDAO dao = new UserDAO();
                Account acc = dao.getUserByToken(token);

                if (acc != null) {
                    // Đăng nhập lại tự động
                    request.getSession(true).setAttribute("user", acc);
                    System.out.println("AutoLoginFilter - User restored from token: " + acc.getEmail());
                }
            }
        }

        chain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}

    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
