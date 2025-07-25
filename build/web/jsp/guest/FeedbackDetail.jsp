<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.FeedbackDisplayItem" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết phản hồi</title>
    <style>
        .container {
            max-width: 800px; margin: 20px auto; padding: 20px;
            border: 1px solid #ccc; border-radius: 6px;
            font-family: Arial, sans-serif;
        }
        img.product-img {
            width: 150px; height: 150px;
            object-fit: cover; border: 1px solid #ccc;
        }
        .feedback-images img {
            width: 100px; height: 100px; object-fit: cover;
            margin-right: 8px; border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn {
            padding: 6px 12px; border: none; border-radius: 4px;
            cursor: pointer; text-decoration: none; color: #fff;
            margin-right: 8px;
        }
        .btn-primary { background-color: #007bff; }
        .btn-warning { background-color: #ffc107; color: #212529; }
        .btn-danger  { background-color: #dc3545; }
        .back-btn    { background-color: #6c757d; }
        label { display: block; margin-top: 12px; }
    </style>
</head>
<body>
<div class="container">
    <h2>Chi tiết phản hồi sản phẩm</h2>

    <!-- Thông tin sản phẩm -->
    <div style="display:flex; gap:20px; align-items:flex-start;">
        <img src="${pageContext.request.contextPath}/${feedbackItem.thumbnailUrl}"
             class="product-img" alt="Product Image"/>
        <div>
            <h3>${feedbackItem.productName}</h3>
            <p><strong>Danh mục:</strong> ${feedbackItem.categoryName}</p>
            <p><strong>Size:</strong> ${feedbackItem.sizeName} – 
               <strong>Màu:</strong> ${feedbackItem.colorName}</p>
            <p><strong>Số lượng:</strong> ${feedbackItem.quantity} – 
               <strong>Giá:</strong> ${feedbackItem.unitPrice}₫</p>
            <p><strong>Ngày đặt:</strong> ${feedbackItem.orderDate}</p>
            <p><strong>Tổng tiền:</strong> ${feedbackItem.totalPrice}₫</p>
        </div>
    </div>

    <c:choose>
        <c:when test="${feedbackItem.rating > 0}">
            <form action="${pageContext.request.contextPath}/edit-feedback"
                  method="post" enctype="multipart/form-data"
                  onsubmit="return confirm('Bạn có chắc muốn cập nhật phản hồi?');"
                  style="margin-top:20px;">

                <input type="hidden" name="orderId"
                       value="${feedbackItem.orderId}"/>
                <input type="hidden" name="productVariantId"
                       value="${feedbackItem.productVariantId}"/>
                <input type="hidden" name="orderDetailId"
                       value="${feedbackItem.orderDetailId}"/>
                <input type="hidden" name="isUpdate" value="true"/>
                <input type="hidden" name="returnTo"         value="detail"/>

                <label><strong>Rating:</strong></label>
                <select name="rating" required>
                    <option value="5" <c:if test="${feedbackItem.rating == 5}">selected</c:if>>
                        ⭐️⭐️⭐️⭐️⭐️ - Excellent
                    </option>
                    <option value="4" <c:if test="${feedbackItem.rating == 4}">selected</c:if>>
                        ⭐️⭐️⭐️⭐️ - Good
                    </option>
                    <option value="3" <c:if test="${feedbackItem.rating == 3}">selected</c:if>>
                        ⭐️⭐️⭐️ - Average
                    </option>
                    <option value="2" <c:if test="${feedbackItem.rating == 2}">selected</c:if>>
                        ⭐️⭐️ - Poor
                    </option>
                    <option value="1" <c:if test="${feedbackItem.rating == 1}">selected</c:if>>
                        ⭐️ - Very bad
                    </option>
                </select>

                <label><strong>Comment (optional):</strong></label>
                <textarea name="comment" rows="4" cols="60"
                          placeholder="Viết bình luận...">${feedbackItem.feedbackText}</textarea>

                <c:if test="${not empty feedbackItem.feedbackImages}">
                    <label><strong>Ảnh đã gửi:</strong></label>
                    <div class="feedback-images">
                        <c:forEach var="img" items="${feedbackItem.feedbackImages}">
                            <img src="${pageContext.request.contextPath}/${img}"
                                 alt="Feedback Image"/>
                        </c:forEach>
                    </div>
                </c:if>

                <label><strong>Upload thêm ảnh:</strong></label>
                <input type="file" name="imageFiles" accept="image/*" multiple/>

                <div id="preview" style="display:flex; flex-wrap:wrap; margin-top:8px;"></div>

                <div style="margin-top:20px;">
                    <button type="submit" class="btn btn-primary">Cập nhật phản hồi</button>
                    <a href="${pageContext.request.contextPath}/delete-feedback?orderId=${feedbackItem.orderId}&productVariantId=${feedbackItem.productVariantId}"
                       class="btn btn-danger"
                       onclick="return confirm('Bạn có chắc muốn xóa phản hồi này?');">
                       Xóa phản hồi
                    </a>
                    <a href="${pageContext.request.contextPath}/feedback" class="btn back-btn">⬅ Quay lại</a>
                </div>
            </form>
        </c:when>

        <c:otherwise>
            <form action="${pageContext.request.contextPath}/feedback-detail"
                  method="post" enctype="multipart/form-data"
                  style="margin-top:20px;">

                <input type="hidden" name="orderId"
                       value="${feedbackItem.orderId}"/>
                <input type="hidden" name="productVariantId"
                       value="${feedbackItem.productVariantId}"/>
                <input type="hidden" name="orderDetailId"
                       value="${feedbackItem.orderDetailId}"/>

                <h4>Đánh giá mới</h4>

                <label><strong>Rating:</strong></label>
                <select name="rating" required>
                    <option value="">-- Chọn rating --</option>
                    <option value="5">⭐️⭐️⭐️⭐️⭐️ - Excellent</option>
                    <option value="4">⭐️⭐️⭐️⭐️ - Good</option>
                    <option value="3">⭐️⭐️⭐️ - Average</option>
                    <option value="2">⭐️⭐️ - Poor</option>
                    <option value="1">⭐️ - Very bad</option>
                </select>

                <label><strong>Comment (optional):</strong></label>
                <textarea name="comment" rows="4" cols="60"
                          placeholder="Viết bình luận..."></textarea>

                <label><strong>Upload ảnh (tùy chọn):</strong></label>
                <input type="file" name="imageFiles"
                       accept="image/*" multiple/>
                <c:if test="${not empty sessionScope.msg}">
                    <div style="background:#d4edda;color:#155724;padding:10px;border-radius:4px;margin-bottom:15px">
                    ${sessionScope.msg}
                  </div>
                    <c:remove var="msg" scope="session"/>
                </c:if>


                <div id="preview" style="display:flex; flex-wrap:wrap; margin-top:8px;"></div>

                <div style="margin-top:20px;">
                    <button type="submit" class="btn btn-primary">Gửi phản hồi</button>
                    <a href="${pageContext.request.contextPath}/feedback" class="btn back-btn">⬅ Quay lại</a>
                </div>
            </form>
        </c:otherwise>
    </c:choose>
</div>

<script>
  // Preview ảnh mới cho cả 2 form
  document.querySelectorAll('input[type=file][name=imageFiles]').forEach(input => {
    const preview = document.getElementById('preview');
    input.addEventListener('change', () => {
      preview.innerHTML = '';
      Array.from(input.files).forEach(f => {
        if (!f.type.startsWith('image/')) return;
        const r = new FileReader();
        r.onload = e => {
          const img = document.createElement('img');
          img.src = e.target.result;
          img.style.width = '100px';
          img.style.height = '100px';
          img.style.objectFit = 'cover';
          img.style.margin = '4px';
          img.style.border = '1px solid #ccc';
          preview.appendChild(img);
        };
        r.readAsDataURL(f);
      });
    });
  });
</script>
</body>
</html>
