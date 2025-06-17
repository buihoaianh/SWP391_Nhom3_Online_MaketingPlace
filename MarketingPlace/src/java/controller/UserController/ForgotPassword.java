package controller.UserController;

import dao.UserDAO;
import dao.sendEmail;
import model.Account;
import java.io.IOException;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ForgotPassword", urlPatterns = {"/forgotpassword"})
public class ForgotPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Hiển thị form nhập email
        request.getRequestDispatcher("/jsp/guest/forgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        UserDAO dao = new UserDAO();
        Account user = dao.getUserByEmail(email);

        if (user == null) {
            request.setAttribute("error", "Email không tồn tại trong hệ thống.");
            request.getRequestDispatcher("/jsp/guest/forgotPassword.jsp").forward(request, response);
            return;
        }

        // Tạo mật khẩu mới ngẫu nhiên
        String newPassword = generateRandomPassword(8);

        // Cập nhật mật khẩu mới vào database
        boolean updated = dao.updatePassword(email, newPassword);
        if (!updated) {
            request.setAttribute("error", "Cập nhật mật khẩu thất bại.");
            request.getRequestDispatcher("/jsp/guest/forgotPassword.jsp").forward(request, response);
            return;
        }

        // Gửi email chứa mật khẩu mới
        sendEmail mailer = new sendEmail();
        boolean sent = mailer.sendNewPassword(email, newPassword, user.getFullName());

        if (sent) {
            request.setAttribute("message", "Mật khẩu mới đã được gửi đến email của bạn.");
        } else {
            request.setAttribute("error", "Không thể gửi email. Vui lòng thử lại.");
        }

        request.getRequestDispatcher("/jsp/guest/forgotPassword.jsp").forward(request, response);
    }

    // Hàm tạo mật khẩu ngẫu nhiên
    private String generateRandomPassword(int length) {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            int idx = random.nextInt(chars.length());
            sb.append(chars.charAt(idx));
        }
        return sb.toString();
    }

    @Override
    public String getServletInfo() {
        return "ForgotPassword servlet - gửi mật khẩu mới qua email";
    }
}
