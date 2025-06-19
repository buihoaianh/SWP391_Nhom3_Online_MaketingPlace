/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.UserController;

import model.Account;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Cookie;

/**
 *
 * @author Hi Windows 11 Home
 */
@WebServlet(name = "LoginAccount", urlPatterns = {"/loginAccount"})
public class LoginAccount extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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
        // request.getRequestDispatcher("admin/loginRegister.jsp").forward(request,
        // response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
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
        String remember = request.getParameter("remember"); // lấy giá trị checkbox

        UserDAO dao = new UserDAO();
        Boolean userExist = dao.login(email, password);
        Account user = dao.getUserByEmail(email);

        if (!userExist) {
            request.setAttribute("mess", "Sai email hoặc mật khẩu!");
            request.getRequestDispatcher("jsp/admin/loginRegister.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Xử lý Remember Me
            if (remember != null) {
                // Tạo cookie lưu email, pass và trạng thái remember
                Cookie cEmail = new Cookie("email", email);
                Cookie cPass = new Cookie("pass", password);
                Cookie cRemember = new Cookie("remember", "true");

                // Đặt thời gian sống 7 ngày
                cEmail.setMaxAge(7 * 24 * 60 * 60);
                cPass.setMaxAge(7 * 24 * 60 * 60);
                cRemember.setMaxAge(7 * 24 * 60 * 60);

                // Gửi cookie về trình duyệt
                response.addCookie(cEmail);
                response.addCookie(cPass);
                response.addCookie(cRemember);
            } else {
                // Nếu không chọn remember, xóa cookie (nếu có)
                Cookie cEmail = new Cookie("email", "");
                Cookie cPass = new Cookie("pass", "");
                Cookie cRemember = new Cookie("remember", "");
                cEmail.setMaxAge(0);
                cPass.setMaxAge(0);
                cRemember.setMaxAge(0);
                response.addCookie(cEmail);
                response.addCookie(cPass);
                response.addCookie(cRemember);
            }

            int roleId = user.getRoleID(); // Giả sử Account có getRoleId()
            if (roleId == 2) {
                response.sendRedirect("saller-dashboard");
                return;
            } 

            // Chuyển trang và lưu thông báo vào localStorage
            // Xử lý đăng nhập thành công
            session.setAttribute("message", "Login successful!");
            request.getRequestDispatcher("jsp/public/home.jsp").forward(request, response);

        }
    }

    /*
     * @Override
     * protected void doPost(HttpServletRequest request, HttpServletResponse
     * response)
     * throws ServletException, IOException {
     * request.setCharacterEncoding("UTF-8");
     * response.setContentType("text/html;charset=UTF-8");
     * 
     * String email = request.getParameter("email");
     * String password = request.getParameter("pass");
     * 
     * UserDAO dao = new UserDAO();
     * Boolean userExist = dao.login(email, password);
     * Account user = dao.getUserByEmail(email);
     * 
     * if (!userExist) {
     * // Sai email hoặc password
     * request.setAttribute("mess", "Sai email hoặc mật khẩu!");
     * request.getRequestDispatcher("jsp/admin/loginRegister.jsp").forward(request,
     * response);
     * } else {
     * // Đăng nhập thành công
     * HttpSession session = request.getSession();
     * session.setAttribute("user", user);
     * 
     * // Thay thế sendRedirect(...) bằng đoạn HTML cài localStorage rồi chuyển
     * trang
     * response.setContentType("text/html;charset=UTF-8");
     * PrintWriter out = response.getWriter();
     * String context = request.getContextPath(); // = /MarketingPlace_Online
     * out.println("<!DOCTYPE html>");
     * out.println("<html><head><meta charset='UTF-8'><title>Redirect…</title>");
     * out.println("<script>");
     * out.println("  localStorage.setItem('flash','Đăng nhập thành công!');");
     * out.println("  window.location = '" + context + "/index.html';");
     * out.println("</script></head><body></body></html>");
     * 
     * }
     * }
     */
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
