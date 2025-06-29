package controller.CartController;

import dao.ProductVariantDAO;
import model.Cart;
import model.Product;
import model.ProductVariant;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AddToCart", urlPatterns = {"/addToCart"})
public class AddToCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductVariantDAO variantDao = new ProductVariantDAO();

        HttpSession session = request.getSession();
        ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
        if (cart == null) cart = new ArrayList<>();

        // ✅ Lấy variantId và quantity
        int variantId = Integer.parseInt(request.getParameter("variantId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // ✅ Lấy biến thể từ DB, bao gồm cả thông tin Product bên trong
        ProductVariant variant = variantDao.getProductVariantById(variantId);
        if (variant == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        Product product = variant.getProduct();

        // ✅ Tìm biến thể trong giỏ
        Cart cartExist = null;
        for (Cart c : cart) {
            if (c.getProductVariant().getProductVariantId() == variantId) {
                cartExist = c;
                if (cartExist.getQuantity() + quantity <= 0) {
                    cart.remove(c);
                } else {
                    cartExist.setQuantity(cartExist.getQuantity() + quantity);
                }
                break;
            }
        }

        // ✅ Nếu chưa có thì thêm mới
        if (cartExist == null && quantity > 0) {
            cartExist = new Cart(product, quantity, variant);
            cart.add(cartExist);
        }

        // ✅ Cập nhật session & trả JSON
        session.setAttribute("cart", cart);
        JSONObject json = new JSONObject();
        json.put("success", true);
        json.put("quantityCart", cart.size());

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json.toString());
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
        return "Add to cart controller using variantId";
    }
}
