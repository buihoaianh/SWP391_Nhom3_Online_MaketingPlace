/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

/**
 *
 * @author tulok
 */
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

import java.io.IOException;

@WebFilter("/*")
public class AuthorizationFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        String uri = req.getRequestURI();

        Account user = (session != null) ? (Account) session.getAttribute("user") : null;

  
        if (uri.contains("/admin")) {
            if (user == null || user.getRoleID() != 1) {
                res.sendRedirect(req.getContextPath() + "/jsp/public/Unauthorized.jsp");
                return;
            }
        }

        if (uri.contains("/seller")) {
            if (user == null || user.getRoleID() != 2) {
                res.sendRedirect(req.getContextPath() + "/jsp/public/Unauthorized.jsp");
                return;
            }
        }

        chain.doFilter(request, response);
    }
}