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

@WebServlet(name = "ChangePassword", urlPatterns = {"/changepassword"})
public class ChangePassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ChangePassword() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nếu user truy cập GET trực tiếp, chuyển hướng về trang settings (hoặc trang login nếu chưa login)
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            // Chưa login → redirect sang trang login
            response.sendRedirect(request.getContextPath() + "/jsp/admin/loginRegister.jsp");
            return;
        }
        // Nếu đã login, chỉ đơn giản forward về trang guest/account.jsp
        request.getRequestDispatcher("/jsp/guest/account.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy session và kiểm tra user đã login
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            // Chưa login → redirect về trang login
            response.sendRedirect(request.getContextPath() + "/jsp/admin/loginRegister.jsp");
            return;
        }

        // Lấy đối tượng Account đang nằm trong session
        Account currentUser = (Account) session.getAttribute("user");
        String email = currentUser.getEmail();

        // Đọc 3 tham số từ form
        String currentPassword = request.getParameter("currentPassword");
        String newPassword     = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // 1. Kiểm tra ô Current Password có trống không
        if (currentPassword == null || currentPassword.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập mật khẩu hiện tại.");
            request.getRequestDispatcher("/jsp/guest/account.jsp").forward(request, response);
            return;
        }

        // 2. Kiểm tra mật khẩu hiện tại có khớp với mật khẩu trong DB hay không
        //    Giả sử UserDAO.login(email, password) trả về true nếu đúng
        UserDAO dao = new UserDAO();
        boolean okLogin = dao.login(email, currentPassword);
        if (!okLogin) {
            // Mật khẩu hiện tại không đúng
            request.setAttribute("error", "Mật khẩu hiện tại không chính xác.");
            request.getRequestDispatcher("/jsp/guest/account.jsp").forward(request, response);
            return;
        }

        // 3. Kiểm tra New Password và Confirm Password
        if (newPassword == null || newPassword.trim().isEmpty() ||
            confirmPassword == null || confirmPassword.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ mật khẩu mới và xác nhận mật khẩu.");
            request.getRequestDispatcher("/jsp/guest/account.jsp").forward(request, response);
            return;
        }
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu mới và xác nhận không khớp.");
            request.getRequestDispatcher("/jsp/guest/account.jsp").forward(request, response);
            return;
        }

        // 4. (Tùy chọn) Kiểm tra độ mạnh mật khẩu mới nếu cần (ví dụ: ít nhất 6 ký tự, có ký tự số,…)
        if (newPassword.length() < 6) {
            request.setAttribute("error", "Mật khẩu mới phải có ít nhất 6 ký tự.");
            request.getRequestDispatcher("/jsp/guest/account.jsp").forward(request, response);
            return;
        }

        // 5. Cập nhật mật khẩu vào DB
        boolean updateOK = dao.updatePassword(email, newPassword);
        if (updateOK) {
            // Nếu cập nhật thành công, có thể cập nhật luôn trong session để nhất quán
            currentUser.setPassword(newPassword);
            session.setAttribute("user", currentUser);

            request.setAttribute("success", "Mật khẩu đã được cập nhật thành công!");
            request.getRequestDispatcher("/jsp/guest/account.jsp").forward(request, response);
        } else {
            // Nếu update thất bại (ví dụ lỗi kết nối DB)
            request.setAttribute("error", "Đã xảy ra lỗi khi cập nhật mật khẩu. Vui lòng thử lại.");
            request.getRequestDispatcher("/jsp/guest/account.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet xử lý đổi mật khẩu cho user đã đăng nhập";
    }
}
