/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.SellerController;

import dao.CategoriesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Categories;
import jakarta.servlet.http.Part;

/**
 *
 * @author Admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
@WebServlet(name = "CategoryController", urlPatterns = {"/CategoriesURL"})
public class CategoriesController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CategoriesDAO dao = new CategoriesDAO();
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listCategories";
            }
            if (service.equals("listCategories")) {
                int page = 1;
                int pageSize = 2 ; // hiển thị 5 category mỗi trang

                String pageParam = request.getParameter("page");
                if (pageParam != null && !pageParam.isEmpty()) {
                    try {
                        page = Integer.parseInt(pageParam);
                    } catch (NumberFormatException e) {
                        page = 1;
                    }
                }

                int total = dao.countCategories();
                int totalPages = (int) Math.ceil((double) total / pageSize);

                List<Categories> list = dao.getCategoriesByPage(page, pageSize);
                request.setAttribute("categoryData", list);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);

                request.getRequestDispatcher("jsp/seller/ListCategories.jsp").forward(request, response);
            }

            if (service.equals("insertForm")) {
                request.getRequestDispatcher("jsp/seller/InsertCategories.jsp").forward(request, response);
            } else if (service.equals("insertCategory")) {
                String name = request.getParameter("categoryName");
                String desc = request.getParameter("description");
                Part filePart = request.getPart("imageFile");
                String fileName = filePart.getSubmittedFileName();
                String uploadPath = getServletContext().getRealPath("/uploads/");
                java.io.File uploadDir = new java.io.File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                filePart.write(uploadPath + java.io.File.separator + fileName);
                String imageURL = "uploads/" + fileName;

                Categories newCategory = new Categories(0, name, imageURL, desc);
                boolean success = dao.addCategory(newCategory);
                if (success) {
                    response.sendRedirect("CategoriesURL?service=listCategories");
                } else {
                    response.getWriter().println("Error inserting category!");
                }
            }

            if (service.equals("updateForm")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Categories c = dao.getCategoryById(id);
                request.setAttribute("category", c);
                request.getRequestDispatcher("jsp/seller/UpdateCategories.jsp").forward(request, response);
            } else if (service.equals("updateCategory")) {
                int id = Integer.parseInt(request.getParameter("categoryID"));
                String name = request.getParameter("categoryName");
                String desc = request.getParameter("description");

                // Lay file anh moi
                Part filePart = request.getPart("imageFile");
                String fileName = filePart.getSubmittedFileName();

                String imageURL;
                if (fileName != null && !fileName.isEmpty()) {
                    String uploadPath = getServletContext().getRealPath("/uploads/");
                    java.io.File uploadDir = new java.io.File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }

                    filePart.write(uploadPath + java.io.File.separator + fileName);
                    imageURL = "uploads/" + fileName;
                } else {
                    Categories old = dao.getCategoryById(id);
                    imageURL = old.getImageURL();
                }

                Categories updated = new Categories(id, name, imageURL, desc);
                boolean success = dao.updateCategory(updated);
                if (success) {
                    response.sendRedirect("CategoriesURL?service=listCategories");
                } else {
                    response.getWriter().println("Update failed!");
                }
            }

            if (service.equals("deleteCategory")) {
                int id = Integer.parseInt(request.getParameter("id"));
                boolean success = dao.deleteCategory(id);
                if (success) {
                    response.sendRedirect("CategoriesURL?service=listCategories");
                } else {
                    response.getWriter().println("Delete failed!");
                }
            }

            if (service.equals("searchCategory")) {
                String keyword = request.getParameter("keyword");
                List<Categories> result = dao.searchCategoryByName(keyword);
                request.setAttribute("categoryData", result);
                request.setAttribute("searchKeyword", keyword);
                request.getRequestDispatcher("jsp/seller/ListCategories.jsp").forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
        processRequest(request, response);
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
