<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Seller Profile</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts, Font Awesome, Bootstrap Icons -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Bootstrap CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/list-seller.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100
                 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <!-- Include Navbar/sidebar -->
            <%@include file="../../components/NavbarAdmin.jsp" %>

            <!-- Main Content: Seller Profile Card -->
            <div class="content py-4 px-5">
                <div class="card mx-auto" style="max-width: 900px;">
                    <div class="card-header bg-primary text-white">
                        <h3 class="mb-0">Seller Profile</h3>
                    </div>
                    <div class="card-body px-4">
                        <c:if test="${not empty sellerDetail}">
                            <div class="row">
                                <div class="col-md-4 text-center">
                                    <c:choose>
                                        <c:when test="${not empty sellerDetail.imageURL}">
                                            <img src="${sellerDetail.imageURL}"
                                                 alt="Avatar"
                                                 class="rounded-circle mb-3"
                                                 style="width: 220px; height: 220px; object-fit: cover;">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${sellerDetail.imageURL}"
                                                 alt="Avatar"
                                                 class="rounded-circle mb-3"
                                                 style="width: 220px; height: 220px; object-fit: cover;">
                                        </c:otherwise>
                                    </c:choose>

                                    <h3 class="card-title mb-1" style="font-size: 1.5rem;">
                                        ${sellerDetail.fullName}
                                    </h3>
                                    <p class="text-secondary mb-3" style="font-size: 1.1rem;">
                                        Account ID: ${sellerDetail.accountID}
                                    </p>

                                </div>

                                <div class="col-md-8">
                                    <table class="table table-borderless">
                                        <tbody>
                                            <tr>
                                                <th class="w-25">Role ID</th>
                                                <td>${sellerDetail.roleID}</td>
                                            </tr>
                                            <tr>
                                                <th>Email</th>
                                                <td>${sellerDetail.email}</td>
                                            </tr>
                                            <tr>
                                                <th>Phone Number</th>
                                                <td>${sellerDetail.phoneNumber}</td>
                                            </tr>
                                            <tr>
                                                <th>Address</th>
                                                <td>${sellerDetail.address}</td>
                                            </tr>
                                            <tr>
                                                <th>Create Date</th>
                                                <td>
                                                    ${createDateAsDate}
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Status</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${sellerDetail.status}">
                                                            <span class="badge bg-success">Active</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-secondary">Inactive</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Description</th>
                                                <td>${sellerDetail.description}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <a href="${pageContext.request.contextPath}/admin/list-seller"
                                       class="btn btn-secondary btn-sm mt-3">
                                        ← Back to List
                                    </a>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${empty sellerDetail}">
                            <div class="alert alert-danger">Không tìm thấy thông tin Seller.</div>
                            <a href="${pageContext.request.contextPath}/admin/list-seller"
                               class="btn btn-secondary btn-sm">
                                ← Back to List
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/chart/chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/waypoints/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        <!-- Template Javascript -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>
</html>
