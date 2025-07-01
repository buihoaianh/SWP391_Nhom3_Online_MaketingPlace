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
            <%@ include file="../../components/sidebarAdmin.jsp" %>

            <!-- Main Content: Seller Profile Card -->
            <div class="content py-4 px-5">
                <div class="card mx-auto" style="max-width: 900px;">
                    <div class="card-header bg-primary text-white">
                        <h3 class="mb-0">Seller Request Profile</h3>
                    </div>
                    <div class="card-body px-4">
                        <c:if test="${not empty u}">
                            <div class="row">
                                <div class="col-md-4 text-center">
                                    <c:choose>
                                        <c:when test="${not empty u.imageURL}">
                                            <img src="${u.imageURL}"
                                                 alt="Avatar"
                                                 class="mb-3"
                                                 style="width: 230px;
                                                 height: 280px;
                                                 object-fit: cover;
                                                 border-radius: 12px;
                                                 border: 2px solid #ddd;">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${u.imageURL}"
                                                 alt="Avatar"
                                                 class="mb-3"
                                                 style="width: 230px;
                                                 height: 280px;
                                                 object-fit: cover;
                                                 border-radius: 12px;
                                                 border: 2px solid #ddd;">
                                        </c:otherwise>
                                    </c:choose>

                                    <h3 class="card-title mb-1" style="font-size: 1.5rem;">
                                        ${u.fullName}
                                    </h3>
                                    <p class="text-secondary mb-3" style="font-size: 1.1rem;">
                                        Account ID: ${u.accountID}
                                    </p>

                                </div>

                                <div class="col-md-8">
                                    <table class="table table-borderless">
                                        <tbody>
                                            <tr>
                                                <th class="w-25">Role ID</th>
                                                <td>${u.roleID}</td>
                                            </tr>
                                            <tr>
                                                <th>Email</th>
                                                <td>${u.email}</td>
                                            </tr>
                                            <tr>
                                                <th>Phone Number</th>
                                                <td>${u.phoneNumber}</td>
                                            </tr>
                                            <tr>
                                                <th>Address</th>
                                                <td>${u.address}</td>
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
                                                        <c:when test="${u.status}">
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
                                                <td>${u.description}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!-- ✅ Chỉ hiển thị nút Approve nếu trạng thái là Pending -->
                                    <c:if test="${r.status eq 'Pending'}">
                                        <a href="${pageContext.request.contextPath}/admin/request/update?action=approve&id=${r.requestId}"
                                           class="btn btn-success btn-sm">
                                            Approve
                                        </a>
                                    </c:if>

                                    <!-- ✅ Luôn hiển thị nút Reject trừ khi đã bị Reject rồi -->
                                    <c:if test="${r.status ne 'Reject'}">
                                        <a href="#" onclick="openRejectModal(${r.requestId})"
                                           class="btn btn-danger btn-sm">
                                            Reject
                                        </a>
                                    </c:if>

                                    <a href="${pageContext.request.contextPath}/admin/requests"
                                       class="btn btn-secondary btn-sm">
                                        ← Back to List
                                    </a>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${empty u}">
                            <div class="alert alert-danger">Not find seller's information</div>

                            <a href="${pageContext.request.contextPath}/admin/requests"
                               class="btn btn-secondary btn-sm">
                                ← Back to List
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <!-- Dialog modal -->
        <div id="rejectModal" style="display:none; position:fixed; top:30%; left:40%; background:white; border:1px solid #ccc; padding:20px;">
            <form action="${pageContext.request.contextPath}/admin/request/update" method="post">
                <input type="hidden" id="modalRequestID" name="id" value="${r.requestId}">
                <input type="hidden" name="action" value="reject">
                <label class="form-label">Reject Reason:</label><br>
                <textarea name="reason" class="form-control" required rows="5"></textarea><br><br>
                <div style="text-align: center">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-secondary" onclick="closeModal()">Cancel</button>
                </div>
            </form>
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
        <script>
            function openRejectModal(requestID) {
                document.getElementById('modalRequestID').value = requestID;
                document.getElementById('rejectModal').style.display = 'block';
            }

            function closeModal() {
                document.getElementById('rejectModal').style.display = 'none';
            }
        </script>
    </body>
</html>

