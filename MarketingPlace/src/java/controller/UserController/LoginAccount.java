/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.UserController;

import model.User;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;

/**
 *
 * @author Hi Windows 11 Home
 */
@WebServlet(name="LoginAccount", urlPatterns={"/loginAccount"})
public class LoginAccount extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       //request.getRequestDispatcher("admin/loginRegister.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("pass");

        UserDAO dao = new UserDAO();
        Boolean userExist = dao.login(email, password);
        User user = dao.getUserByEmail(email);

        if (!userExist) {
            // Sai email hoặc password
            request.setAttribute("mess", "Sai email hoặc mật khẩu!");
            request.getRequestDispatcher("jsp/admin/loginRegister.jsp").forward(request, response);
        } else {
            // Đăng nhập thành công
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Thay thế sendRedirect(...) bằng đoạn HTML cài localStorage rồi chuyển trang
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String context = request.getContextPath();          // = /MarketingPlace_Online
            out.println("<!DOCTYPE html>");
            out.println("<html><head><meta charset='UTF-8'><title>Redirect…</title>");
            out.println("<script>");
            out.println("  localStorage.setItem('flash','Đăng nhập thành công!');");
            out.println("  window.location = '" + context + "/jsp/Home.jsp';");
            out.println("</script></head><body></body></html>");

        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
