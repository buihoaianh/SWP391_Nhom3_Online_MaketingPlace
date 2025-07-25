/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import model.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateAdminProfile", urlPatterns = {"/admin/update-admin-profile"})
@MultipartConfig
public class UpdateAdminProfile extends HttpServlet {

    private static final String UPLOAD_DIR = "asset/images/faces";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ form
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String description = request.getParameter("description");
        System.out.println("fullName = " + fullName);

        // Lấy file ảnh upload (phải dùng đúng tên input trong form: "image")
        Part filePart = request.getPart("image");
        String fileName = filePart != null ? Paths.get(filePart.getSubmittedFileName()).getFileName().toString() : null;

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user"); // đồng bộ key

        if (account != null) {
            // Cập nhật dữ liệu text
            account.setFullName(fullName);
            account.setEmail(email);
            account.setPhoneNumber(phone);
            account.setAddress(address);
            account.setDescription(description);

            // Nếu có ảnh mới được upload
            if (fileName != null && !fileName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                String fullSavePath = uploadPath + File.separator + fileName;
                filePart.write(fullSavePath);

                // Lưu đường dẫn tương đối
                String relativePath = UPLOAD_DIR + "/" + fileName;
                account.setImageURL(relativePath);
            }

            // Cập nhật vào DB
            UserDAO dao = new UserDAO();
            dao.updateAccount(account);

            // Cập nhật lại session
            session.setAttribute("account", account);

            // Trở lại trang profile
            response.sendRedirect("admin-profile");
        } else {
            response.sendRedirect("jsp/admin/loginRegister.jsp?tab=login");
        }
    }
}
