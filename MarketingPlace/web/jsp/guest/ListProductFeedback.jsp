<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.FeedbackDisplayItem" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<<<<<<< Updated upstream
    <head>
        <meta charset="UTF-8">
        <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
        <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/drift-zoom/drift-basic.css" rel="stylesheet">

        <!-- Main CSS File -->
        <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
        <title>Sản phẩm đã mua cần đánh giá</title>

        <style>
    .item {
        border: 1px solid #e0e0e0;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        margin: 20px auto;
        padding: 20px 24px;
        border-radius: 8px;
        display: flex;
        gap: 20px;
        align-items: flex-start;
        max-width: 1140px;
        background-color: #fff;
        transition: box-shadow 0.2s ease;
    }

    .item:hover {
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .item img.thumb {
        width: 120px;
        height: 120px;
        object-fit: cover;
        border: 1px solid #ccc;
        border-radius: 6px;
    }

    .item h4 {
        font-size: 1.2rem;
        font-weight: 600;
        margin-bottom: 8px;
    }

    .item p {
        margin: 4px 0;
        font-size: 0.95rem;
        color: #333;
    }

    .btn {
        padding: 6px 14px;
        text-decoration: none;
        border-radius: 4px;
        margin-right: 6px;
        font-size: 0.9rem;
        color: #fff;
        cursor: pointer;
        border: none;
    }

    .btn-primary {
        background: #0d6efd;
    }

    .btn-warning {
        background: #ffc107;
        color: #212529;
    }

    .btn-danger {
        background: #dc3545;
    }

    .back-btn {
        background: #6c757d;
    }

    label {
        margin-right: 8px;
        font-weight: 500;
        font-size: 0.95rem;
    }

    select {
        vertical-align: middle;
        padding: 4px 6px;
        font-size: 0.9rem;
    }
</style>

    </head>
    <body>
    <div class="container">
        <jsp:include page="/jsp/public/Header.jsp"></jsp:include>
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
    </div>
    </body>
=======
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
>>>>>>> Stashed changes
</html>
