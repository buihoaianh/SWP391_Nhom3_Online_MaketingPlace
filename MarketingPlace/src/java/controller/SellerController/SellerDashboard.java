package controller.SellerController;

import dao.OrderDAO;
import dao.ProductDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;
import model.Account;
import model.TopProduct;

@WebServlet(name = "SellerDashboard", urlPatterns = {"/seller/seller-dashboard"})
public class SellerDashboard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy seller đang đăng nhập từ session
        HttpSession session = request.getSession();
        Account seller = (Account) session.getAttribute("user");
        if (seller == null || seller.getRoleID() != 2) {
            response.sendRedirect(request.getContextPath() + "/jsp/admin/loginRegister.jsp?tab=login");
            return;
        }

        int sellerId = seller.getAccountID();

        OrderDAO orderDAO = new OrderDAO();

        // 1. Lấy doanh thu theo tháng
        Map<String, Double> stats = new LinkedHashMap<>();
        for (int i = 1; i <= 12; i++) {
            String month = String.format("2025-%02d", i);
            stats.put(month, 0.0);
        }
        Map<String, Double> dbStats = orderDAO.getRevenueByMonth(sellerId);
        for (Map.Entry<String, Double> entry : dbStats.entrySet()) {
            stats.put(entry.getKey(), entry.getValue());
        }

        // 2. Lấy thống kê đơn "Thành công" và "Đã hủy"
        Map<String, Integer> orderStatusStats = orderDAO.getOrderStatusStatsBySeller(sellerId);

        // 3. Top 3 khách hàng ngẫu nhiên
        UserDAO dao = new UserDAO();
        List<Account> topCustomers = dao.getTopCustomersBySeller(sellerId, 3);
        double totalRevenue = orderDAO.getTotalRevenueBySeller(sellerId);
        request.setAttribute("totalRevenue", totalRevenue);
        int totalOrders = orderDAO.getTotalOrderBySeller(sellerId);
        request.setAttribute("totalOrders", totalOrders);
        ProductDAO productDAO = new ProductDAO();
        int totalProducts = productDAO.getTotalProductsBySeller(sellerId);
        request.setAttribute("totalProducts", totalProducts);
        
        List<TopProduct> topProducts = productDAO.getTopSellingProductsBySeller(sellerId);
        request.setAttribute("topProducts", topProducts);

        // Gửi tới JSP
        request.setAttribute("stats", stats);
        request.setAttribute("orderStatusStats", orderStatusStats);
        request.setAttribute("topCustomers", topCustomers);
        request.getRequestDispatcher("/jsp/seller/SellerDashboard.jsp").forward(request, response);
    }
}
