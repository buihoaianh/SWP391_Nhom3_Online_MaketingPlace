package controller.admin;

import dao.StatisticAdminDashboardDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CategoryProductCount;

@WebServlet(name = "StatisticController", urlPatterns = {"/admin/statistic/StatisticController"})
public class StatisticController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sort = request.getParameter("sort");
        boolean asc = !"desc".equalsIgnoreCase(sort); // mặc định là asc nếu không truyền

        StatisticAdminDashboardDAO dao = new StatisticAdminDashboardDAO();
        List<CategoryProductCount> sortedList = dao.getSortedProductCount(asc);

        // Chuyển sang JSON thủ công
        response.setContentType("application/json;charset=UTF-8");

        StringBuilder json = new StringBuilder();
        json.append("{\"categories\":[");
        StringBuilder values = new StringBuilder("\"values\":[");

        for (int i = 0; i < sortedList.size(); i++) {
            CategoryProductCount item = sortedList.get(i);
            json.append("\"").append(item.getCategoryName()).append("\"");
            values.append(item.getProductCount());

            if (i < sortedList.size() - 1) {
                json.append(",");
                values.append(",");
            }
        }

        json.append("],").append(values).append("]}");

        try (PrintWriter out = response.getWriter()) {
            out.write(json.toString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Provides product quantity data per category (JSON)";
    }
}
