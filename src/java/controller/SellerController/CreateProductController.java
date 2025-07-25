/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.SellerController;

import controller.admin.*;
import dao.CategoriesDAO;
import dao.ColorDAO;
import dao.ProductDAO;
import dao.SellerRequestDAO;
import dao.SizeDAO;
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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import model.Account;
import model.Categories;
import model.Color;
import model.Product;
import model.ProductImage;
import model.ProductVariant;
import model.SellerRequest;
import model.Size;
import utils.Helpers;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateProductController", urlPatterns = { "/seller/create-product" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
public class CreateProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession(false);
            Account acc = session == null ? null : (Account) session.getAttribute("user");
            // Nếu là seller (RoleID=2) thì phải có SellerRequest đã Approve
            if (acc != null && acc.getRoleID() == 2) {
                SellerRequestDAO reqDao = new SellerRequestDAO();
                SellerRequest req = reqDao.getByAccountId(acc.getAccountID());
                if (req == null || !"Approve".equalsIgnoreCase(req.getStatus())) {
                    // Chuyển về trang form đệ trình request (hoặc trang báo lỗi)
                    request.setAttribute("errorMessage", "Bạn chưa được duyệt seller request, không thể thêm sản phẩm.");
                    request.getRequestDispatcher("/jsp/seller/ProductList.jsp").forward(request, response);
                    return;
                }
            }
            CategoriesDAO cdao = new CategoriesDAO();
            List<Categories> categories = cdao.getAllCategories();
            request.setAttribute("categories", categories);

            SizeDAO sdao = new SizeDAO();
            List<Size> sizes = sdao.getSizes();
            request.setAttribute("sizes", sizes);

            ColorDAO colorDAO = new ColorDAO();
            List<Color> colors = colorDAO.getColors();
            request.setAttribute("colors", colors);

            request.getRequestDispatcher("/jsp/seller/CreateProduct.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("user");
            if (acc != null && acc.getRoleID() == 2) {
                SellerRequestDAO reqDao = new SellerRequestDAO();
                SellerRequest req = reqDao.getByAccountId(acc.getAccountID());
                if (req == null || !"Approve".equalsIgnoreCase(req.getStatus())) {
                    // Không cho tạo, show lại form với thông báo
                    request.setAttribute("errorMessage", "Bạn chưa được duyệt seller request, không thể thêm sản phẩm.");
                    processRequest(request, response);
                    return;
                }
            }
            ProductDAO pdao = new ProductDAO();
            // Lấy dữ liệu từ form
            String productName = request.getParameter("productName");
            String categoryID = request.getParameter("categoryID");
            String description = request.getParameter("description");
            // Part imagePart = request.getPart("image");
            Timestamp createDate = new Timestamp(System.currentTimeMillis());

            int createdBy = acc.getAccountID();

            // Lấy danh sách biến thể sản phẩm
            String[] colors = request.getParameterValues("color[]");
            String[] sizes = request.getParameterValues("size[]");
            String[] prices = request.getParameterValues("price[]");
            String[] quantities = request.getParameterValues("quantity[]");

            List<ProductVariant> variants = new ArrayList<>();

            // Lấy ảnh đúng
            // Lấy tất cả phần tử upload
            List<ProductImage> imageNames = new ArrayList<>();
            // Part là đối tượng đại diện cho từng phần dữ liệu được gửi lên từ form (có thể
            // là text, file,...).
            for (Part part : request.getParts()) {
                // Lọc ra các file ảnh
                if (part.getName().equals("image") && part.getSubmittedFileName() != null
                        && !part.getSubmittedFileName().isEmpty()) {
                    // upload image
                    String fileName = Helpers.saveImage(part, request, "product");
                    imageNames.add(new ProductImage(fileName));
                }
            }
            // String imageName = Helpers.saveImage(imagePart, request);

            ColorDAO colorDAO = new ColorDAO();
            SizeDAO sizeDAO = new SizeDAO();

            for (int i = 0; i < colors.length; i++) {
                String colorName = colors[i].trim();
                String sizeName = sizes[i].trim();

                int colorId = colorDAO.getOrInsertColorIdByName(colorName);
                int sizeId = sizeDAO.getOrInsertSizeIdByName(sizeName);

                ProductVariant variant = new ProductVariant(
                    new Color(colorId),
                    new Size(sizeId),
                    Long.parseLong(prices[i]),
                    Integer.parseInt(quantities[i])
                );
                variants.add(variant);
            }


            // Lưu vào DB
            Product product = new Product(createdBy, imageNames.get(0).getImageUrl(), productName,
                    Integer.parseInt(categoryID), createDate, description, "Active", variants);
            product.setImages(imageNames);
            pdao.createProduct(product);

            // Chuyển hướng sau khi tạo sản phẩm thành công
            request.setAttribute("message", "Create Product Success!");
            request.getRequestDispatcher("products").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Create Product Fail!: " + e.getMessage());
            request.getRequestDispatcher("products").forward(request, response);
        }
    }

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
