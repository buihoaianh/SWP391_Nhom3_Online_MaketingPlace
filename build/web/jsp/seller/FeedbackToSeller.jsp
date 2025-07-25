<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.FeedbackDisplayItem" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Phản hồi khách hàng – Seller</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/bootstrap-icons/bootstrap-icons.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/app.css"/>

    <style>
        /* Sidebar/content layout */
        #main-content {
            margin-left: 250px;
            padding: 20px;
            min-height: 100vh;
            background: #f5f7fa;
        }
        #sidebar:not(.active) ~ #main-content {
            margin-left: 0;
        }

        /* Card styling */
        .feedback-card {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            display: flex;
            gap: 20px;
            align-items: flex-start;
        }
        .feedback-card img.product-thumb {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .feedback-details h5 {
            margin-top: 0;
            font-weight: 600;
        }
        .feedback-details p {
            margin-bottom: 8px;
            color: #444;
        }
        .feedback-images img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 4px;
            border: 1px solid #ccc;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div id="app">
    <!-- Sidebar -->
    <div id="sidebar" class="active">
        <div class="sidebar-wrapper active">
            <div class="logo text-center py-3">
                <a href="seller-dashboard">
                    <img src="${pageContext.request.contextPath}/asset/images/logo/logo.png"
                         alt="Logo" style="max-width: 180px;"/>
                </a>
            </div>
            <jsp:include page="slider.jsp"/>
            <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
        </div>
    </div>

    <!-- Main content -->
    <div id="main-content">
        <div class="text-center mb-4">
            <h2>Danh sách phản hồi từ khách hàng</h2>
        </div>

        <c:if test="${empty feedbackItems}">
            <div class="alert alert-info text-center">
                Chưa có phản hồi nào.
            </div>
        </c:if>

        <c:forEach var="item" items="${feedbackItems}">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="feedback-card">
                        <img class="product-thumb"
                             src="${pageContext.request.contextPath}/${item.thumbnailUrl}"
                             alt="Thumb ${item.productName}"/>

                        <div class="feedback-details flex-grow-1">
                            <h5>${item.productName}</h5>
                            <p><strong>Danh mục:</strong> ${item.categoryName}</p>
                            <p><strong>Size:</strong> ${item.sizeName} &ndash; 
                               <strong>Màu:</strong> ${item.colorName}</p>
                            <p><strong>Số lượng:</strong> ${item.quantity} &ndash; 
                               <strong>Giá:</strong> ${item.unitPrice}₫</p>
                            <p><strong>Ngày đặt:</strong> ${item.orderDate}</p>
                            <p><strong>Khách hàng:</strong> ${item.customerName}</p>
                            <p><strong>Đánh giá:</strong>
                                <c:forEach var="i" begin="1" end="${item.rating}">
                                    ⭐
                                </c:forEach>
                            </p>
                            <p><strong>Nhận xét:</strong>
                                <c:choose>
                                    <c:when test="${not empty item.feedbackText}">
                                        ${item.feedbackText}
                                    </c:when>
                                    <c:otherwise><em>Không có</em></c:otherwise>
                                </c:choose>
                            </p>

                            <c:if test="${not empty item.feedbackImages}">
                                <div class="feedback-images mt-3">
                                    <strong>Hình ảnh khách gửi:</strong><br/>
                                    <c:forEach var="imgUrl" items="${item.feedbackImages}">
                                        <img src="${pageContext.request.contextPath}/${imgUrl}"
                                             alt="Feedback image"/>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- JS -->
<script src="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
</body>
</html>
