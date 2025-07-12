package controller.SellerController;

import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ChangeStatusCustomerController", urlPatterns = {"/seller/list-customer/change-customer-status"})
public class ChangeStatusCustomerController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("accountId");

        if (idParam != null) {
            try {
                int accountId = Integer.parseInt(idParam);
                CustomerDAO dao = new CustomerDAO();
                boolean success = dao.changeCustomerStatus(accountId);

                if (success) {
                    request.getSession().setAttribute("statusMessage", "Customer status has been changed successfully.");
                } else {
                    request.getSession().setAttribute("statusMessage", "Failed to change customer status.");
                }

            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.getSession().setAttribute("statusMessage", "Invalid customer ID.");
            }
        }

        response.sendRedirect(request.getContextPath() + "/seller/list-customer");
    }

    @Override
    public String getServletInfo() {
        return "Handles status change for customer (RoleID = 3)";
    }
}
