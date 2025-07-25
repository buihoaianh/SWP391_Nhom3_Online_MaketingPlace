

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Categories</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/iconly/bold.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/app.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/asset/images/favicon.svg" type="image/x-icon">
 
        <link href="img/favicon.ico" rel="icon">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">


        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">


        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/list-seller.css" rel="stylesheet">
        <style>
  /* Toàn trang */
  body {
    background-color: #f5f7fa;
    font-family: 'Nunito', sans-serif;
  }

  /* Wrapper chính */
  .main-content-card {
    text-align: center;
    background: #fff;
    border-radius: 8px;
    padding: 30px;
    margin: 20px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
  }

  /* Tiêu đề */
  h1 {
    font-size: 28px;
    font-weight: 700;
    color: #2c3e50;
    margin-bottom: 25px;
  }

  /* Thanh công cụ Search + Create */
  .main-content-card > div[style*="display: flex"] {
    display: flex !important;
    justify-content: space-between !important;
    align-items: center !important;
    margin-bottom: 20px !important;
    flex-wrap: wrap;
    gap: 10px;
  }
  .main-content-card form {
    display: flex !important;
    align-items: center !important;
    gap: 8px;
  }
  .main-content-card input[type="text"] {
    height: 36px !important;
    padding: 0 10px !important;
    border-radius: 5px !important;
    border: 1px solid #ccc !important;
    width: 200px;
  }
  .main-content-card .btn-sm {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 5px 10px;
    border-radius: 4px;
  }

  /* Bảng */
  table {
    width: 100%;
    border-collapse: collapse;
    background: #fff;
    border-radius: 6px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,0.03);
  }
  thead {
    background-color: #f1f3f5;
  }
  th, td {
    padding: 12px 15px;
    text-align: center;
    border-bottom: 1px solid #e0e0e0;
    font-size: 14px;
    vertical-align: middle;
  }
  th {
    font-weight: 600;
    color: #455a64;
  }
  tr:hover {
    background-color: #fafbfd;
  }

  /* Ảnh thumbnail */
  img {
    border-radius: 4px;
    max-width: 60px;
    height: auto;
  }

  /* Button chung */
  .btn {
    font-size: 14px;
    font-weight: 500;
  }
  .btn-primary {
    background-color: #4a8af4;
    border-color: #4a8af4;
  }
  .btn-warning {
    background-color: #ffc107;
    border-color: #ffc107;
    color: #212529;
  }
  .btn-success {
    background-color: #198754;
    border-color: #198754;
  }
  .btn-danger {
    background-color: #dc3545;
    border-color: #dc3545;
  }
  .btn:hover {
    opacity: 0.9;
  }
</style>

    </head>

    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="logo d-flex align-items-center">
                        <a href="seller-dashboard">
                            <img src="${pageContext.request.contextPath}/asset/images/logo/logo.png"
                                 alt="Logo"
                                 style="max-width: 180px; height: auto;">
                        </a>
                    </div>
                    <jsp:include page="slider.jsp" />
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>
<<<<<<< Updated upstream
            <div id="main">
                <div class="main-content-card animate-fade-in">
                    <h1>List Product</h1>
=======
            <!-- Spinner End -->


           

            <div class="content">
                <h1>List Product1</h1>
>>>>>>> Stashed changes
                <div style="display: flex; justify-content: flex-end; align-items: center; gap: 10px; margin-bottom: 10px;">

                    <form action="${pageContext.request.contextPath}/seller/products" method="post" style="display: flex; align-items: center;">
                        <label for="category" style="margin-right: 5px;">Search:</label>
                        <input type="text" name="category" id="category" value="${param.category}" placeholder="Tìm danh mục..." style="height: 36px; padding: 0 10px;"/>
                        <button type="submit" class="btn btn-primary btn-sm" style="margin-left: 5px;">
                            <i class="fas fa-search"></i>
                        </button>

                        <a href="${pageContext.request.contextPath}/seller/products" class="btn btn-warning btn-sm" style="margin-left: 5px;" title="Clear">
                            <i class="fas fa-backspace"></i>
                        </a>
                    </form>


                    <a href="${pageContext.request.contextPath}/seller/create-product" class="btn btn-success" style="height: 40px;">Create Product</a>
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">
                          ${errorMessage}
                        </div>
                    </c:if>
                </div>

                <table border="1">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Category</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Description</th>
                            <th>Status</th>
                            <th>Action</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
 
                        <c:forEach items="${products}" var="po">
                            <tr>
                                <td>${po.productId}</td>
                                <td>${po.category.categoryName}</td>
                                <td>${po.productName}</td>
                                <td><img src="${pageContext.request.contextPath}/${po.thumbnailURL}" width="50px" alt="alt"/></td>
                                <td>${po.description}</td> 
                                <td>${po.status}</td>
                                <td><a href="${pageContext.request.contextPath}/seller/edit-product?id=${po.productId}" class="btn btn-primary">
                                        <i class="fa fa-edit"></i>
                                    </a></td>
                                <td>
                                <form action="${pageContext.request.contextPath}/seller/delete-product" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${po.productId}"/>
                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Confirm to delete product!')">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                </form>
                                </td>

                                    
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

                </div>
            </div>

            <script src="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/vendors/apexcharts/apexcharts.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/pages/dashboard.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
             JavaScript Libraries 
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

         Template Javascript 
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
                            <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <c:if test="${message != null}">
            <script type="text/javascript">
                toastr.success(`${message}`, 'Success', {timeOut: 1000});
                console.log("sucess");
            </script>
        </c:if>
        <c:if test="${errorMessage != null}">
            <script type="text/javascript">
        toastr.error(`${errorMessage}`, 'Error', {timeOut: 2000});
            </script>
        </c:if>
    </body>

</html>