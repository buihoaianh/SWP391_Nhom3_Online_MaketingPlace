package controller.CartController;

import config.VNPayConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.*;

@WebServlet("/vnpay-return")
public class VNPayReturnServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Lấy tất cả parameter từ VNPay trả về (trừ secure hash)
        Map<String, String> vnpParams = new HashMap<>();
        for (Enumeration<String> e = request.getParameterNames(); e.hasMoreElements();) {
            String param = e.nextElement();
            String value = request.getParameter(param);
            if (!"vnp_SecureHash".equals(param) && !"vnp_SecureHashType".equals(param)) {
                vnpParams.put(param, value);
            }
        }

        // 2. Lấy secure hash từ VNPay
        String receivedHash = request.getParameter("vnp_SecureHash");

        // 3. Tạo hash lại từ server theo cách giống bên checkout
        SortedMap<String, String> sortedParams = new TreeMap<>(vnpParams);
        String generatedHash = VNPayConfig.hashAllFields(sortedParams); // ✅ giống logic tạo

        // 4. Chuẩn bị session để truyền thông báo
        HttpSession session = request.getSession();

        if (generatedHash.equals(receivedHash)) {
            String responseCode = request.getParameter("vnp_ResponseCode");
            String orderInfo = request.getParameter("vnp_OrderInfo");
            int orderId = extractOrderId(orderInfo);

            if ("00".equals(responseCode)) {
                session.setAttribute("message", "✅ Thanh toán thành công cho đơn hàng #" + orderId);
            } else {
                session.setAttribute("message", "❌ Thanh toán thất bại! Mã lỗi: " + responseCode);
            }
        } else {
            session.setAttribute("message", "⚠️ Xác thực thanh toán thất bại! Chữ ký không hợp lệ.");
        }

        // 5. Trả về trang chủ
        response.sendRedirect("Home");
    }

    private int extractOrderId(String orderInfo) {
        try {
            String[] parts = orderInfo.split(" ");
            return Integer.parseInt(parts[parts.length - 1]);
        } catch (Exception e) {
            return -1;
        }
    }
}
