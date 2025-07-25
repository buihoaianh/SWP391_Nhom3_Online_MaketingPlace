<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Customer by Seller</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/iconly/bold.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/app.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/asset/images/favicon.svg" type="image/x-icon">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .search-box {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                margin-bottom: 20px;
            }

            .search-box input {
                flex-grow: 1;
                max-width: 300px;
            }

            .btn-status {
                min-width: 100px;
            }

            .table th, .table td {
                vertical-align: middle;
            }

            h2.title {
                background-color: #435EBE;
                color: white;
                padding: 15px 30px;
                border-radius: 10px;
                margin: 0 auto 25px auto;
                max-width: 400px;
                text-align: center;
                font-weight: bold;
            }

            .pagination {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin-top: 20px;
            }
            .pagination .btn {
                padding: 10px 20px;
                text-decoration: none;
                color: white;
            }
            .pagination .btn.active {
                background-color: #007bff;
                border-color: #007bff;
            }


        </style>
    </head>

    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="logo d-flex align-items-center">
                        <a href="saller-dashboard">
                            <img src="${pageContext.request.contextPath}/asset/images/logo/logo.png"
                                 alt="Logo"
                                 style="max-width: 180px; height: auto;">
                        </a>
                    </div>
                    <jsp:include page="slider.jsp" />
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>
            <div id="main">
                <h2 class="text-center title">List Customer</h2>
                <form class="search-box justify-content-center" action="${pageContext.request.contextPath}/seller/list-customer" method="get">
                    <input type="text" name="keyword" placeholder="Search by ID or Name..." class="form-control"/>

                    <button type="submit" class="btn btn-primary">Search</button>
                    <a href="${pageContext.request.contextPath}/seller/list-customer" class="btn btn-secondary">View All</a>
                </form>

                <form class="search-box justify-content-center" action="${pageContext.request.contextPath}/seller/list-customer" method="get">
                    <select name="level" class="form-control" onchange="this.form.submit()">
                        <option value="">All Levels</option>
                        <option value="Silver Level Customers" ${levelFilter == 'Silver Level Customers' ? 'selected' : ''}>Silver Level</option>
                        <option value="Gold Level Customers" ${levelFilter == 'Gold Level Customers' ? 'selected' : ''}>Gold Level</option>
                        <option value="Diamond Level Customer" ${levelFilter == 'Diamond Level Customer' ? 'selected' : ''}>Diamond Level</option>
                        <option value="Bronze Level Customers" ${levelFilter == 'Bronze Level Customers' ? 'selected' : ''}>Bronze Level</option>
                    </select>
                </form>

                <c:if test="${not empty sessionScope.statusMessage}">
                    <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
                        ${sessionScope.statusMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <c:remove var="statusMessage" scope="session"/>
                </c:if>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover bg-white shadow-sm">
                        <thead class="table-primary text-center">
                            <tr>
                                <th>STT</th>
                                <th>ACCOUNT ID</th>
                                <th>FULLNAME</th>
                                <th>STATUS</th>
                                <th>DESCRIPTION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="customer" items="${customerList}" varStatus="loop">
                                <tr>
                                    <td class="text-center">${loop.count}</td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/seller/list-customer-detail?id=${customer.accountID}" class="text-decoration-none">
                                            ${customer.accountID}
                                        </a>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/seller/list-customer-detail?id=${customer.accountID}" class="text-decoration-none">
                                            ${customer.fullName}
                                        </a>
                                    </td>
                                    <td class="text-center">
                                        <span class="badge
                                              <c:choose>
                                                  <c:when test="${customer.status}">bg-success</c:when>
                                                  <c:otherwise>bg-secondary</c:otherwise>
                                              </c:choose>">
                                            <c:choose>
                                                <c:when test="${customer.status}">Active</c:when>
                                                <c:otherwise>Inactive</c:otherwise>
                                            </c:choose>
                                    </td>
                                    <td>${customer.description}</td>
                                </tr>
                            </c:forEach>

                            <c:if test="${empty customerList}">
                                <tr>
                                    <td colspan="5" class="text-center">No found Customer</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>

                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="?page=${currentPage - 1}" class="btn btn-primary">Previous</a>
                    </c:if>

                    <c:forEach var="i" begin="1" end="${totalPages}" varStatus="status">
                        <c:choose>
                            <c:when test="${i == currentPage}">
                                <a href="?page=${i}" class="btn btn-primary active">${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="?page=${i}" class="btn btn-primary">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${currentPage < totalPages}">
                        <a href="?page=${currentPage + 1}" class="btn btn-primary">Next</a>
                    </c:if>
                </div>

            </div>
        </div>
        <script src="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/vendors/apexcharts/apexcharts.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/pages/dashboard.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
    </body>

</html>