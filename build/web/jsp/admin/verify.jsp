<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Verify OTP</title></head>
<body>
    <h2>Nhập mã OTP đã gửi đến email</h2>
    <form action="${pageContext.request.contextPath}/VerifyAccount" method="post">
        <input type="text" name="otp" placeholder="Nhập OTP" required>
        <button type="submit">Xác minh</button>
    </form>

    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {
    %>
        <p style="color: red;"><%= msg %></p>
    <%
        }
    %>
</body>
</html>
