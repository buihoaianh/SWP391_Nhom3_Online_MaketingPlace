<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    .sidebar {
        background-color: #f8f9fa;
        min-height: 100vh;
        padding-top: 20px;
    }

    .sidebar .nav-link {
        background-color: #60a5fa;
        border-radius: 18px;
        margin-bottom: 12px;
        padding: 12px 20px;
        transition: all 0.3s ease;
        color: #fff !important;
        font-weight: 600;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    }

    .sidebar .nav-link i {
        color: #fff !important;
    }

    .sidebar .nav-link:hover {
        background-color: #3b82f6;
        color: #fff !important;
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.2);
    }

    .sidebar .nav-link.active {
        background-color: #2563eb;
        color: #fff !important;
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.25);
    }
</style>

<div class="sidebar bg-light text-dark pe-4 pb-3" style="width: 280px;">
    <nav class="navbar navbar-light text-dark">
        <a href="${pageContext.request.contextPath}/admin" class="navbar-brand mx-4 mb-3">
            <h3 class="text-primary">e Store</h3>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4">
            <div class="position-relative">
                <img class="rounded-circle" src="${pageContext.request.contextPath}/img/Anhdaidien.jpg" alt="" style="width: 40px; height: 40px;">
                <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
            </div>
            <div class="ms-3">
                <h6 class="mb-0">Online Store</h6>
                <span>Admin</span>
            </div>
        </div>
        <div class="navbar-nav w-100 text-dark">
            <a href="${pageContext.request.contextPath}/admin"
               class="nav-item nav-link text-dark ${pageContext.request.requestURI.endsWith('/admin') ? 'active' : ''}">
                <i class="fas fa-home text-dark"></i> Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/admin/list-seller" class="nav-link text-dark">
                <i class="fas fa-store text-dark"></i> List Seller
            </a>
            <a href="${pageContext.request.contextPath}/getListCustomer" class="nav-link text-dark">
                <i class="fas fa-users text-dark"></i> List Customer
            </a>
            <a href="${pageContext.request.contextPath}/getListCustomer" class="nav-link text-dark">
                <i class="fas fa-box text-dark"></i> List Product
            </a>
            <a href="${pageContext.request.contextPath}/admin/MemberURL" class="nav-link text-dark">
                <i class="fas fa-medal text-dark"></i> List Member Ranking
            </a>
            <a href="${pageContext.request.contextPath}/jsp/admin/Statistic.jsp" class="nav-link text-dark">
                <i class="fas fa-chart-line text-dark"></i> Statistic
            </a>
        </div>
    </nav>
</div>
