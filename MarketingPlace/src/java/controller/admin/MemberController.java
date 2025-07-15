package controller.admin;

import dao.MemberDAO;
import model.Member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
@WebServlet(name = "MemberController", urlPatterns = {"/admin/MemberURL"})
public class MemberController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        MemberDAO dao = new MemberDAO();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "listMembers";
            }

            if (service.equals("listMembers")) {
                int page = 1;
                int pageSize = 5;

                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    try {
                        page = Integer.parseInt(pageParam);
                    } catch (NumberFormatException e) {
                        page = 1;
                    }
                }

                List<Member> list = dao.getAllMembers(); // bạn có thể thêm getMemberByPage nếu muốn
                request.setAttribute("memberData", list);
                request.getRequestDispatcher("/jsp/admin/ListMembers.jsp").forward(request, response);
            }

            if (service.equals("insertForm")) {
                request.getRequestDispatcher("/jsp/admin/InsertMember.jsp").forward(request, response);
            } else if (service.equals("insertMember")) {
                String name = request.getParameter("memberName");
                int minPoint = Integer.parseInt(request.getParameter("minPoint"));
                int maxPoint = Integer.parseInt(request.getParameter("maxPoint"));
                String desc = request.getParameter("description");

                Part filePart = request.getPart("imageFile");
                String fileName = filePart.getSubmittedFileName();
                String uploadPath = getServletContext().getRealPath("/uploads/");
                java.io.File uploadDir = new java.io.File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                filePart.write(uploadPath + java.io.File.separator + fileName);
                String imageURL = "/uploads/" + fileName;

                Member newMember = new Member(0, name, minPoint, maxPoint, desc, imageURL);
                boolean success = dao.addMember(newMember);
                response.sendRedirect("MemberURL?service=listMembers");
            }

            if (service.equals("updateForm")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Member m = dao.getMemberById(id);
                request.setAttribute("member", m);
                request.getRequestDispatcher("/jsp/admin/UpdateMember.jsp").forward(request, response);
            } else if (service.equals("updateMember")) {
                int id = Integer.parseInt(request.getParameter("memberID"));
                String name = request.getParameter("memberName");
                int minPoint = Integer.parseInt(request.getParameter("minPoint"));
                int maxPoint = Integer.parseInt(request.getParameter("maxPoint"));
                String desc = request.getParameter("description");

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
                    imageURL = "/uploads/" + fileName;
                } else {
                    Member old = dao.getMemberById(id);
                    imageURL = old.getImageURL();
                }

                Member updated = new Member(id, name, minPoint, maxPoint, desc, imageURL);
                dao.updateMember(updated);
                response.sendRedirect("MemberURL?service=listMembers");
            }

            if (service.equals("deleteMember")) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.deleteMember(id);
                response.sendRedirect("MemberURL?service=listMembers");
            }

            if (service.equals("searchMember")) {
                String keyword = request.getParameter("keyword");
                List<Member> result = dao.searchMemberByName(keyword);
                request.setAttribute("memberData", result);
                request.setAttribute("searchKeyword", keyword);
                request.getRequestDispatcher("/jsp/admin/ListMembers.jsp").forward(request, response);
            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "MemberController for admin";
    }
}
