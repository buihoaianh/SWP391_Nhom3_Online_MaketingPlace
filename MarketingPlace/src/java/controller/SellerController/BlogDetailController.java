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


@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
@WebServlet(name = "BlogDetailController", urlPatterns = {"/BlogDetailURL"})
public class BlogDetailController extends HttpServlet {

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
            case "blogDetail" -> {
                int id = Integer.parseInt(request.getParameter("id"));
                Blog blog = dao.getBlogById(id);
                BlogCategory category = blogCategoryDAO.getCategoryById(blog.getCategoryID());
                List<BlogTag> tags = tagDao.getTagsByBlogId(id);
                List<BlogCategory> categorys = blogCategoryDAO.getAllCategories();
                request.setAttribute("blog", blog);
                request.setAttribute("category", category);
                request.setAttribute("tags", tags);
                request.setAttribute("categorys", categorys);

                request.getRequestDispatcher("jsp/seller/BlogDetail.jsp").forward(request, response);
            }
            case "listByCategory" -> {
                int categoryId = Integer.parseInt(request.getParameter("id"));
                List<Blog> blogs = dao.getBlogsByCategoryId(categoryId);
                request.setAttribute("blogData", blogs);
                request.getRequestDispatcher("jsp/seller/ListBlogs.jsp").forward(request, response);
            }

            case "searchBlog" -> {
                String keyword = request.getParameter("keyword");
                List<Blog> result = dao.searchBlogByTitle(keyword);
                request.setAttribute("blogData", result);
                request.setAttribute("searchKeyword", keyword);
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
