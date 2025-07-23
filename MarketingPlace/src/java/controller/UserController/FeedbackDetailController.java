package controller.UserController;


import dao.CategoriesDAO;
import dao.ColorDAO;
import dao.FeedbackDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.SizeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import model.Account;
import model.Categories;
import model.Color;
import model.FeedbackDisplayItem;
import model.Feedbacks;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.Size;
import utils.Helpers;

@WebServlet(name = "FeedbackDetailController", urlPatterns = {"/feedback-detail"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class FeedbackDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int variantId = Integer.parseInt(request.getParameter("productVariantId"));
        int orderId   = Integer.parseInt(request.getParameter("orderId"));

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        if (acc == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        FeedbackDAO    feedbackDAO   = new FeedbackDAO();
        SizeDAO        sizeDAO       = new SizeDAO();
        ColorDAO       colorDAO      = new ColorDAO();
        ProductDAO     productDAO    = new ProductDAO();
        CategoriesDAO  categoryDAO   = new CategoriesDAO();
        OrderDAO       orderDAO      = new OrderDAO();

        // Lấy OrderDetail
        OrderDetail od = feedbackDAO.getOrderDetailByOrderIdAndVariantId(orderId, variantId);
        if (od == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy sản phẩm cần đánh giá");
            return;
        }

        // Lấy thông tin phụ
        Product    p    = productDAO.getProductByIdFb(od.getProductVariant().getProductId());
        Size       s    = sizeDAO.getSizeById(od.getProductVariant().getSizeId());
        Color      c    = colorDAO.getColorById(od.getProductVariant().getColorId());
        Categories cat  = categoryDAO.getCategoryById(p.getCategoryID());
        Order      order= orderDAO.getOrderById(orderId);

        // Khởi tạo item với giá trị mặc định từ OrderDetail
        FeedbackDisplayItem item = new FeedbackDisplayItem();
        item.setOrderId(orderId);
        item.setOrderDetailId(od.getOrderDetailsId());
        item.setProductVariantId(variantId);
        item.setOrderDate(order.getOrderDate());
        item.setProductName(p.getProductName());
        item.setThumbnailUrl(p.getThumbnailURL());
        item.setSizeName(s.getName());
        item.setColorName(c.getName());
        item.setCategoryName(cat.getCategoryName());
        item.setQuantity(od.getQuantity());
        item.setUnitPrice(od.getUnitPrice());
        item.setTotalPrice(od.getQuantity() * Long.parseLong(od.getUnitPrice()));

        // ----- BỔ SUNG: ghi đè quantity và totalPrice nếu có truyền từ list page -----
        String qtyParam = request.getParameter("quantity");
        if (qtyParam != null && !qtyParam.isEmpty()) {
            item.setQuantity(Integer.parseInt(qtyParam));
        }
        String totParam = request.getParameter("totalPrice");
        if (totParam != null && !totParam.isEmpty()) {
            item.setTotalPrice(Long.parseLong(totParam));
        }
        // ------------------------------------------------------------------------------

        // Nếu đã có feedback thì gán thêm rating, text và images
        Feedbacks fb = feedbackDAO.getFeedbackByOrderAndVariant(orderId, variantId);
        if (fb != null) {
            item.setRating(fb.getRating());
            item.setFeedbackText(fb.getFeedbackText());
            List<String> imgs = feedbackDAO.getImageUrlsByFeedbackId(fb.getFeedbackID());
            item.setFeedbackImages(imgs);
        }

        request.setAttribute("feedbackItem", item);
        request.getRequestDispatcher("/jsp/guest/FeedbackDetail.jsp")
               .forward(request, response);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1. Chuẩn hóa charset & kiểm tra login
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 2. Đọc form params
        int orderId        = Integer.parseInt(request.getParameter("orderId"));
        int variantId      = Integer.parseInt(request.getParameter("productVariantId"));
        int orderDetailId  = Integer.parseInt(request.getParameter("orderDetailId"));
        int rating         = Integer.parseInt(request.getParameter("rating"));
        String comment     = request.getParameter("comment");
        
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        SizeDAO sizeDAO = new SizeDAO();
        ColorDAO colorDAO = new ColorDAO();
        ProductDAO productDAO = new ProductDAO();
        CategoriesDAO categoryDAO = new CategoriesDAO();
        OrderDAO orderDAO = new OrderDAO();

        try {
            // 3. Insert feedback, lấy feedbackId
            int feedbackId = feedbackDAO.insertFeedback(
                user.getAccountID(),
                comment,
                rating,
                variantId,
                orderId
            );

            // 4. Xử lý file upload (nếu có)
            // trước khi vòng lặp
            boolean allUploaded = true;

            // upload và insert ảnh
            for (Part part : request.getParts()) {
                if ("imageFiles".equals(part.getName()) && part.getSize() > 0) {
//                    String original  = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//                    String unique    = UUID.randomUUID() + "_" + original;
//                    String uploadDir = getServletContext().getRealPath("/uploads/feedback");
//                    File folder      = new File(uploadDir);
//                    if (!folder.exists()) folder.mkdirs();
//
//                    File file = new File(folder, unique);
//                    part.write(file.getAbsolutePath());
                    String fileName = Helpers.saveImage(part, request, "feedback");
                    // chèn URL vào DB
//                    String webUrl = "uploads/feedback/" + unique;
                    boolean success = feedbackDAO.insertImageFeedback(feedbackId, fileName);
                    if (!success) {
                        allUploaded = false;
                        // Nếu cần dừng ngay khi có lỗi, bỏ comment dòng sau:
                        // break;
                    }
                }
            }

            // đặt message vào session để JSP show
            if (allUploaded) {
                session.setAttribute("msg", "Upload ảnh thành công!");
            } else {
                session.setAttribute("msg", "Có lỗi khi upload một hoặc nhiều ảnh!");
            }


            // 6. Cập nhật OrderDetail.Status
            feedbackDAO.updateOrderDetailStatus(orderDetailId, 1);

            // 7. Redirect về list feedback (một GET mới, load data tươi)
            // đúng: redirect về /feedback để chạy doGet
            response.sendRedirect(request.getContextPath() + "/feedback?success=true");
            return;



        } catch (Exception e) {
            throw new ServletException("Lỗi khi lưu feedback", e);
        }
    }
}
