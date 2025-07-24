package controller.SellerController;

import dao.UserDAO;
import model.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "SellerChangePassword", urlPatterns = {"/seller/seller-password"})
public class SellerChangePassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/seller/ChangePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/admin/loginRegister.jsp");
            return;
        }

        Account currentUser = (Account) session.getAttribute("user");
        String email = currentUser.getEmail();
        String oldHashedPassword = currentUser.getPassword();

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Input validation (excluding password length)
        if (currentPassword == null || currentPassword.trim().isEmpty()) {
            request.setAttribute("error", "Please enter your current password.");
        } else if (newPassword == null || newPassword.trim().isEmpty()
                || confirmPassword == null || confirmPassword.trim().isEmpty()) {
            request.setAttribute("error", "Please enter and confirm your new password.");
        } else if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "New password and confirmation do not match.");
        } else if (BCrypt.checkpw(newPassword, oldHashedPassword)) {
            request.setAttribute("error", "New password must be different from the current password.");
        } else if (!BCrypt.checkpw(currentPassword, oldHashedPassword)) {
            request.setAttribute("error", "Current password is incorrect.");
        } else {
            // Passed all validation -> update password
            String hashedNewPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
            UserDAO dao = new UserDAO();
            boolean updated = dao.updatePassword(email, hashedNewPassword);

            if (updated) {
                currentUser.setPassword(hashedNewPassword);
                session.setAttribute("user", currentUser);
                request.setAttribute("success", "Password changed successfully!");
            } else {
                request.setAttribute("error", "Failed to update password. Please try again.");
            }
        }

        request.getRequestDispatcher("/jsp/seller/ChangePassword.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles password change for seller with full validation (no length check) and BCrypt encryption.";
    }
}
