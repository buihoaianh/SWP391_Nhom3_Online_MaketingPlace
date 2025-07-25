package controller.admin;

import dao.CustomerMemberLevelDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CustomerLevelInfo;

@WebServlet(name = "CustomerLevelHistoryController", urlPatterns = {"/admin/listMemberRanking/CustomerInLevel/CustomerLevelHistoryURL"})
public class CustomerLevelHistoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerIdRaw = request.getParameter("customerID");
        String memberIdRaw = request.getParameter("memberID");
        int page = 1;
        int pageSize = 3;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        if (memberIdRaw != null && memberIdRaw.matches("\\d+")) {
            request.setAttribute("memberID", memberIdRaw);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid memberID format.");
            return;
        }

        if (customerIdRaw != null) {
            try {
                int customerId = Integer.parseInt(customerIdRaw);
                CustomerMemberLevelDAO dao = new CustomerMemberLevelDAO();

                dao.syncOrderHistoryFromOrders();
                dao.updateCustomerMemberLevelsFromOrders();

                // Gọi DAO có phân trang
                List<CustomerLevelInfo> historyList = dao.getCustomerOrderHistoryWithLevelPaging(customerId, page, pageSize);
                int totalRecords = dao.countOrderHistoryByCustomerID(customerId);
                int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

                if (!historyList.isEmpty()) {
                    request.setAttribute("customerName", historyList.get(0).getFullName());
                }

                request.setAttribute("historyList", historyList);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);

                request.getRequestDispatcher("/jsp/admin/CustomerLevelHistory.jsp").forward(request, response);

            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/jsp/admin/CustomerByLevel.jsp");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/jsp/admin/CustomerByLevel.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("/admin/MemberURL");
    }

    @Override
    public String getServletInfo() {
        return "CustomerLevelHistoryController : Show rank history by customer";
    }
}
