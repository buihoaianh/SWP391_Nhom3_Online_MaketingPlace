<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Categories" %>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Categories</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 30px;
                background-color: #f9f9f9;
            }

            h1 {
                color: #007bff;
                text-align: left;
                margin-bottom: 10px;
                margin-top: 40px;
                font-size: 38px;
                font-weight: bold;
            }



            .controls {
                margin-bottom: 20px;
            }

            .controls form,
            .controls a {
                display: inline-block;
                margin-right: 10px;
            }

            input[type="text"] {
                padding: 6px 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 250px;
            }

            button {
                padding: 6px 12px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            button:hover {
                background-color: #0056b3;
            }

            .add-new a {
                background-color: #28a745;
                color: white;
                padding: 8px 16px;
                border-radius: 4px;
                text-decoration: none;
                font-weight: bold;
            }

            .add-new a:hover {
                background-color: #218838;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background-color: white;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            th, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: center;
            }

            th {
                background-color: #007bff;
                color: white;
                text-transform: uppercase;
            }

            img {
                border-radius: 8px;
                max-height: 80px;
            }

            .action-btn {
                background-color: #007bff;
                color: white;
                padding: 6px 12px;
                border: none;
                border-radius: 4px;
                text-decoration: none;
            }

            .action-btn:hover {
                background-color: #0056b3;
            }

            tbody tr:hover {
                transform: scale(1.02);
                background-color: #f1f9ff;
                transition: all 0.2s ease-in-out;
                box-shadow: 0 2px 8px rgba(0, 123, 255, 0.15);
                cursor: pointer;
            }
            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding-left: 60px;
                padding-right: 60px;
                padding-top: 5px;
                background-color: white;
                box-shadow: 0 0 10px rgba(0,0,0,0.05);
                border-radius: 6px;
            }

            .main-layout {
                display: flex;
                min-height: 100vh;
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
<div class="main-layout">
<jsp:include page="slider.jsp" />
<div class="container">
    <h1>List Categories</h1>
    <div class="controls">
        <form action="CategoriesURL" method="get">
            <input type="hidden" name="service" value="searchCategory"/>
            <input type="text" name="keyword" value="${searchKeyword}" placeholder="Search by name or ID..." required />
            <button type="submit">Search</button>
        </form>

        <form action="CategoriesURL" method="get">
            <input type="hidden" name="service" value="listCategories"/>
            <button type="submit">View All</button>
        </form>
    </div>

    <div class="add-new" style="margin: 10px 0;">
        <a href="CategoriesURL?service=insertForm">Add New Category</a>
    </div>


    <table>
        <thead>
            <tr>
                <th>Image</th>
                <th>Category ID</th>
                <th>Category Name</th>
                <th>Description</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
<c:forEach var="category" items="${categoryData}">
    <tr>
        <td><img src="${category.imageURL}" width="100"/></td>
        <td>${category.categoryID}</td>
        <td>${category.categoryName}</td>
        <td>${category.description}</td>
        <td>
            <a class="action-btn" href="CategoriesURL?service=updateForm&id=${category.categoryID}">Update</a>
        </td>
        <td>
            <a class="action-btn" href="CategoriesURL?service=deleteCategory&id=${category.categoryID}" onclick="return confirm('Bạn có chắc chắn muốn xóa không ?')">Delete</a>
        </td>
    </tr>
</c:forEach>
</tbody>

</table>
</div>
</div>
</div>
</body>
</html>-->
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
        <style>
            h1 {
                color: #0d6efd;
                font-size: 2.25rem;
                font-weight: 700;
                margin-bottom: 1.5rem;
            }

            .controls {
                margin-bottom: 1.25rem;
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
            }

            .controls input[type="text"] {
                padding: 0.5rem 0.75rem;
                border: 1px solid #ced4da;
                border-radius: 4px;
                width: 260px;
            }

            .controls button {
                padding: 0.5rem 1rem;
                background-color: #0d6efd;
                color: #fff;
                border: none;
                border-radius: 4px;
                transition: background-color 0.2s ease-in-out;
            }

            .controls button:hover {
                background-color: #0b5ed7;
            }

            .add-new {
                margin: 1rem 0;
            }

            .add-new a {
                display: inline-block;
                background-color: #198754;
                color: white;
                padding: 0.5rem 1rem;
                border-radius: 4px;
                font-weight: 600;
                text-decoration: none;
                transition: background-color 0.2s ease;
            }

            .add-new a:hover {
                background-color: #157347;
            }

            table {
                width: 100%;
                background-color: white;
                border-collapse: collapse;
                border-radius: 6px;
                overflow: hidden;
                box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            }

            th, td {
                padding: 0.75rem 1rem;
                text-align: center;
                border-bottom: 1px solid #dee2e6;
            }

            th {
                background-color: #0d6efd;
                color: white;
                text-transform: uppercase;
                font-size: 0.9rem;
                letter-spacing: 0.05em;
            }

            tr:last-child td {
                border-bottom: none;
            }

            tbody tr:hover {
                background-color: #f1f9ff;
                cursor: pointer;
                transition: 0.2s ease;
            }

            .action-btn {
                display: inline-block;
                padding: 0.4rem 0.75rem;
                font-size: 0.875rem;
                font-weight: 500;
                color: #fff;
                background-color: #0d6efd;
                border-radius: 4px;
                text-decoration: none;
                transition: background-color 0.2s ease;
            }

            .action-btn:hover {
                background-color: #0b5ed7;
            }

            img {
                max-height: 80px;
                border-radius: 6px;
                object-fit: cover;
            }

            @media (max-width: 768px) {
                .controls {
                    flex-direction: column;
                }

                .controls form {
                    width: 100%;
                }

                .controls input[type="text"] {
                    width: 100%;
                }

                table th, table td {
                    font-size: 0.875rem;
                    padding: 0.5rem;
                }
            }

            .main-content-card {
                background-color: #fff;
                border: 1px solid #dee2e6;
                border-radius: 10px;
                padding: 30px 40px;
                box-shadow: 0 0 20px rgba(0,0,0,0.05);
                animation: fadeIn 0.6s ease-in-out;
            }

            /* Hiệu ứng fade-in khi vào trang */
            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(15px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .animate-fade-in {
                animation: fadeIn 0.5s ease;
            }

            .pagination a, .pagination span {
                display: inline-block;
                padding: 6px 12px;
                border: 1px solid #007bff;
                border-radius: 4px;
                margin: 0 4px;
                text-decoration: none;
                color: #007bff;
                font-weight: 500;
                transition: background-color 0.2s ease;
            }

            .pagination a:hover {
                background-color: #007bff;
                color: white;
            }

            .pagination span {
                background-color: #007bff;
                color: white;
            }

            .pagination-wrapper {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }

            .pagination .page {
                display: inline-block;
                margin: 0 4px;
                padding: 6px 12px;
                border-radius: 6px;
                border: 1px solid #007bff;
                color: #007bff;
                text-decoration: none;
                transition: 0.2s ease;
                font-weight: 500;
            }

            .pagination .page:hover {
                background-color: #007bff;
                color: white;
            }

            .pagination .current {
                background-color: #007bff;
                color: white;
                pointer-events: none;
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
                <div class="main-content-card animate-fade-in">
                    <h1>List Categories</h1>

                    <div class="controls">
                        <form action="CategoriesURL" method="get">
                            <input type="hidden" name="service" value="searchCategory"/>
                            <input type="text" name="keyword" value="${searchKeyword}" placeholder="Search by name or ID..." required />
                            <button type="submit">Search</button>
                        </form>

                        <form action="CategoriesURL" method="get">
                            <input type="hidden" name="service" value="listCategories"/>
                            <button type="submit">View All</button>
                        </form>
                    </div>

                    <div class="add-new" style="margin: 10px 0;">
                        <a href="CategoriesURL?service=insertForm">Add New Category</a>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th>Image</th>
                                <th>Category ID</th>
                                <th>Category Name</th>
                                <th>Description</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="category" items="${categoryData}">
                                <tr>
                                    <td><img src="${category.imageURL}" width="100"/></td>
                                    <td>${category.categoryID}</td>
                                    <td>${category.categoryName}</td>
                                    <td>${category.description}</td>
                                    <td>
                                        <a class="action-btn" href="CategoriesURL?service=updateForm&id=${category.categoryID}">Update</a>
                                    </td>
                                    <td>
                                        <a class="action-btn" href="CategoriesURL?service=deleteCategory&id=${category.categoryID}" onclick="return confirm('Bạn có chắc chắn muốn xóa không ?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- Phân trang -->
                    <div class="pagination-wrapper mt-4">
                        <c:if test="${totalPages >= 1}">
                            <div class="pagination">
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <c:choose>
                                        <c:when test="${i == currentPage}">
                                            <span class="page current">${i}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="CategoriesURL?service=listCategories&page=${i}" class="page">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
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