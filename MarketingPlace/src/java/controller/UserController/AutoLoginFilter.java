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
        String uri = request.getRequestURI();
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        if (isLoggedIn && (uri.endsWith("loginRegister.jsp") || uri.endsWith("/login") || uri.endsWith("/register"))) {
            response.sendRedirect(request.getContextPath() + "/Home");
            return;
        }

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

                if (acc != null && !response.isCommitted()) {
                    HttpSession s = request.getSession(false);
                    if (s == null) s = request.getSession(true);
                    s.setAttribute("user", acc);
                    System.out.println("AutoLoginFilter - User restored from token: " + acc.getEmail());
                }
            }
        }

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

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
