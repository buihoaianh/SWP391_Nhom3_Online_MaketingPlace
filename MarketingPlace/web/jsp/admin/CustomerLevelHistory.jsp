<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Customer Purchase History</title>
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

        <style>
            .level-box {
                background-color: #157347;
                color: white;
                border: none;
                border-radius: 10px;
                padding: 12px 24px;
                margin-bottom: 30px;
                width: fit-content;
                max-width: 100%;
                font-weight: 500;
                font-size: 20px;
            }

            .table-container {
                margin-top: 20px;
                background: white;
                border-radius: 12px;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0,0,0,0.05);
            }

            .table thead th {
                background-color: #3396D8;
                color: #fff;
                font-weight: 600;
                text-align: center;
                vertical-align: middle;
                white-space: nowrap;
            }

            .table tbody tr td {
                vertical-align: middle;
                font-size: 15px;
            }

            .table tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .text-muted {
                font-size: 16px;
                color: #888 !important;
                padding: 20px 0;
            }

            h1, h2 {
                font-weight: 600;
                margin-bottom: 20px;
            }

            .btn-secondary {
                background-color: #555;
                border-color: #555;
                padding: 10px 20px;
                border-radius: 8px;
            }

            .btn-secondary:hover {
                background-color: #333;
                border-color: #333;
            }

            .pagination .page-link {
                color: #3396D8;
            }

            .pagination .page-item.active .page-link {
                background-color: #3396D8;
                border-color: #3396D8;
                color: white;
            }

            .pagination .page-link:hover {
                background-color: #66b3e6;
                border-color: #3396D8;
                color: white;
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
                <h1>Customer Purchase History</h1>
                <div class="level-box">
                    Customer Purchase History: ${customerName}
                </div>

                <c:choose>
                    <c:when test="${not empty historyList}">
                        <div class="table-container">
                            <table class="table table-bordered text-center align-middle">
                                <thead class="bg-primary text-white">
                                    <tr>
                                        <th>CUSTOMER ID</th>
                                        <th>FULL NAME</th>
                                        <th>EMAIL</th>
                                        <th>TOTAL SPENT</th>
                                        <th>MEMBER LEVEL</th>
                                        <th>LAST UPDATED</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="info" items="${historyList}">
                                        <tr>
                                            <td>${info.customerID}</td>
                                            <td>${info.fullName}</td>
                                            <td>${info.email}</td>
                                            <td><fmt:formatNumber value="${info.totalSpent}" type="currency"/></td>
                                            <td>${info.memberName}</td>
                                            <td><fmt:formatDate value="${info.lastUpdated}" pattern="dd/MM/yyyy"/></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </c:when>
                    <c:otherwise>
                        <p class="text-center text-muted">No history available.</p>
                    </c:otherwise>
                </c:choose>

                <c:if test="${totalPages > 1}">
                    <div class="text-center mt-4">
                        <nav aria-label="Pagination">
                            <ul class="pagination justify-content-center">
                                <c:if test="${currentPage > 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="?customerID=${param.customerID}&memberID=${param.memberID}&page=${currentPage - 1}">« Prev</a>
                                    </li>
                                </c:if>

                                <c:forEach begin="1" end="${totalPages}" var="i">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="?customerID=${param.customerID}&memberID=${param.memberID}&page=${i}">${i}</a>
                                    </li>
                                </c:forEach>

                                <c:if test="${currentPage < totalPages}">
                                    <li class="page-item">
                                        <a class="page-link" href="?customerID=${param.customerID}&memberID=${param.memberID}&page=${currentPage + 1}">Next »</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </c:if>


                <div class="text-center mt-4 d-flex justify-content-center gap-3">
                    <a href="${pageContext.request.contextPath}/admin/listMember/CustomerMemberLevelController?memberID=${memberID}" 
                       class="btn btn-success">
                        <i class="fas fa-arrow-left me-2"></i> Back to Customer in Level
                    </a>



                    <a href="${pageContext.request.contextPath}/admin/MemberURL" class="btn btn-warning">
                        <i class="fas fa-arrow-left me-2"></i> Back to Member List
                    </a>
                </div>


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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">



        <!-- Template Javascript -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const rows = document.querySelectorAll(".clickable-row");
                rows.forEach(function (row) {
                    row.style.cursor = "pointer";
                    row.addEventListener("click", function () {
                        window.location.href = row.getAttribute("data-href");
                    });
                });
            });
        </script>

    </body>

</html>




