package controller.SellerController;

import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

@WebServlet(name = "ListCustomerDetailController", urlPatterns = {"/seller/list-customer-detail"})
public class ListCustomerDetailController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/seller/list-customer");
            return;
        }

        int customerId;
        try {
            customerId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/seller/list-customer");
            return;
        }

        CustomerDAO dao = new CustomerDAO();
        Account customer = dao.getCustomerById(customerId);
        if (customer == null) {
            request.setAttribute("errorMessage", "Not find customer with ID = " + customerId);
            request.getRequestDispatcher("/jsp/seller/Error.jsp").forward(request, response);
            return;
        }

        LocalDateTime ldt = customer.getCreateDate();
        if (ldt != null) {
            Date createDateAsDate = Date.from(ldt.atZone(ZoneId.systemDefault()).toInstant());
            request.setAttribute("createDateAsDate", createDateAsDate);
        } else {
            request.setAttribute("createDateAsDate", null);
        }

        request.setAttribute("customerDetail", customer);
        request.getRequestDispatcher("/jsp/seller/ListCustomerDetail.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // POST chuyển sang GET
    }

    @Override
    public String getServletInfo() {
        return "Display customer detail by ID (RoleID = 3)";
    }
}
