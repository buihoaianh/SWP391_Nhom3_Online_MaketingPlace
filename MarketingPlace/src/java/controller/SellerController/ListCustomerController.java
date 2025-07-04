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
        response.setContentType("text/html;charset=UTF-8");

        String keyword = request.getParameter("keyword");
        CustomerDAO dao = new CustomerDAO();
        List<Account> customerList;

        if (keyword != null && !keyword.trim().isEmpty()) {
            customerList = dao.searchCustomer(keyword.trim());
        } else {
            List<Integer> customerIds = dao.getCustomerAccountIDs();
            customerList = new ArrayList<>();
            for (Integer id : customerIds) {
                Account acc = dao.getCustomerById(id);
                if (acc != null) {
                    customerList.add(acc);
                }
            }
        }

        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("/jsp/seller/ListCustomer.jsp")
               .forward(request, response);
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
        return "Servlet for displaying Customer list (RoleID = 3)";
    }
}
