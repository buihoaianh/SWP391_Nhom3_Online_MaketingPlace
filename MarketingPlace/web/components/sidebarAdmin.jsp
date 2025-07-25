<%-- 
    Document   : sidebarAdmin
    Created on : Jun 3, 2025, 8:09:41 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Sidebar Start -->
<div class="sidebar bg-light text-dark pe-4 pb-3">
    <nav class="navbar bg-light navbar-light text-dark">
        <a href="${pageContext.request.contextPath}/admin" class="navbar-brand mx-4 mb-3">
            <h3 class="text-primary">Online Store</h3>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4">
            <div class="position-relative">
                <img class="rounded-circle" src="img/Anhdaidien.jpg" alt="" style="width: 40px; height: 40px;">
                <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
            </div>
            <div class="ms-3">
                <h6 class="mb-0">Online Store</h6>
                <span>Admin</span>
            </div>
        </div>
        <div class="navbar-nav w-100 text-dark">
            <a href="${pageContext.request.contextPath}/admin"
               class="nav-item nav-link text-dark
               ${pageContext.request.requestURI.endsWith("/admin") ? "active" : ""}">
                <i class="fas fa-home text-dark"></i>Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/admin/list-seller" class="nav-link text-dark">
                <i class="fas fa-store text-dark"></i> List Seller
            </a>
            <a href="${pageContext.request.contextPath}/getListCustomer" class="nav-link text-dark">
                <i class="fas fa-users text-dark"></i> List Customer
            </a>
            <a href="${pageContext.request.contextPath}/admin/requests"  class="nav-link text-dark">
                <i class="fas fa-box text-dark"></i> List Request
            </a>
            <a href="${pageContext.request.contextPath}/admin/products" class="nav-link text-dark">
                <i class="fas fa-box text-dark"></i> List Product
            </a>
            <a href="${pageContext.request.contextPath}/admin/MemberURL" class="nav-link text-dark">
                <i class="fas fa-medal text-dark"></i> List Member Ranking
            </a>
<!--            <a href="${pageContext.request.contextPath}/jsp/admin/Statistic.jsp" class="nav-link text-dark">
                <i class="fas fa-chart-line text-dark"></i> Statistic
            </a>-->

        </div>
    </nav>
</div>
<!-- Sidebar End -->
