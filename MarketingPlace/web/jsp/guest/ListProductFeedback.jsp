<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.FeedbackDisplayItem" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <meta charset="UTF-8">
  <title>Sản phẩm đã mua cần đánh giá</title>
  <style>
    .item {
      border: 1px solid #ddd;
      margin: 15px 0;
      padding: 15px;
      border-radius: 6px;
      display: flex;
      gap: 15px;
      align-items: flex-start;
    }
    .item img.thumb {
      width: 100px; height: 100px;
      object-fit: cover;
      border: 1px solid #ccc;
    }
    .btn {
      padding: 5px 10px;
      text-decoration: none;
      border-radius: 4px;
      margin-right: 5px;
      color: #fff;
      cursor: pointer;
    }
    .btn-primary { background: #007bff; }
    .btn-warning { background: #ffc107; color: #212529; }
    .btn-danger  { background: #dc3545; }
    .back-btn    { background: #6c757d; }
    label { margin-right: 8px; }
    select { vertical-align: middle; }
  </style>
</head>
<body>
  <c:if test="${param.success == 'true'}">
    <div style="background:#d4edda;color:#155724;padding:10px;border-radius:4px;margin-bottom:15px;">
      Feedback successful!
    </div>
  </c:if>

  <h2>Sản phẩm đã mua cần đánh giá</h2>

  <c:forEach var="item" items="${feedbackItems}">
    <div class="item">
      <img class="thumb"
           src="${pageContext.request.contextPath}/${item.thumbnailUrl}"
           alt="${item.productName}"/>

      <div style="flex:1">
        <h4>${item.productName}</h4>
        <p><strong>Danh mục:</strong> ${item.categoryName}</p>
        <p><strong>Size:</strong> ${item.sizeName} – <strong>Màu:</strong> ${item.colorName}</p>
        <p><strong>Số lượng:</strong> ${item.quantity} – <strong>Giá:</strong> ${item.unitPrice}₫</p>
        <p><strong>Ngày đặt:</strong> ${item.orderDate}</p>
        <p><strong>Tổng tiền:</strong> ${item.totalPrice}₫</p>

        <c:choose>

          <c:when test="${item.rating > 0}">
            <form action="${pageContext.request.contextPath}/edit-feedback"
                  method="post" enctype="multipart/form-data"  style="margin-top:10px; display:inline-block;">
              <input type="hidden" name="orderId"          value="${item.orderId}"/>
              <input type="hidden" name="productVariantId" value="${item.productVariantId}"/>
              <input type="hidden" name="orderDetailId"    value="${item.orderDetailId}"/>
              <input type="hidden" name="isUpdate"         value="true"/>
              <input type="hidden" name="returnTo"         value="list"/>

              <label><strong>Rating:</strong></label>
              <select name="rating" required>
                <option value="5" <c:if test="${item.rating==5}">selected</c:if>>
                    ⭐️⭐️⭐️⭐️⭐️ - Excellent
                ️</option>
                <option value="4" <c:if test="${item.rating==4}">selected</c:if>>
                    ⭐️⭐️⭐️⭐️ - Good
                ️</option>
                <option value="3" <c:if test="${item.rating==3}">selected</c:if>>
                    ⭐️⭐️⭐️ - Average
                ️</option>
                <option value="2" <c:if test="${item.rating==2}">selected</c:if>>
                    ⭐️⭐️ - Poor
                ️</option>
                <option value="1" <c:if test="${item.rating==1}">selected</c:if>>
                    ⭐️ - Very bad
                ️</option>
              </select>

              <div style="margin-top:8px;">
                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                    <a href="${pageContext.request.contextPath}/delete-feedback?orderId=${item.orderId}&productVariantId=${item.productVariantId}"
                       class="btn btn-danger"
                       onclick="return confirm('Bạn có chắc muốn xóa đánh giá?');">
                        Xóa
                    </a>
                    <a href="${pageContext.request.contextPath}/feedback-detail?orderId=${item.orderId}&productVariantId=${item.productVariantId}"
                       class="btn btn-warning">Chi tiết</a>
              </div>
            </form>
          </c:when>


          <c:otherwise>
            <form action="${pageContext.request.contextPath}/feedback-detail"
                  method="post" enctype="multipart/form-data" style="margin-top:10px; display:inline-block;">
              <input type="hidden" name="orderId"          value="${item.orderId}"/>
              <input type="hidden" name="productVariantId" value="${item.productVariantId}"/>
              <input type="hidden" name="orderDetailId"    value="${item.orderDetailId}"/>

              <label><strong>Đánh giá:</strong></label>
              <select name="rating" required>
                <option value="">--Chọn--</option>
                <option value="5">⭐️⭐️⭐️⭐️⭐️</option>
                <option value="4">⭐️⭐️⭐️⭐️</option>
                <option value="3">⭐️⭐️⭐️</option>
                <option value="2">⭐️⭐️</option>
                <option value="1">⭐️</option>
              </select>

              <button type="submit" class="btn btn-primary">Gửi</button>
            </form>

            <a href="${pageContext.request.contextPath}/feedback-detail?orderId=${item.orderId}&productVariantId=${item.productVariantId}"
               class="btn btn-warning">Chi tiết</a>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </c:forEach>
</body>
</html>
