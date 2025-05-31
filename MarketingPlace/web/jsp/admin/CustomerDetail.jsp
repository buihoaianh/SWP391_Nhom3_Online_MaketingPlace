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
            ResultSet rsPro = (ResultSet) request.getAttribute("rsPro");
        %>
        <div class="d-flex">
                <div style="width: 100%; height: calc(100vh - 118px); overflow-y: auto" class="container">
                    <div class="d-flex justify-content-between align-items-center">
                        <p style="color: #dd3726; font-size: 40px; font-weight: 700">Chi tiết khách hàng</p>
                    </div>
                    <div class="row">
                        <div class="col-12 table-responsive-lg">
                            <table class="table table-bordered text-center">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Đơn giá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%if (rsPro.isBeforeFirst()) {
                                     int index = 0;
                                     while (rsPro.next()) {
                                       index++;
                                %>
                                <tr>
                                    <th><%=index%></th>
                                    <td><%=rsPro.getString("ProductName")%></td>
                                    <td><%=rsPro.getInt("Quantity")%></td>
                                    <td><%=rsPro.getInt("UnitPrice")%></td>
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
