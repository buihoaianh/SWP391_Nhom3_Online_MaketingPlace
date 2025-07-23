

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Customer in Level</title>
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
            .page-header {
                text-align: center;
                margin-top: 30px;
                margin-bottom: 10px;
            }

            .sub-header {
                text-align: center;
                font-size: 20px;
                color: #555;
                margin-bottom: 30px;
            }

            .empty-message {
                text-align: center;
                font-size: 18px;
                color: #888;
                margin-top: 20px;
            }

            .btn-back {
                display: block;
                margin: 30px auto;
            }

            .customer-table {
                max-width: 1000px;
                margin: auto;
                margin-top: 30px;
            }

            .customer-table th {
                background-color: #3396D8;
            }
            .level-box {
                background-color: #157347;
                border: none;
                border-radius: 10px;
                padding: 12px 20px;
                margin-bottom: 30px;
                max-width: 500px;
            }

            .level-title {
                margin: 0;
                font-size: 20px;
                font-weight: 600;
                color: white;
                text-align: left;
            }

            .clickable-row:hover {
                background-color: #e6f2ff;
            }

            .pagination .page-item.active .page-link {
                background-color: #157347;
                border-color: #157347;
                color: white;
            }

            .pagination .page-link {
                color: white;
                background-color: #3396D8;
                border: none;
                margin: 0 3px;
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
                <h1>Customer in Level</h1>

                <div class="level-box">
                    <h2 class="level-title">Customers in level: <strong>${memberName}</strong></h2>
                </div>


                <div class="table-responsive customer-table">
                    <table class="table table-striped">
                        <thead class="table-primary">
                            <tr>
                                <th>Customer ID</th>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Total Spent</th>
                                <th>Last Updated</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty customers}">
                                    <c:forEach var="c" items="${customers}">
                                        <tr class="clickable-row" data-href="${pageContext.request.contextPath}/admin/listMemberRanking/CustomerInLevel/CustomerLevelHistoryURL?customerID=${c.customerID}&memberID=${param.memberID}">
                                            <td>${c.customerID}</td>
                                            <td>${c.fullName}</td>
                                            <td>${c.email}</td>
                                            <td><fmt:formatNumber value="${c.totalSpent}" type="currency"/></td>
                                            <td><fmt:formatDate value="${c.lastUpdated}" pattern="dd/MM/yyyy"/></td>
                                        </tr>

                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="5" class="text-center text-muted">No have customers in this level.</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
                
                
                <c:if test="${totalPages > 1}">
                    <div class="text-center mt-4">
                        <nav class="d-inline-block">
                            <ul class="pagination justify-content-center">
                                <c:if test="${currentPage > 1}">
                                    <li class="page-item">
                                        <a class="page-link" style="color: white; background-color: #3396D8;"
                                           href="${pageContext.request.contextPath}/admin/listMember/CustomerMemberLevelController?memberID=${param.memberID}&page=${currentPage - 1}">
                                            &laquo; 
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a class="page-link ${i == currentPage ? '' : 'text-white'}"
                                           style="${i == currentPage ? 'background-color: #157347; border-color: #157347;' : 'background-color: #3396D8;'}"
                                           href="${pageContext.request.contextPath}/admin/listMember/CustomerMemberLevelController?memberID=${param.memberID}&page=${i}">
                                            ${i}
                                        </a>
                                    </li>
                                </c:forEach>

                                <c:if test="${currentPage < totalPages}">
                                    <li class="page-item">
                                        <a class="page-link" style="color: white; background-color: #3396D8;"
                                           href="${pageContext.request.contextPath}/admin/listMember/CustomerMemberLevelController?memberID=${param.memberID}&page=${currentPage + 1}">
                                            Next &raquo;
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </c:if>



                <div class="text-center mt-4">
                    <a href="${pageContext.request.contextPath}/admin/MemberURL" 
                       class="btn btn-secondary px-4 py-2" 
                       style="min-width: 200px;">
                        <i class="fas fa-arrow-left me-2"></i>  Back to Member List
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



