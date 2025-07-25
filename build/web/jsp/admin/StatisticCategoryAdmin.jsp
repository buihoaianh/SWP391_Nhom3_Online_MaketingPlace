<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product Report by Category</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="container mt-4">
        <h3 class="mb-4 text-primary">Product Report Sorted by Category Product Count</h3>

        <table class="table table-bordered table-hover">
            <thead class="table-light">
                <tr>
                    <th>#</th>
                    <th>Product ID</th>
                    <th>Image</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Category</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${reportList}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${item.productID}</td>
                        <td><img src="${pageContext.request.contextPath}/${item.thumbnailURL}" width="60" /></td>
                        <td>${item.productName}</td>
                        <td>${item.description}</td>
                        <td>${item.categoryName}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
