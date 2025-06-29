package controller.CartController;

import config.VNPayConfig;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.OrderHistoryDAO;
import dao.PaymentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Account;
import model.Cart;
import model.Order;
import model.OrderDetail;
import model.ProductVariant;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;
import java.nio.charset.StandardCharsets;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
        Account user = (Account) session.getAttribute("user");
        String paymentMethod = request.getParameter("paymentMethod");

        if (cart == null || cart.isEmpty() || user == null || paymentMethod == null) {
            response.sendRedirect("loginAccount");
            return;
        }

        int paymentMethodId = paymentMethod.equals("vnpay") ? 2 : 1;
        int provinceCode = Integer.parseInt(request.getParameter("provinceCode"));
        String provinceName = request.getParameter("provinceName");
        int districtCode = Integer.parseInt(request.getParameter("districtCode"));
        String districtName = request.getParameter("districtName");
        int wardCode = Integer.parseInt(request.getParameter("wardCode"));
        String wardName = request.getParameter("wardName");
        double total = 0;
        for (Cart item : cart) {
            ProductVariant variant = item.getProductVariant();
            total += variant.getPrice() * item.getQuantity();
        }

        // Insert into Payments table first
        PaymentDAO paymentDAO = new PaymentDAO();
        int paymentId = paymentDAO.insertPayment(paymentMethodId);

        // Create and insert Order
        Order order = new Order();
        order.setCustomerId(user.getAccountID());
        order.setSellerId(cart.get(0).getProduct().getAccountId());
        order.setPaymentId(paymentId);
        order.setOrderStatusId(1);
        order.setTotalAmount(String.valueOf(total));
        order.setProvinceCode(provinceCode);
        order.setProvinceName(provinceName);
        order.setDistrictCode(districtCode);
        order.setDistrictName(districtName);
        order.setWardCode(wardCode);
        order.setWardName(wardName);

        OrderDAO orderDAO = new OrderDAO();
        int orderId = orderDAO.insertOrder(order);

        if (orderId > 0) {
            // Insert OrderDetails
            OrderDetailDAO detailDAO = new OrderDetailDAO();
            for (Cart item : cart) {
                ProductVariant variant = item.getProductVariant();

                OrderDetail detail = new OrderDetail();
                detail.setOrderId(orderId);
                detail.setProductVariantId(variant.getProductVariantId());
                detail.setQuantity(item.getQuantity());
                detail.setUnitPrice(String.valueOf(variant.getPrice()));
                detailDAO.insertOrderDetail(detail);
            }

            // Insert into OrderHistory
            OrderHistoryDAO historyDAO = new OrderHistoryDAO();
            historyDAO.insertOrderHistory(orderId, user.getAccountID(), total);

            session.removeAttribute("cart");

            // Handle VNPay Payment
            if (paymentMethod.equals("vnpay")) {
                try {
                    String vnp_Version = "2.1.0";
                    String vnp_Command = "pay";
                    String orderType = "other";

                    long amount = Math.round(total * 100); // VND * 100
                    String bankCode = request.getParameter("bankCode");
                    String vnp_TxnRef = VNPayConfig.getRandomNumber(8);
                    String vnp_IpAddr = VNPayConfig.getIpAddress(request);
                    String vnp_TmnCode = VNPayConfig.vnp_TmnCode;

                    Map<String, String> vnp_Params = new TreeMap<>();
                    vnp_Params.put("vnp_Version", vnp_Version);
                    vnp_Params.put("vnp_Command", vnp_Command);
                    vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
                    vnp_Params.put("vnp_Amount", String.valueOf(amount));
                    vnp_Params.put("vnp_CurrCode", "VND");

                    if (bankCode != null && !bankCode.isEmpty()) {
                        vnp_Params.put("vnp_BankCode", bankCode);
                    }

                    vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                    vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang " + orderId);
                    vnp_Params.put("vnp_OrderType", orderType);

                    String locate = request.getParameter("language");
                    vnp_Params.put("vnp_Locale", (locate != null && !locate.isEmpty()) ? locate : "vn");

                    vnp_Params.put("vnp_ReturnUrl", VNPayConfig.vnp_ReturnUrl);
                    vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

                    Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                    String vnp_CreateDate = formatter.format(cld.getTime());
                    vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

                    cld.add(Calendar.MINUTE, 15);
                    String vnp_ExpireDate = formatter.format(cld.getTime());
                    vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

                    String vnp_SecureHash = VNPayConfig.hashAllFields(vnp_Params);

                    StringBuilder query = new StringBuilder();
                    for (Map.Entry<String, String> entry : vnp_Params.entrySet()) {
                        query.append(URLEncoder.encode(entry.getKey(), StandardCharsets.UTF_8.toString()))
                                .append('=')
                                .append(URLEncoder.encode(entry.getValue(), StandardCharsets.UTF_8.toString()))
                                .append('&');
                    }
                    query.append("vnp_SecureHash=").append(vnp_SecureHash);

                    String paymentUrl = VNPayConfig.vnp_PayUrl + "?" + query;
                    response.sendRedirect(paymentUrl);

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("jsp/guest/confirmCheckout.jsp?status=fail&error=exception");
                }
            } else {
                // ✅ Gửi thông báo vào session
                session.setAttribute("message", "Đặt hàng thành công! Vui lòng chờ xác nhận từ người bán.");

                // ✅ Chuyển về Home
                response.sendRedirect("Home");
            }

        } else {
            response.sendRedirect("jsp/guest/confirmCheckout.jsp?status=fail&error=order_insert");
        }
    }
}
