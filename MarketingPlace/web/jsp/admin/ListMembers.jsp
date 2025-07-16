<%-- 
    Document   : ListMember
    Created on : Jul 15, 2025, 3:44:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>List Member Ranking</title>
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
            .table thead.table-dark {
                background-color: #3396D8 !important;
                color: white !important;
            }
            .custom-table thead tr {
                background: linear-gradient(90deg, #2980b9, #3498db);
                color: white;
                font-weight: bold;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }

            .custom-table thead th {
                padding: 14px 10px;
                border: none;
                font-size: 15px;
                text-transform: uppercase;
            }

            .custom-table tbody tr:hover {
                background-color: #f0f8ff;
            }

            .custom-table thead th {
                white-space: nowrap;
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
                <h1>List Member Ranking</h1>

                <form class="d-flex mb-3" action="${pageContext.request.contextPath}/admin/MemberURL" method="get">
                    <input type="hidden" name="service" value="searchMember" />
                    <input type="text" name="keyword" placeholder="Search by Name..." class="form-control me-2" style="max-width: 300px;">
                    <button type="submit" class="btn btn-primary me-2">Search</button>
                    <a href="${pageContext.request.contextPath}/admin/MemberURL" class="btn btn-secondary">View All</a>
                </form>

                <div class="mb-3">
                    <a href="MemberURL?service=insertForm" class="btn btn-success">Add New Member</a>
                </div>

                <table class="table table-hover table-bordered text-center align-middle custom-table">
                    <thead style="background-color: #3396D8; color: white;">
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">Image</th>
                            <th class="text-center">Name</th>
                            <th class="text-center">Min Point</th>
                            <th class="text-center">Max Point</th>
                            <th class="text-center">Description</th>
                            <th class="text-center">Update</th>
                            <th class="text-center">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="member" items="${memberData}">
                            <tr>
                                <td>${member.memberID}</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/${member.imageURL}" width="60" height="60" style="object-fit: cover;"/>
                                </td>
                                <td>${member.memberName}</td>
                                <td>${member.minPoint}</td>
                                <td>${member.maxPoint}</td>
                                <td>${member.description}</td>
                                <td>
                                    <a href="MemberURL?service=updateForm&id=${member.memberID}" class="btn btn-warning btn-sm" style="background-color: #3396D8; color: white;">Update</a>
                                </td>

                                <td>
                                    <a href="MemberURL?service=deleteMember&id=${member.memberID}" class="btn btn-danger btn-sm" style="background-color: #3396D8; color: white;" onclick="return confirm('Are you sure you want to delete this member?');">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty memberData}">
                            <tr>
                                <td colspan="7" class="text-center text-muted">No members found.</td>
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


