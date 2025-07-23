<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"    prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Danh sách sản phẩm</title>
  <!-- Bootstrap CSS -->
  <link href="${pageContext.request.contextPath}/asset/css/bootstrap.css" rel="stylesheet">
  <!-- Admin app CSS -->
  <link href="${pageContext.request.contextPath}/asset/css/app.css" rel="stylesheet">
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
  </style>
</head>
<body>


  <main>
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
  </main>

  <!-- Bootstrap JS + Admin JS -->
  <script src="${pageContext.request.contextPath}/asset/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
</body>
</html>
