package controller.UserController;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/confirm-received")
public class ConfirmReceivedServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));

            // VNPAY: trạng thái chuyển từ "đang giao hàng" → "đã nhận hàng"
            OrderDAO dao = new OrderDAO();
            dao.updateOrderStatus(orderId, 2); // trạng thái "hoàn tất"

            response.sendRedirect("my-orders");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "Internal Server Error");
        }
    }
}
