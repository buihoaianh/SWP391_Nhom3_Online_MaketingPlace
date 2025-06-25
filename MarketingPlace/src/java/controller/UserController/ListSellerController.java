/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.UserController;

import dao.SellerDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

@WebServlet(name = "ListSellerController", urlPatterns = {"/admin/list-seller"})
public class ListSellerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");

        String keyword = request.getParameter("keyword");
        SellerDao dao = new SellerDao();
        List<Account> sellerList;

        if (keyword != null && !keyword.trim().isEmpty()) {
            sellerList = dao.searchSeller(keyword.trim());
        } else {
            List<Integer> sellerIds = dao.getSellerAccountIDs();
            sellerList = new ArrayList<>();
            for (Integer id : sellerIds) {
                Account acc = dao.getSellerById(id);
                if (acc != null) {
                    sellerList.add(acc);
                }
            }
        }

        request.setAttribute("sellerList", sellerList);
        request.getRequestDispatcher("/jsp/admin/ListSellerAdmin.jsp")
                .forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    // </editor-fold>

    @Override
    public String getServletInfo() {
        return "Servlet for displaying Seller list (RoleID = 2)";
    }
}
