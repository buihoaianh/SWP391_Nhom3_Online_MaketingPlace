package controller.UserController;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Product;
import model.ProductVariant;
import dao.ProductDAO;

@WebServlet(name = "DetailProduct", urlPatterns = {"/DetailProduct"})
public class DetailProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String pidRaw = request.getParameter("pid");
            if (pidRaw == null || pidRaw.isEmpty()) {
                response.sendRedirect("error.jsp");
                return;
            }

            int productId = Integer.parseInt(pidRaw);
            String selectedColor = request.getParameter("color");
            String selectedSize = request.getParameter("size");

            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductByID(productId);

            if (product == null) {
                response.sendRedirect("error.jsp");
                return;
            }

            List<ProductVariant> allVariants = product.getVariants();
            if (allVariants == null || allVariants.isEmpty()) {
                response.sendRedirect("error.jsp");
                return;
            }

            // Nếu chưa chọn màu thì chọn màu đầu tiên
            if (selectedColor == null || selectedColor.isEmpty()) {
                selectedColor = allVariants.get(0).getColor().getName();
            }

            // Lọc theo màu
            final String finalSelectedColor = selectedColor;
            List<ProductVariant> filteredByColor = allVariants.stream()
                    .filter(v -> v.getColor().getName().equalsIgnoreCase(finalSelectedColor))
                    .collect(Collectors.toList());

            // Nếu chưa chọn size thì chọn size đầu tiên của màu đó
            if ((selectedSize == null || selectedSize.isEmpty()) && !filteredByColor.isEmpty()) {
                selectedSize = filteredByColor.get(0).getSize().getName();
            }

            // Lọc tiếp theo size
            final String finalSelectedSize = selectedSize;
            List<ProductVariant> filteredByColorAndSize = filteredByColor.stream()
                    .filter(v -> v.getSize().getName().equalsIgnoreCase(finalSelectedSize))
                    .collect(Collectors.toList());

            // Chọn variant phù hợp
            ProductVariant selectedVariant = !filteredByColorAndSize.isEmpty()
                    ? filteredByColorAndSize.get(0)
                    : filteredByColor.get(0); // fallback theo màu

            // Tính giá
            double salePrice = selectedVariant.getPrice();
            double originalPrice = salePrice * 1.2;
            int discount = (int) Math.round((originalPrice - salePrice) / originalPrice * 100);

            // Lấy ảnh theo variant
            List<String> variantImages = productDAO.getImagesByVariantId(selectedVariant.getProductVariantId());

            // Set attributes
            request.setAttribute("detail", product);
            request.setAttribute("originalPrice", originalPrice);
            request.setAttribute("discount", discount);
            request.setAttribute("selectedVariant", selectedVariant);
            request.setAttribute("filteredVariants", filteredByColor); // danh sách size theo màu
            request.setAttribute("selectedColor", selectedColor);
            request.setAttribute("selectedSize", selectedSize);
            request.setAttribute("variantImages", variantImages);

            // Chuyển tiếp sang JSP
            request.getRequestDispatcher("jsp/ProductDetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
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
        return "Hiển thị chi tiết sản phẩm theo ID, màu, size và hình ảnh";
    }
}
