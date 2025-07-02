<%-- 
    Document   : Dashboard
    Created on : May 27, 2025, 9:25:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>List Seller</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
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
                <h1>List Seller</h1>
                <form class="d-flex mb-3" action="${pageContext.request.contextPath}/admin/list-seller" method="get">
                    <input type="text" name="keyword" placeholder="Search by ID or Name..." class="form-control me-2" style="max-width: 300px;">
                    <button type="submit" class="btn btn-primary me-2">Search</button>
                    <a href="${pageContext.request.contextPath}/admin/list-seller" class="btn btn-secondary">View All</a>
                </form>

                <c:if test="${not empty sessionScope.statusMessage}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${sessionScope.statusMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <c:remove var="statusMessage" scope="session" />
                </c:if>



                <table border="1">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Account ID</th>
                            <th>Role ID</th>
                            <th>FullName</th>
                            <th>Status</th>
                            <th>Description</th>
                            <th>Change Status</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="seller" items="${sellerList}" varStatus="stt">
                            <tr>
                                <!-- STT (bắt đầu từ 1) -->
                                <td>${stt.count}</td>

                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/list-seller-detail?id=${seller.accountID}">
                                        ${seller.accountID}
                                    </a>
                                </td>
                                <td>${seller.roleID}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/list-seller-detail?id=${seller.accountID}">
                                        ${seller.fullName}
                                    </a>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${seller.status}">Active</c:when>
                                        <c:otherwise> Inactive </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>${seller.description}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/admin/list-seller/change-seller-status" method="post" style="display:inline;">
                                        <input type="hidden" name="accountId" value="${seller.accountID}" />
                                        <button type="submit" class="btn btn-sm
                                                <c:choose>
                                                    <c:when test="${seller.status}">btn-danger</c:when>
                                                    <c:otherwise>btn-success</c:otherwise>
                                                </c:choose>">
                                            <c:choose>
                                                <c:when test="${seller.status}">Inactive</c:when>
                                                <c:otherwise>Active</c:otherwise>
                                            </c:choose>
                                        </button>
                                    </form>
                                </td>

                            </tr>
                        </c:forEach>
                        <c:if test="${empty sellerList}">
                            <tr>
                                <td colspan="6" class="text-center">No found Seller </td>
                            </tr>
                        </c:if>
                    </tbody>

                </table>

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