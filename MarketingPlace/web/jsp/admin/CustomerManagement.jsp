<%-- 
    Document   : ListBrand
    Created on : May 24, 2025, 11:22:14 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ResultSet rsCus = (ResultSet) request.getAttribute("rsCus");
            int totalPage = (int) request.getAttribute("totalPage");
            int currentPage = (int) request.getAttribute("currentPage");
        %>
        <div class="d-flex">
                <div style="width: 100%; height: calc(100vh - 118px); overflow-y: auto" class="container">
                    <div class="d-flex justify-content-between align-items-center">
                        <p style="color: #dd3726; font-size: 40px; font-weight: 700">Quản khách hàng</p>
                    </div>
                    <div class="row">
                        <div class="col-12 table-responsive-lg">
                            <table class="table table-bordered text-center">
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
                                        <a href="getDetailCustomer?customerId=<%=rsCus.getInt("AccountID")%>">Chi tiết</a>
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
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item <%=currentPage == 1 ? "disabled" : ""%>"><a class="page-link" href="getListCustomer?currentPage=<%=currentPage-1%>">Previous</a></li>
                                <%for(int i = 1; i <= totalPage; i++) { %>
                                <li class="page-item <%=currentPage == i ? "active" : ""%>"><a class="page-link" href="getListCustomer?currentPage=<%=i%>"><%=i%></a></li>
                                <%}%>
                                <li class="page-item <%=currentPage == totalPage ? "disabled" : ""%>"><a class="page-link" href="getListCustomer?currentPage=<%=currentPage+1%>">Next</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function handleRedirect() {
                window.location.href = "createLaptop";
            }
        </script>
    </body>
</html>
