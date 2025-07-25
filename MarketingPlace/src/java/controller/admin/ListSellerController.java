package controller.admin;

import controller.UserController.*;
import dao.SellerDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

@WebServlet(name = "ListSellerController", urlPatterns = {"/admin/list-seller"})
public class ListSellerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");

        String keyword = request.getParameter("keyword");
        String pageParam = request.getParameter("page");
        int pageIndex = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
        int pageSize = 2;

        SellerDao dao = new SellerDao();
        List<Account> sellerList = new ArrayList<>();
        int totalSellers = 0;

        if (keyword != null && !keyword.trim().isEmpty()) {
            sellerList = dao.searchSellerByPage(keyword.trim(), pageIndex, pageSize);
            totalSellers = dao.countSearchedSellers(keyword.trim());
        } else {
            sellerList = dao.getApprovedSellersByPage(pageIndex, pageSize);
            totalSellers = dao.countApprovedSellers();
        }

        int totalPages = (int) Math.ceil((double) totalSellers / pageSize);

        request.setAttribute("sellerList", sellerList);
        request.setAttribute("currentPage", pageIndex);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("keyword", keyword);

        request.getRequestDispatcher("/jsp/admin/ListSellerAdmin.jsp").forward(request, response);
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
        return "Servlet for displaying Seller list (RoleID = 2)";
    }
}
