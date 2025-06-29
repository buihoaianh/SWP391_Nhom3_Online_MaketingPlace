/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.CartController;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.Cart;

/**
 *
 * @author Admin
 */
@WebServlet("/confirm-checkout")
public class ConfirmCheckoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
        Account user = (Account) session.getAttribute("user");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("Home");
            return;
        }
        
        if(user == null) {
            request.getRequestDispatcher("/jsp/admin/loginRegister.jsp?tab=login").forward(request, response);
            return;
        }

        request.getRequestDispatcher("jsp/guest/confirmCheckout.jsp").forward(request, response);
    }
}
