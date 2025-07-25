package controller.UserController;

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

@WebServlet(name = "ChangePassword", urlPatterns = {"/changepassword"})
public class ChangePassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Thiết lập encoding
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Lấy session và kiểm tra user đã login
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/admin/loginRegister.jsp");
            return;
        }

        // Lấy đối tượng Account từ session
        Account currentUser = (Account) session.getAttribute("user");
        String email = currentUser.getEmail();

        // Đọc các tham số từ form
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra mật khẩu hiện tại có trống không
        if (currentPassword == null || currentPassword.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập mật khẩu hiện tại.");
            request.getRequestDispatcher("/jsp/Profile.jsp").forward(request, response);
            return;
        }

        UserDAO dao = new UserDAO();
        String hashedPassword = currentUser.getPassword();
        boolean isPasswordMatch = BCrypt.checkpw(currentPassword, hashedPassword);

        if (!isPasswordMatch) {
            request.setAttribute("error", "Mật khẩu hiện tại không chính xác.");
            request.getRequestDispatcher("/jsp/Profile.jsp").forward(request, response);
            return;
        }

        // Kiểm tra new và confirm
        if (newPassword == null || newPassword.trim().isEmpty()
                || confirmPassword == null || confirmPassword.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ mật khẩu mới và xác nhận.");
            request.getRequestDispatcher("/jsp/Profile.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu mới và xác nhận không khớp.");
            request.getRequestDispatcher("/jsp/Profile.jsp").forward(request, response);
            return;
        }

        if (newPassword.length() < 6) {
            request.setAttribute("error", "Mật khẩu mới phải có ít nhất 6 ký tự.");
            request.getRequestDispatcher("/jsp/Profile.jsp").forward(request, response);
            return;
        }

        // Băm mật khẩu mới
        String hashedNewPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

        boolean updateOK = dao.updatePassword(email, hashedNewPassword);
        if (updateOK) {
            // Cập nhật session để giữ nhất quán
            currentUser.setPassword(hashedNewPassword);
            session.setAttribute("user", currentUser);

            request.setAttribute("success", "Mật khẩu đã được cập nhật thành công!");
        } else {
            request.setAttribute("error", "Đã xảy ra lỗi khi cập nhật mật khẩu.");
        }

        request.getRequestDispatcher("/jsp/Profile.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet xử lý đổi mật khẩu có sử dụng BCrypt";
    }
}
