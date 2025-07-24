/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.SellerController;

import dao.BlogCategoryDAO;
import dao.BlogDAO;
import dao.CategoriesDAO;
import dao.TagDAO;
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
import java.io.File;
import java.util.ArrayList;
import model.Blog;
import model.BlogCategory;
import model.BlogTag;

/**
 *
 * @author Admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
@WebServlet(name = "BlogController", urlPatterns = {"/BlogURL"})
public class BlogController extends HttpServlet {

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

        BlogDAO dao = new BlogDAO();
        TagDAO tagDao = new TagDAO();
        BlogCategoryDAO blogCategoryDAO = new BlogCategoryDAO();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listBlogs";
        }

        switch (service) {
            case "listBlogs" -> {
                int page = 1;
                int pageSize = 5;
                String pageParam = request.getParameter("page");
                if (pageParam != null && !pageParam.isEmpty()) {
                    try {
                        page = Integer.parseInt(pageParam);
                    } catch (NumberFormatException e) {
                        page = 1;
                    }
                }
                int total = dao.countBlogs();
                int totalPages = (int) Math.ceil((double) total / pageSize);

                List<Blog> list = dao.getBlogsByPage(page, pageSize);
                request.setAttribute("blogData", list);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.getRequestDispatcher("jsp/seller/ListBlogs.jsp").forward(request, response);
            }

            case "insertForm" -> {
                List<BlogTag> tagList = tagDao.getAllTags();
                List<BlogCategory> categoryList = blogCategoryDAO.getAllCategories(); // thêm dòng này
                request.setAttribute("tagList", tagList);
                request.setAttribute("categoryList", categoryList); // gán vào request
                request.getRequestDispatcher("jsp/seller/InsertBlogs.jsp").forward(request, response);
            }
            case "insertBlog" -> {
                int authorID = Integer.parseInt(request.getParameter("authorID"));
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                int categoryID = Integer.parseInt(request.getParameter("categoryID"));
                String status = request.getParameter("status");

                // Lấy link ảnh từ input
                String thumbnailURL = request.getParameter("thumbnailURL");

                Blog newBlog = new Blog(0, authorID, title, content, thumbnailURL,
                        categoryID, status, null, null, 0);
                String[] tagIdParams = request.getParameterValues("tagIds");
                List<Integer> tagIds = new ArrayList<>();
                if (tagIdParams != null) {
                    for (String tagIdStr : tagIdParams) {
                        tagIds.add(Integer.parseInt(tagIdStr));
                    }
                }

                boolean success = dao.addBlog(newBlog);

                if (success) {
                    int blogId = dao.getLastInsertedBlogId(); // hoặc trả về ID khi insert

                    for (int tagId : tagIds) {
                        dao.insertBlogTagMapping(blogId, tagId);
                    }

                    response.sendRedirect("BlogURL?service=listBlogs");
                } else {
                    response.getWriter().println("Error inserting blog!");
                }
            }

            case "updateForm" -> {
                int id = Integer.parseInt(request.getParameter("id"));
                Blog blog = dao.getBlogById(id);

                List<BlogTag> tagList = tagDao.getAllTags();
                List<Integer> selectedTagIds = dao.getTagIdsByBlogId(id); // danh sách tag đã chọn

                List<BlogCategory> categoryList = blogCategoryDAO.getAllCategories(); // list category
                BlogCategory category = blogCategoryDAO.getCategoryById(blog.getCategoryID());
                request.setAttribute("categoryName", category.getCategoryName());
                request.setAttribute("blog", blog);
                request.setAttribute("tagList", tagList);
                request.setAttribute("selectedTagIds", selectedTagIds);
                request.setAttribute("categoryList", categoryList);

                request.getRequestDispatcher("jsp/seller/UpdateBlogs.jsp").forward(request, response);
            }
            case "updateBlog" -> {
                int blogID = Integer.parseInt(request.getParameter("blogID"));
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                int categoryID = Integer.parseInt(request.getParameter("categoryID"));
                String status = request.getParameter("status");
                String thumbnailURL = request.getParameter("thumbnailURL");

                // Lấy danh sách tag mới được chọn
                String[] tagIdParams = request.getParameterValues("tagIds");
                List<Integer> tagIds = new ArrayList<>();
                if (tagIdParams != null) {
                    for (String tagIdStr : tagIdParams) {
                        tagIds.add(Integer.parseInt(tagIdStr));
                    }
                }

                // Lấy blog cũ từ DB
                Blog updatedBlog = dao.getBlogById(blogID);
                updatedBlog.setTitle(title);
                updatedBlog.setContent(content);
                updatedBlog.setCategoryID(categoryID);
                updatedBlog.setStatus(status);
                updatedBlog.setThumbnailURL(thumbnailURL);

                boolean success = dao.updateBlog(updatedBlog);
                if (success) {
                    // Xoá toàn bộ tag cũ của blog
                    dao.deleteAllTagsForBlog(blogID);

                    // Gán tag mới
                    for (int tagId : tagIds) {
                        dao.insertBlogTagMapping(blogID, tagId);
                    }

                    response.sendRedirect("BlogURL?service=listBlogs");
                } else {
                    response.getWriter().println("Update failed!");
                }
            }

            case "deleteBlog" -> {
                int id = Integer.parseInt(request.getParameter("id"));
                boolean success = dao.deleteBlog(id);
                if (success) {
                    response.sendRedirect("BlogURL?service=listBlogs");
                } else {
                    response.getWriter().println("Delete failed!");
                }
            }

            case "searchBlog" -> {
                String keyword = request.getParameter("keyword");
                String status = request.getParameter("status"); // thêm status

                List<Blog> result;
                if (status == null || status.equals("all")) {
                    result = dao.searchBlogByTitle(keyword); // Tìm tất cả bất kể status
                } else {
                    result = dao.searchBlogByTitleAndStatus(keyword, status); // Chỉ tìm theo status
                }

                request.setAttribute("blogData", result);
                request.setAttribute("searchKeyword", keyword);
                request.setAttribute("status", status); // để giữ lại lựa chọn trên form
                request.getRequestDispatcher("jsp/seller/ListBlogs.jsp").forward(request, response);
            }

            default ->
                response.getWriter().println("Unknown service: " + service);
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
