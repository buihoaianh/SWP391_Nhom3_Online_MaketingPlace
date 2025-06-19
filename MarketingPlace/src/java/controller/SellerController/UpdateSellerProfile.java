package controller.SellerController;

import dao.UserDAO;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Account;

@WebServlet(name = "UpdateSellerProfile", urlPatterns = {"/update-seller-profile"})
@MultipartConfig // Bắt buộc để xử lý file upload
public class UpdateSellerProfile extends HttpServlet {

    private static final String UPLOAD_DIR = "asset/images/faces";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu text
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String description = request.getParameter("description");

        // Lấy file ảnh upload
        Part filePart = request.getPart("avatar");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user");

        if (account != null) {
            // Cập nhật dữ liệu text
            account.setFullName(fullName);
            account.setEmail(email);
            account.setPhoneNumber(phone);
            account.setAddress(address);
            account.setDescription(description);

            // Nếu người dùng có chọn ảnh mới
            if (fileName != null && !fileName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                String fullSavePath = uploadPath + File.separator + fileName;
                filePart.write(fullSavePath);

                // Cập nhật đường dẫn ảnh (đường tương đối để hiển thị trên trang web)
                String relativePath = UPLOAD_DIR + "/" + fileName;
                account.setImageURL(relativePath);
            }

            // Cập nhật vào DB
            UserDAO dao = new UserDAO();
            dao.updateAccount(account);

            // Cập nhật lại session nếu cần
            session.setAttribute("account", account);

            response.sendRedirect("seller-profile"); // trở về trang profile
        } else {
            response.sendRedirect("jsp/admin/loginRegister.jsp?tab=login");
        }
    }
}
