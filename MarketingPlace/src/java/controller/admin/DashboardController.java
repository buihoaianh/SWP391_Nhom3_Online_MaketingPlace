package controller.admin;

import dao.DashboardDAO;
import java.io.IOException;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DashboardController", urlPatterns = {"/admin"})
public class DashboardController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DashboardDAO dao = new DashboardDAO();

        int totalSellers = dao.getTotalSellers();
        int totalCustomers = dao.getTotalCustomers();
        int totalProducts = dao.getTotalProducts();
        double totalRevenue = dao.getTotalRevenue();
        String formattedRevenue = dao.formatRevenue(totalRevenue);

        Map<String, Double> topSellers = dao.getTopSellersRevenue();
        Map<String, Double> topCustomers = dao.getTopCustomersSpending();
        Map<String, Integer> productCountByCategory = dao.getProductCountByCategory();

        request.setAttribute("totalSellers", totalSellers);
        request.setAttribute("totalCustomers", totalCustomers);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalRevenue", formattedRevenue);

        request.setAttribute("topSellers", topSellers);
        request.setAttribute("topCustomers", topCustomers);
        request.setAttribute("productCountByCategory", productCountByCategory);

        request.getRequestDispatcher("/jsp/admin/Dashboard.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Dashboard Controller";
    }
}
