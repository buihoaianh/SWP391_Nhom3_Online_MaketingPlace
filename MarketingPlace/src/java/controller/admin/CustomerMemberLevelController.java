/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.CustomerMemberLevelDAO;
import java.util.List;
import model.CustomerLevelInfo;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CustomerMemberLevelController", urlPatterns = {"/admin/listMember/CustomerMemberLevelController"})
public class CustomerMemberLevelController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerMemberLevelController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerMemberLevelController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String memberIDParam = request.getParameter("memberID");
        String orderIDParam = request.getParameter("orderID");

        CustomerMemberLevelDAO dao = new CustomerMemberLevelDAO();

        if (orderIDParam != null) {
            try {
                int orderID = Integer.parseInt(orderIDParam);
                dao.updateOrderAndRefreshLevel(orderID);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid orderID format.");
                return;
            }
        }

        if (memberIDParam != null) {
            try {
                int memberID = Integer.parseInt(memberIDParam);

                dao.syncOrderHistoryFromOrders();
                dao.updateCustomerMemberLevelsFromOrders();
                int page = 1;
                int pageSize = 1;
                String pageParam = request.getParameter("page");

                if (pageParam != null) {
                    try {
                        page = Integer.parseInt(pageParam);
                    } catch (NumberFormatException e) {
                        page = 1;
                    }
                }

                int totalCustomers = dao.countCustomersByMemberID(memberID);
                int totalPages = (int) Math.ceil((double) totalCustomers / pageSize);

                List<CustomerLevelInfo> customerList = dao.getCustomersByMemberIDPaging(memberID, page, pageSize);
                String memberName = dao.getMemberNameByID(memberID);

                request.setAttribute("customers", customerList);
                request.setAttribute("memberName", memberName);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);

                request.getRequestDispatcher("/jsp/admin/CustomerByLevel.jsp").forward(request, response);

            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid memberID format.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameter memberID.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
