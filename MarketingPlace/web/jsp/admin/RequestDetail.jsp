<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Seller Profile</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/list-seller.css" rel="stylesheet">
</head>
<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <%@ include file="../../components/sidebarAdmin.jsp" %>

        <div class="content py-4 px-5">
            <div class="card mx-auto" style="max-width:900px;">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0">Seller Request Profile</h3>
                </div>
                <div class="card-body px-4">
                    <c:if test="${not empty u}">
                        <div class="row">
                            <div class="col-md-4 text-center">
                                <c:choose>
                                    <c:when test="${not empty u.imageURL}">
                                        <img src="${u.imageURL}" alt="Avatar" class="mb-3"
                                             style="width:230px;height:280px;object-fit:cover;
                                                    border-radius:12px;border:2px solid #ddd;">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${u.imageURL}" alt="Avatar" class="mb-3"
                                             style="width:230px;height:280px;object-fit:cover;
                                                    border-radius:12px;border:2px solid #ddd;">
                                    </c:otherwise>
                                </c:choose>
                                <h3 class="card-title mb-1" style="font-size:1.5rem;">
                                    ${u.fullName}
                                </h3>
                                <p class="text-secondary mb-3" style="font-size:1.1rem;">
                                    Account ID: ${u.accountID}
                                </p>
                            </div>
                            <div class="col-md-8">
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr><th class="w-25">Role ID</th><td>${u.roleID}</td></tr>
                                        <tr><th>Email</th><td>${u.email}</td></tr>
                                        <tr><th>Phone Number</th><td>${u.phoneNumber}</td></tr>
                                        <tr><th>Address</th><td>${u.address}</td></tr>
                                        <tr>
                                            <th>Create Date</th>
                                            
                                            <td>${u.createDate}</td>
                                        </tr>
                                        <tr>
                                            <th>Status</th>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${r.status eq 'Active'}">
                                                        <span class="badge bg-success">Active</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-secondary">Inactive</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr><th>Description</th><td>${u.description}</td></tr>
                                    </tbody>
                                </table>

                                <div class="mt-3">
                                    <c:choose>
                                        
                                        <c:when test="${empty r.status}">
                                            <form action="${pageContext.request.contextPath}/admin/request/update" method="get" style="display:inline;">
                                                <input type="hidden" name="action" value="approve"/>
                                                <input type="hidden" name="id"     value="${r.requestId}"/>
                                                <button type="submit" class="btn btn-success btn-sm">
                                                  Approve </button>
                                            </form>
                                            
                                            <form action="${pageContext.request.contextPath}/admin/request/reject" method="post" style="display:inline;" accept-charset="UTF-8">
                                                <input type="hidden" name="requestId" value="${r.requestId}">
                                                <input type="text" name="reason" class="form-control form-control-sm"  placeholder="Nhập lý do từ chối…" required style="width:200px;"/>
                                                <button type="submit" class="btn btn-danger btn-sm">Reject</button>
                                            </form>
                                            <a href="${pageContext.request.contextPath}/admin/requests"
                                               class="btn btn-secondary btn-sm">← Back to List</a>
                                        </c:when>
                                        
                                        <c:when test="${r.status eq 'Active'}">
                                            <form action="${pageContext.request.contextPath}/admin/request/update"method="post" class="modal-content" accept-charset="UTF-8">
                                                <input type="hidden" name="id" value="${r.requestId}"/>
                                                <input type="hidden" name="action" value="reject"/>
                                                <div class="modal-header">
                                                  <h6 class="modal-title">Reason to Reject</h6>
                                                  <button type="button" class="btn-close"
                                                          data-bs-dismiss="modal"></button>
                                                </div>
                                                 <input type="text" name="reason" class="form-control form-control-sm me-2" placeholder="Nhập lý do từ chối…"requiredstyle="flex: 1;"/>
                                                
                                                <div class="modal-footer">
                                                  <button type="button" class="btn btn-secondary"
                                                          data-bs-dismiss="modal">Cancel</button>
                                                  <button type="submit" class="btn btn-danger">Reject</button>
                                            </div>
                                          </form>
                                            <a href="${pageContext.request.contextPath}/admin/requests"
                                               class="btn btn-secondary btn-sm">← Back to List</a>
                                        </c:when>
                                        
                                        <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/admin/requests"
                                               class="btn btn-secondary btn-sm">← Back to List</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${empty u}">
                        <div class="alert alert-danger">Not find seller's information</div>
                        <a href="${pageContext.request.contextPath}/admin/requests"
                           class="btn btn-secondary btn-sm">← Back to List</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    
    <div class="modal fade" id="rejectModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog">
        <form action="${pageContext.request.contextPath}/admin/request/update"
              method="post" class="modal-content">
          <input type="hidden" name="id" value="${r.requestId}"/>
          <input type="hidden" name="action" value="reject"/>
          <div class="modal-header">
            <h5 class="modal-title">Reason to Reject</h5>
            <button type="button" class="btn-close"
                    data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body">
            <textarea name="reason"
                      class="form-control"
                      rows="4"
                      placeholder="Nhập lý do..."
                      required></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary"
                    data-bs-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-danger">Reject</button>
          </div>
        </form>
      </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
