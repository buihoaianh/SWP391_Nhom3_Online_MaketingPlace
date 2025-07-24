package controller.admin;

import dao.StatisticAdminDashboardDAO;
import model.CategoryProductCount;
import model.ProductReportDTO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CategoryProductCount;
import model.ProductReportDTO;

@WebServlet(name = "StatisticCategoryAdmin", urlPatterns = {"/admin/statistic/statisticCategoryAdmin"})
public class StatisticCategoryAdmin extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sort = request.getParameter("sort");
        boolean asc = !"desc".equalsIgnoreCase(sort);

        StatisticAdminDashboardDAO dao = new StatisticAdminDashboardDAO();

        List<CategoryProductCount> sortedStats = dao.getSortedProductCount(asc);
        List<ProductReportDTO> reportList = dao.getProductsSortedByCategoryProductCount(asc);

        request.setAttribute("sort", sort);
        request.setAttribute("sortedStats", sortedStats);
        request.setAttribute("reportList", reportList);

        request.getRequestDispatcher("/jsp/admin/statisticCategoryAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Displays product statistics by category with sorting and reporting features.";
    }
}
