<%-- 
    Document   : ListBrand
    Created on : May 24, 2025, 11:22:14 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>JSP Page</title>
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
        <%
            ResultSet rsCus = (ResultSet) request.getAttribute("rsCus");
            int totalPage = (int) request.getAttribute("totalPage");
            int currentPage = (int) request.getAttribute("currentPage");
        %>
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
                <h1>List Customer</h1>
                <table>
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Ảnh</th>
                            <th>Tên</th>
                            <th>Email</th>
                            <th>Số điện thoại</th>
                            <th>Địa chỉ</th>
                            <th>Ngày đăng ký</th>
                            <th>Chức năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%if (rsCus.isBeforeFirst()) {
                             int index = 0;
                             while (rsCus.next()) {
                               index++;
                        %>
                        <tr>
                            <th><%=index%></th>
                            <th>
                                <img src="<%=rsCus.getString("ImageURL")%>" alt="" style="width: 40px; height: 40px"/>
                            </th>
                            <td><%=rsCus.getString("FullName")%></td>
                            <td><%=rsCus.getString("Email")%></td>
                            <td><%=rsCus.getString("PhoneNumber")%></td>
                            <td><%=rsCus.getString("Address")%></td>
                            <td><%=rsCus.getDate("CreateDate")%></td>
                            <td>
                                <div class="d-flex justify-content-center align-items-center gap-4">
                                    <a href="getDetailCustomer?customerId=<%=rsCus.getInt("AccountID")%>">
                                        <i class="fa-regular fa-eye"></i>
                                    </a>
                                    <div class="form-check form-switch">
                                        <input 
                                            onchange="showConfirmModal(this, <%=rsCus.getInt("AccountID")%>, <%=rsCus.getBoolean("Status")%>)"
                                            class="form-check-input" 
                                            type="checkbox" 
                                            role="switch" 
                                            id="switchCheckChecked" 
                                            <%=rsCus.getBoolean("Status") ? "checked" : ""%>
                                            >
                                    </div>
                                </div>
                            </td>
                            <%}
                                    } else {%>
                        <tr>
                            <td colspan="3">
                                <div class="text-center">Không có dữ liệu</div>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <!-- Modal -->
                <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="confirmModalLabel">Confirm change active status</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Are you sure you want to change the active status of this account?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" onclick="confirmChangeStatus()">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
        <!-- Template Javascript -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script>
                                    let selectedCustomerId = null;
                                    let selectedStatus = null;

                                    function showConfirmModal(e, customerId, status) {
                                        e.checked = status;
                                        selectedCustomerId = customerId;
                                        selectedStatus = status;
                                        $('#confirmModal').modal('show');
                                    }

                                    function confirmChangeStatus() {
                                        const newStatus = !selectedStatus;
                                        window.location.href = "changeActiveStatus?customerId=" + selectedCustomerId + "&status=" + newStatus;
                                    }
        </script>
    </body>
</html>
