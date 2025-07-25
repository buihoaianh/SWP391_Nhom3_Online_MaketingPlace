package controller.UserController;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import model.Account;
import model.Order;

@WebServlet("/my-orders")
public class MyOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            Account acc = (Account) session.getAttribute("user");
            int customerId = acc.getAccountID();
            
            OrderDAO dao = new OrderDAO();
            List<Order> orders = dao.getOrdersByCustomerId(customerId);

            request.setAttribute("orders", orders);
            request.getRequestDispatcher("jsp/guest/my-order.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
