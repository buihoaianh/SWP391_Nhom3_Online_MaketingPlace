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
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "ForgotPassword", urlPatterns = {"/forgotpassword"})
public class ForgotPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/guest/forgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String email = request.getParameter("email");

        UserDAO dao = new UserDAO();
        Account user = dao.getUserByEmail(email);

        if (user == null) {
            request.setAttribute("error", "Email không tồn tại trong hệ thống.");
            request.getRequestDispatcher("/jsp/guest/forgotPassword.jsp").forward(request, response);
            return;
        }

        // Tạo mật khẩu mới dạng text
        String newPasswordPlain = generateRandomPassword(8);

        // Băm mật khẩu trước khi lưu vào DB
        String hashedPassword = BCrypt.hashpw(newPasswordPlain, BCrypt.gensalt());

        // Cập nhật vào DB
        boolean updated = dao.updatePassword(email, hashedPassword);
        if (!updated) {
            request.setAttribute("error", "Cập nhật mật khẩu thất bại. Vui lòng thử lại.");
            request.getRequestDispatcher("/jsp/guest/forgotPassword.jsp").forward(request, response);
            return;
        }

        // Gửi email
        sendEmail mailer = new sendEmail();
        boolean sent = mailer.sendNewPassword(email, newPasswordPlain, user.getFullName());

        if (sent) {
            request.setAttribute("message", "Mật khẩu mới đã được gửi đến email của bạn.");
        } else {
            request.setAttribute("error", "Không thể gửi email. Vui lòng thử lại.");
        }

        request.getRequestDispatcher("/jsp/guest/forgotPassword.jsp").forward(request, response);
    }

    private String generateRandomPassword(int length) {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(chars.charAt(random.nextInt(chars.length())));
        }
        return sb.toString();
    }

    @Override
    public String getServletInfo() {
        return "ForgotPassword servlet - gửi mật khẩu mới qua email (có mã hóa)";
    }
}
