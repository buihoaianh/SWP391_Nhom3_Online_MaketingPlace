package controller.UserController;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/confirm-received-cod")
public class ConfirmReceivedCodServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));

            // Cập nhật trạng thái đơn hàng: COD → Payment Received → Completed
            OrderDAO dao = new OrderDAO();
            dao.updateOrderStatus(orderId, 7); // trạng thái "đã thanh toán"

            response.sendRedirect("my-orders");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "Internal Server Error");
        }
    }
}
