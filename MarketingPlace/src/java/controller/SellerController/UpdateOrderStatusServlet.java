package controller.SellerController;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "UpdateOrderStatusServlet", urlPatterns = {"/seller/update-order-status"})
public class UpdateOrderStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            int newStatusId = Integer.parseInt(request.getParameter("status"));

            OrderDAO dao = new OrderDAO();
            boolean updated = dao.updateOrderStatus(orderId, newStatusId);

            if (updated) {
                request.getSession().setAttribute("statusMessage", "Order status updated successfully.");
            } else {
                request.getSession().setAttribute("statusMessage", "Failed to update order status.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("statusMessage", "Error occurred while updating status.");
        }

        response.sendRedirect(request.getContextPath() + "/seller/list-order");
    }
}
