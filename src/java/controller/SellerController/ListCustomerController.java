package controller.SellerController;

import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ListCustomerController", urlPatterns = {"/seller/list-customer"})
public class ListCustomerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Account seller = (Account) session.getAttribute("user");
        if (seller == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int sellerID = seller.getAccountID();
        int pageNumber = 1;
        int pageSize = 5;  // Or retrieve it from the request

        String keyword = request.getParameter("keyword");
        String page = request.getParameter("page");
        String levelFilter = request.getParameter("level");  // Get level filter from dropdown
        if (page != null) {
            pageNumber = Integer.parseInt(page);
        }

        CustomerDAO dao = new CustomerDAO();
        List<Account> customerList = dao.getCustomersBySellerIDWithPagination(sellerID, pageNumber, pageSize);

        // Lọc theo cấp bậc nếu có
        if (levelFilter != null && !levelFilter.isEmpty()) {
            customerList = filterByLevel(customerList, levelFilter);
        }

        if (keyword != null && !keyword.trim().isEmpty()) {
            customerList = filterCustomerList(customerList, keyword);
        }

        int totalCustomers = dao.getCustomersBySellerID(sellerID).size();  // Get total customers for pagination
        int totalPages = (int) Math.ceil((double) totalCustomers / pageSize);

        request.setAttribute("customerList", customerList);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("levelFilter", levelFilter);  // Pass the selected level back to the JSP
        request.getRequestDispatcher("/jsp/seller/ListCustomer.jsp").forward(request, response);
    }

    private List<Account> filterCustomerList(List<Account> customerList, String keyword) {
        List<Account> filteredList = new ArrayList<>();
        for (Account acc : customerList) {
            if (String.valueOf(acc.getAccountID()).contains(keyword)
                    || acc.getFullName().toLowerCase().contains(keyword.toLowerCase())) {
                filteredList.add(acc);
            }
        }
        return filteredList;
    }

    private List<Account> filterByLevel(List<Account> customerList, String levelFilter) {
        List<Account> filteredList = new ArrayList<>();
        for (Account acc : customerList) {
            if (acc.getDescription() != null && acc.getDescription().equalsIgnoreCase(levelFilter)) {
                filteredList.add(acc);
            }
        }
        return filteredList;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for displaying Customer list with filter by level";
    }
}
