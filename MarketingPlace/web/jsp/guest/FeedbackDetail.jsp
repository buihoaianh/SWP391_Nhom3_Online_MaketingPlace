<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.FeedbackDisplayItem" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<html>
<head>
    <title>Sản phẩm cần đánh giá</title>
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
        .item img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
<h2>Sản phẩm đã mua cần đánh giá</h2>

<c:forEach var="item" items="${feedbackItems}">
    <div class="item">
        <img src="${pageContext.request.contextPath}/${item.thumbnailUrl}" style="width: 100px; height: 100px;" />
        <div>
            <h4>${item.productName}</h4>
            <p><strong>Danh mục:</strong> ${item.categoryName}</p>
            <p><strong>Size:</strong> ${item.sizeName} - <strong>Màu:</strong> ${item.colorName}</p>
            <p><strong>Số lượng:</strong> ${item.quantity} - <strong>Giá:</strong> ${item.unitPrice}₫</p>
            <p><strong>Ngày đặt:</strong> ${item.orderDate}</p>
            
            <form action="${pageContext.request.contextPath}/seller/feedback-detail" method="post" enctype="multipart/form-data">
                <input type="hidden" name="productVariantId" value="${item.productVariantId}" />
                <input type="hidden" name="orderId" value="${item.orderId}" />

                <h5>We value your feedback!</h5>

                <label>Rating:</label>
                <select name="rating" required>
                    <option value="5">⭐️⭐️⭐️⭐️⭐️ - Excellent</option>
                    <option value="4">⭐️⭐️⭐️⭐️ - Good</option>
                    <option value="3">⭐️⭐️⭐️ - Average</option>
                    <option value="2">⭐️⭐️ - Poor</option>
                    <option value="1">⭐️ - Very bad</option>
                </select><br><br>

                <label for="comment">Comment:</label><br>
                <textarea name="comment" rows="4" cols="50" placeholder="Viết đánh giá của bạn tại đây..."></textarea><br><br>

                <label for="image">Upload image (optional):</label>
                <input type="file" name="imageFile" accept="image/*"><br><br>

                <button type="submit" class="btn btn-primary">Submit Feedback</button>
            </form>

        </div>
    </div>
</c:forEach>

</body>
</html>
