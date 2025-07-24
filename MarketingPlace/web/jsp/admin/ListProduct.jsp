
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"      prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List Product</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/list-seller.css" rel="stylesheet">
          <style>
    /* Thêm khoảng cách và căn giữa tiêu đề */
    main {
      margin: 60px 30px;
    }
    h2.title {
      text-align: center;
      margin-bottom: 20px;
      font-size: 2rem;
      font-weight: 600;
    }
    /* Bảng sản phẩm */
    .product-table th {
      background: #435EBE;
      color: #fff;
      vertical-align: middle;
    }
    .product-table td, .product-table th {
      padding: 12px;
      text-align: center;
      border: 1px solid #dee2e6;
    }
    img.thumb {
      width: 60px;
      height: 60px;
      object-fit: cover;
      border-radius: 4px;
    }
    /* Đổi Active (trước đây là bg-danger) thành xanh */
.product-table .badge.bg-danger {
  background-color: #198754 !important; /* màu xanh lá (bootstrap-success) */
  border-color:  #198754 !important;
}

/* Đổi Inactive (trước đây là bg-success) thành đỏ */
.product-table .badge.bg-success {
  background-color: #dc3545 !important; /* màu đỏ (bootstrap-danger) */
  border-color:  #dc3545 !important;
}

  </style>

    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->


            <%@ include file="../../components/sidebarAdmin.jsp" %>

            <div class="content">
                <h2 class="title">DANH SÁCH SẢN PHẨM</h2>
                <p class="text-center mb-4">Tổng số sản phẩm: <strong>${fn:length(products)}</strong></p>

                <c:choose>
                  <c:when test="${empty products}">
                    <div class="alert alert-warning text-center">Chưa có sản phẩm nào.</div>
                  </c:when>
                  <c:otherwise>
                    <div class="table-responsive">
                      <table class="product-table table table-striped table-hover">
                        <thead>
                          <tr>
                            <th>Product ID</th>
                            <th>Seller ID</th>
                            <th>Thumbnail</th>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th>Description</th>
                            <th>Status</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach var="p" items="${products}">
                            <tr>
                              <td>${p.productId}</td>
                              <td>${p.accountId}</td>
                              <td>
                                <img class="thumb"
                                     src="${pageContext.request.contextPath}/${p.thumbnailURL}"
                                     alt="${p.productName}"/>
                              </td>
                              <td>${p.productName}</td>
                              <td>${p.category.categoryName}</td>
                              <td>${p.description}</td>
                              <td>
                                <c:choose>
                                  <c:when test="${p.isDeleted == 1}">
                                    <span class="badge bg-danger">Active</span>
                                  </c:when>
                                  <c:otherwise>
                                    <span class="badge bg-success">Inactive</span>
                                  </c:otherwise>
                                </c:choose>
                              </td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </c:otherwise>
                </c:choose>

            </div>

        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/chart/chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/waypoints/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>


        <!-- Template Javascript -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>

</html>